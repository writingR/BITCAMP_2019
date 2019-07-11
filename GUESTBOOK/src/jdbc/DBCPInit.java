package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {

		loadJdbcDriver();
		initConnectionPool();

	}

	private void loadJdbcDriver() {
		try {
			// 커넥션 풀이 내부에서 사용할 jdbc 드라이버를 로딩함.
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("mysql 데이터베이스 드라이버 로드 성공...!!!!");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		
		try {
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
			String username = "bit";
			String pw = "bit";
			
			
			//커넥션풀이 새로운 커넥션을 생성할 때 사용할 커넥션팩토리를 생성.
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriver, username, pw);
			
			// PoolableConnection을 생성하는 팩토리 생성.
			// DBCP는 커넥션을 보관할 때 PoolableConnection 을 사용
			// 실제 커넥션을 담고 있있으며, 커넥션 풀을 관리하는데 필요한 기능을 제공한다.
			// 커넥션을 close하면 종료하지 않고 커넥션 풀에 반환
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			//커넥션이 유효한지 여부를 검사할 때 사용하는 쿼리를 지정한다.
			poolableConnFactory.setValidationQuery("select 1");
			//커넥션 풀의 설정 정보를 생성한다.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			//유휴 커넥션 검사 주기
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			//풀에 보관중인 커넥션이 유효한지 검사할지 유무 설정
			poolConfig.setTestWhileIdle(true);
			
			//커넥션 최소 개수
			poolConfig.setMinIdle(4);
			//커넥션 최대 개수
			poolConfig.setMaxTotal(50);
			//커넥션 풀을 생성. 생성자는 PoolabeConnectionFactory와 GenericObjectPoolConfig를 사용
			GenericObjectPool<PoolableConnection> connectionPool =
			new GenericObjectPool<>(poolableConnFactory, poolConfig);
			//PoolabeConnectionFactory에도 커넥션 풀을 연결
			poolableConnFactory.setPool(connectionPool);
			//커넥션 풀을 제공하는 jdbc 드라이버를 등록.
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			
			
			
			//위에서 커넥션 풀 드라이버에 생성한 커넥션 풀을 등록한다. 이름은 pool 이다.
			driver.registerPool("pool", connectionPool); //jdbc:apache:commons:dbcp:pool
			System.out.println("컨넥션 풀 등록 !!!!!");
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}

	}

	

}

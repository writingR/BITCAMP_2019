package com.bitcamp.guest.jdbc;

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
			// Ŀ�ؼ� Ǯ�� ���ο��� ����� jdbc ����̹��� �ε���.
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("mysql 접속성공...!!!!");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		
		try {
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
			String username = "scott";
			String pw = "tiger";
			
			
			//Ŀ�ؼ�Ǯ�� ���ο� Ŀ�ؼ��� ������ �� ����� Ŀ�ؼ����丮�� ����.
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriver, username, pw);
			
			// PoolableConnection�� �����ϴ� ���丮 ����.
			// DBCP�� Ŀ�ؼ��� ������ �� PoolableConnection �� ���
			// ���� Ŀ�ؼ��� ��� ��������, Ŀ�ؼ� Ǯ�� �����ϴµ� �ʿ��� ����� �����Ѵ�.
			// Ŀ�ؼ��� close�ϸ� �������� �ʰ� Ŀ�ؼ� Ǯ�� ��ȯ
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			//Ŀ�ؼ��� ��ȿ���� ���θ� �˻��� �� ����ϴ� ������ �����Ѵ�.
			poolableConnFactory.setValidationQuery("select 1");
			//Ŀ�ؼ� Ǯ�� ���� ������ �����Ѵ�.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			//���� Ŀ�ؼ� �˻� �ֱ�
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			//Ǯ�� �������� Ŀ�ؼ��� ��ȿ���� �˻����� ���� ����
			poolConfig.setTestWhileIdle(true);
			
			//Ŀ�ؼ� �ּ� ����
			poolConfig.setMinIdle(4);
			//Ŀ�ؼ� �ִ� ����
			poolConfig.setMaxTotal(50);
			//Ŀ�ؼ� Ǯ�� ����. �����ڴ� PoolabeConnectionFactory�� GenericObjectPoolConfig�� ���
			GenericObjectPool<PoolableConnection> connectionPool =
			new GenericObjectPool<>(poolableConnFactory, poolConfig);
			//PoolabeConnectionFactory���� Ŀ�ؼ� Ǯ�� ����
			poolableConnFactory.setPool(connectionPool);
			//Ŀ�ؼ� Ǯ�� �����ϴ� jdbc ����̹��� ���.
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			
			
			
			//������ Ŀ�ؼ� Ǯ ����̹��� ������ Ŀ�ؼ� Ǯ�� ����Ѵ�. �̸��� pool �̴�.
			driver.registerPool("pool", connectionPool); //jdbc:apache:commons:dbcp:pool
			System.out.println("DB접속 성공");
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}

	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
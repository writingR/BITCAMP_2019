package jdbc;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	
	//PreparedStatement는 close()해줄 필요가 없다. Statement를 상속하고 있기때문에!
	
	public static void close(ResultSet rs) {
		// null이 아니면 벗어날 수 있도록  --> (rs = null)이 될 경우 nullpointException이 발생하게 된다.
		if(rs != null) {
			      try  {
			    	  	rs.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	
	// 다형성으로 인해 PreparedStatement도 close처리가 같이 처리될 수 있다.
	public static void close(Statement stmt) {
		// null이 아니면 벗어날 수 있도록  --> (rs = null)이 될 경우 nullpointException이 발생하게 된다.
		if(stmt != null) {
			      try  {
			    	  	stmt.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	public static void close(Connection conn) {
		// null이 아니면 벗어날 수 있도록  --> (rs = null)이 될 경우 nullpointException이 발생하게 된다.
		if(conn != null) {
			      try  {
			    	  	conn.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	public static void rollback(Connection conn) {
		// null이 아니면 벗어날 수 있도록  --> (rs = null)이 될 경우 nullpointException이 발생하게 된다.
		if(conn != null) {
			      try  {
			    	  	conn.rollback();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	
}

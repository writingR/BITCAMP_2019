package jdbc;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	
	//PreparedStatement�� close()���� �ʿ䰡 ����. Statement�� ����ϰ� �ֱ⶧����!
	
	public static void close(ResultSet rs) {
		// null�� �ƴϸ� ��� �� �ֵ���  --> (rs = null)�� �� ��� nullpointException�� �߻��ϰ� �ȴ�.
		if(rs != null) {
			      try  {
			    	  	rs.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	
	// ���������� ���� PreparedStatement�� closeó���� ���� ó���� �� �ִ�.
	public static void close(Statement stmt) {
		// null�� �ƴϸ� ��� �� �ֵ���  --> (rs = null)�� �� ��� nullpointException�� �߻��ϰ� �ȴ�.
		if(stmt != null) {
			      try  {
			    	  	stmt.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	public static void close(Connection conn) {
		// null�� �ƴϸ� ��� �� �ֵ���  --> (rs = null)�� �� ��� nullpointException�� �߻��ϰ� �ȴ�.
		if(conn != null) {
			      try  {
			    	  	conn.close();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	public static void rollback(Connection conn) {
		// null�� �ƴϸ� ��� �� �ֵ���  --> (rs = null)�� �� ��� nullpointException�� �߻��ϰ� �ȴ�.
		if(conn != null) {
			      try  {
			    	  	conn.rollback();
			      } catch (SQLException e) {
			    	  e.printStackTrace();
			      }
		}
	}
	
	
}

package guestbook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

// Dao �� �̱���ó�� �ؾ���. Data Access Object
public class MessageDao {

	// �̱��� ó�� ���� ******
	
	// ���� �������� ���ϵ��� privateó��
	private static MessageDao Dao = new MessageDao();
	
	public static MessageDao getInstance() {
		return Dao;
	}
	
	//��ü�� �����ϰ� �����͸� ���� �� ������ ������ �� �ֵ��� �޼��� ����
	private MessageDao() {}
	
	// �̱���ó�� �� *******
	
	public int insert(Connection conn,Message message){
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO GUESTBOOK_MESSAGE (GUEST_NAME,PASSWORD,MESSAGE) VALUES (?, ?, ?)";
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, message.getGuestName());
		pstmt.setString(2, message.getPassword());
		pstmt.setString(3, message.getMessage());
		
		rCnt =  pstmt.executeUpdate();
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		return rCnt;
		
	}
	
	public  Message select(Connection conn, int messageId) {
		
		Message message = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String sql = "select * from GUESTBOOK_MESSAGE where MESSAE_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				message = new Message();
				message.setId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getString(4));
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
				
		return message;
	}

	public static int selectCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
	
		int totalCnt = 0;
		
		String sql = "select COUNT(*) from GUESTBOOK_MESSAGE";
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return totalCnt;
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) {
		
		List<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// rownum mysql  ----> limit ?, ?  --> ���۹�ȣ�� , �о�ð���   
		String sql = "select * from GUESTBOOK_MESSAGE order by MESSAE_ID desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Message msg = new Message();
				msg.setId(rs.getInt(1));
				msg.setGuestName(rs.getString(2));
				msg.setPassword(rs.getString(3));
				msg.setMessage(rs.getString(4));
				
				list.add(msg);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	
}

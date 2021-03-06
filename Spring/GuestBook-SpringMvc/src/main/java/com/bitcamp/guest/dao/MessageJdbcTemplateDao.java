package com.bitcamp.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.JdbcUtil;



@Repository("jdbcTemplateDao")
public class MessageJdbcTemplateDao { // messageDao
	
	@Autowired
	JdbcTemplate template;
	
	public int insert(Message message ) {
		
		
		String sql = "INSERT INTO GUESTBOOK_MESSAGE "
				+ " (GUEST_NAME, PASSWORD, MESSAGE) "
					 + "values (?,?,?)";
		
		 return template.update(sql,
									message.getGuestName(),
									message.getPassword(),
									message.getMessage()
									);
			}

	public int insert(Connection conn, Message message) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO GUESTBOOK_MESSAGE "
				+ " (GUEST_NAME, PASSWORD, MESSAGE) "
					 + "values (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			
			rCnt =  pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}	
		
		return rCnt;
	}

	
	public Message select(int messageId) {
		
		String sql = "select * from guestbook_message where message_id=?";
		
		return  template.queryForObject(sql, new MessageRowMapper(),messageId);
		//return template.query(sql, new MessageRowMapper(), messageId).get(0);
		
	}
	
	
	public Message select(Connection conn, int messageId) {
		
		Message message = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from guestbook_message where message_id=?";
		
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return message;
		
	}

	
	
	
	public int selectCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;
		
		String sql = "select count(*) from guestbook_message" ;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if( rs.next() ) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	public int selectCount() {
		
		return template.queryForObject("select count(*) from guestbook_message", Integer.class);
	}
	
	/* public List<Message> selectList(Connection conn, int firstRow, int endRow) */
	public List<Message> selectList(int firstRow, int MESSAGE_COUNT_PER_PAGE) {

		String sql = "SELECT * FROM guestbook_message WHERE message_id ORDER BY message_id DESC LIMIT ?,?";

		
		return template.query(sql, 
				new MessageRowMapper(),
				firstRow,
				MESSAGE_COUNT_PER_PAGE
				);
	}

	
	public int deleteMessage(int messageId) {
		
		String sql = "delete from guestbook_message where message_id=?";
		
		return template.update(sql,messageId);
		
	}
	
	
	
	public int deleteMessage(Connection conn, int messageId) throws SQLException {
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from guestbook_message where message_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			resultCnt = pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);			
		}
		
		return resultCnt;
		
	}
	
	
	
	
	
	
	
	
	
	
}
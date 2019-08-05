package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("writeService")
public class WriteMessageService implements GuestBookService {
	
	@Autowired
	private MessageDao dao;
	
	public int write(Message message) {
		
		int rCnt = 0 ;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//MessageDao dao = MessageDao.getInstance();
			
			rCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return rCnt;	
		
	}

}


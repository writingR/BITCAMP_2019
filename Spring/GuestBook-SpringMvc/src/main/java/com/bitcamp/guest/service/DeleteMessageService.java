package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.ConnectionProvider;
import com.bitcamp.guest.jdbc.JdbcUtil;


@Service("deleteService")
public class DeleteMessageService implements GuestBookService {
	
	/*
	 * @Autowired private MessageDao dao;
	 */
	@Autowired
	private MessageJdbcTemplateDao dao;
	
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		
		int resultCnt = 0;
		
		Connection conn=null;
		
		try {
			//conn = ConnectionProvider.getConnection();
			
			// 트렌젝션 처리
			//conn.setAutoCommit(false);
			
			
			// Message Dao 필요  
			//MessageDao dao = MessageDao.getInstance();
			// 1. 전달받은 게시물 아이디로 게시물 확인
			Message message = dao.select(messageId);
			
			// 2. 게시물이 존재 하지 않으면 예외 처리
			if(message == null) {
				throw new MessageNotFoundException("메시지가 존재하지 않습니다. : " + messageId);
			
			}			
			
			// 3. 게시물이 존재 하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
			// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린경우 예외처리
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			// 비밀번호 비교
			if(!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
				
			// 5. 비밀번호가 일치하면 정상 처리(삭제) ->  commit
			
			resultCnt = dao.deleteMessage(messageId);
			
			// 정상 처리
			//conn.commit();
			
		} catch (MessageNotFoundException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
			
		} catch (InvalidMessagePasswordException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		
		return resultCnt;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
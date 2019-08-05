package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.domain.MessageListView;
import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("listServie")
public class GetMessageListService implements GuestBookService {

	
	@Autowired
	private MessageDao dao;
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageListView(int pageNumber) {

		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		MessageListView view = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
		
			
			/* MessageDao dao = MessageDao.getInstance(); */
	
			int messageTotalCount = dao.selectCount(conn);
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			
			
			if(messageTotalCount > 0 ) {
	            firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE ;
	            endRow = MESSAGE_COUNT_PER_PAGE ;
	            messageList = dao.selectList(conn, firstRow, endRow);
	                  
	         } else {
	            currentPageNumber = 0;
	            messageList = Collections.emptyList();
	         }
			
			/*
			 * if(messageTotalCount > 0) {
			 * 
			 * firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1; 
			 * endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			 * messageList = dao.selectList(conn, firstRow, endRow);
			 * 
			 * } else { currentPageNumber = 0; messageList = Collections.emptyList(); }
			 */
			
			view = new MessageListView(messageTotalCount, 
										currentPageNumber, 
										messageList, 
										MESSAGE_COUNT_PER_PAGE, 
										firstRow, 
										endRow);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}

	
	
}
package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import guestbook.model.Message;
import guestbook.model.MessageDao;
import guestbook.model.MessageListView;
import jdbc.connection.ConnectionProvider;

public class GetMessageListService {
	
	// MessageListView를 생성해서 결과로 반환
	
	private GetMessageListService() {}
	
	private static GetMessageListService service = new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		
		return service;
	}
	
	// 1. 한페이지에 보여줄 게시글의 개수
	
	private static final int MESSAGE_COUNT_PER_PAGE =3;
	
	public MessageListView getMassageListView(int pageNumber) {
		
	// 2. 현재 페이지 번호	
		
		Connection conn;
		
		MessageListView view = null;
		
		int currentPageNumber = pageNumber;
		
		
		
			try {
				
				// Connection
				conn = ConnectionProvider.getConnection();
				// DAO
				MessageDao dao = MessageDao.getInstance();
				// 전체 게시물의 개수
				int messageTotalCount = MessageDao.selectCount(conn);
				
				// 게시물 내용 리스트, DB 검색에 사용할 firstRow, endRow
				List<Message> messageList = null;
				int firstRow = 0;
				int endRow = 0;
			
				if(messageTotalCount > 0) {
					
					
					// ex) 1페이지  firstRow = 1-1 * 0 + 1   ---> 1
					//           endRow = 1 + 3 -1   ----> 3
					firstRow = (pageNumber -1) * MESSAGE_COUNT_PER_PAGE +1; 
					endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
					
					messageList = dao.selectList(conn,firstRow,endRow);
					
				} else {
					currentPageNumber = 0;
					messageList = Collections.emptyList();
				}
				
				view = new MessageListView(messageTotalCount, currentPageNumber, messageList, MESSAGE_COUNT_PER_PAGE, firstRow,endRow);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			
			return view;
	}
	
	
	
	
	
}

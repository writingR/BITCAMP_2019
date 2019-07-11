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
	
	// MessageListView�� �����ؼ� ����� ��ȯ
	
	private GetMessageListService() {}
	
	private static GetMessageListService service = new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		
		return service;
	}
	
	// 1. ���������� ������ �Խñ��� ����
	
	private static final int MESSAGE_COUNT_PER_PAGE =3;
	
	public MessageListView getMassageListView(int pageNumber) {
		
	// 2. ���� ������ ��ȣ	
		
		Connection conn;
		
		MessageListView view = null;
		
		int currentPageNumber = pageNumber;
		
		
		
			try {
				
				// Connection
				conn = ConnectionProvider.getConnection();
				// DAO
				MessageDao dao = MessageDao.getInstance();
				// ��ü �Խù��� ����
				int messageTotalCount = MessageDao.selectCount(conn);
				
				// �Խù� ���� ����Ʈ, DB �˻��� ����� firstRow, endRow
				List<Message> messageList = null;
				int firstRow = 0;
				int endRow = 0;
			
				if(messageTotalCount > 0) {
					
					
					// ex) 1������  firstRow = 1-1 * 0 + 1   ---> 1
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

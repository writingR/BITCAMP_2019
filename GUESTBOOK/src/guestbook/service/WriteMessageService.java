package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.model.Message;
import guestbook.model.MessageDao;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	
	
	// 외부에서 데이터를 생성, 수정을 하지 못하도록 private statatic 처리함 (싱글톤)
	private static WriteMessageService service = 
							new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return service;
	}
	
	private WriteMessageService() {}
	
	// 싱글톤처리 끝 ***************
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1.Connection 생성
		
		Connection conn = null;
		
		try {
		 
		conn = ConnectionProvider.getConnection();
		MessageDao dao = MessageDao.getInstance();
		
		 rCnt = dao.insert(conn, message);
		// 2.Dao 생성
		// 3.insert 메서드실행
		
		  
		  
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  

		return rCnt;
		
	}
	
	
	
}

package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.model.Message;
import guestbook.model.MessageDao;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	
	
	// �ܺο��� �����͸� ����, ������ ���� ���ϵ��� private statatic ó���� (�̱���)
	private static WriteMessageService service = 
							new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return service;
	}
	
	private WriteMessageService() {}
	
	// �̱���ó�� �� ***************
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1.Connection ����
		
		Connection conn = null;
		
		try {
		 
		conn = ConnectionProvider.getConnection();
		MessageDao dao = MessageDao.getInstance();
		
		 rCnt = dao.insert(conn, message);
		// 2.Dao ����
		// 3.insert �޼������
		
		  
		  
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  

		return rCnt;
		
	}
	
	
	
}

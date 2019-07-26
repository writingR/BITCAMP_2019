package membermanager.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import membermanager.member.model.MemberInfo;

public class MemberDao {
	
	private MemberDao() {}
	
	private static MemberDao dao = new MemberDao();
	
	public static MemberDao getInstance() {
		return dao;
	}

	public MemberInfo selectMemberById(Connection conn, String uId) {
		
		MemberInfo memberInfo = null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("dao : memberId -> " + uId);
		
		String sql = "select * from member where uId=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,uId);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.next()) {
				System.out.println("check ::::::::::::::::::::::::");
				memberInfo = new MemberInfo(
					rs.getInt("idx"), 
					rs.getString("uId"), 
					rs.getString("uPw"), 
					rs.getString("uName"), 
					rs.getString("uPhoto"), 
					null);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbc.JdbcUtil.close(rs);
			jdbc.JdbcUtil.close(pstmt);
		}
		
		
		return memberInfo;
	}

	public int insertMember(Connection conn, MemberInfo memberInfo) {
		
		PreparedStatement pstmt = null;
		
		int rCnt = 0;
		
		String sql = "insert into member (uId, uName, uPw, uPhoto) values (?,?,?,?) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getuId());
			pstmt.setString(2, memberInfo.getuName());
			pstmt.setString(3, memberInfo.getuPw());
			pstmt.setString(4, memberInfo.getuPhoto());
			rCnt = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
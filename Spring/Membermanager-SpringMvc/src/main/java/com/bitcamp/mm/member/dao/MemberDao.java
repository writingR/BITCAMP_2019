package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("dao") // 이름 따로 지정하지 않으면 default 값 memberDao
public class MemberDao {

   public MemberInfo selectMemberById(Connection conn, String userId) {
      
      MemberInfo memberInfo = null;
      
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      System.out.println("dao : memberId -> " + userId);
      
      String sql = "select * from member where uId=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1,userId);
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
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
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

   public List<MemberInfo> selectList(Connection conn, int index, int count) {
      
      List<MemberInfo> memberList = new ArrayList<MemberInfo>();
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "SELECT * FROM member limit ?, ?";
      
      try {
         pstmt = conn.prepareStatement(sql); // ? 가 없는데 preapre한 이유는 검색을 위해
         pstmt.setInt(1, index);
         pstmt.setInt(2, count);
         
         rs = pstmt.executeQuery();
         while(rs.next()) {
            memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("uId"), 
                                 rs.getString("uPw"), rs.getString("uName"), 
                                 rs.getString("uPhoto"), new Date(rs.getDate("regDate").getTime())));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return memberList;
   }

   public int selectTotalCount(Connection conn, SearchParam searchParam) {
      int totalCnt = 0;
      
      Statement stmt = null;
      ResultSet rs = null;
      
      String sql = "select count(*) from member";
      
      if(searchParam != null) {
         sql = "select count(*) from member where ";
         if(searchParam.getStype().equals("both")) {
            sql += " uid like '%"+searchParam.getKeyword()+"%' or uname  like '%"+searchParam.getKeyword()+"%' ";
         }
         if(searchParam.getStype().equals("id")) {
            sql += " uid  like '%"+searchParam.getKeyword()+ "%'";
         }
         if(searchParam.getStype().equals("name")) {
            sql += " uname  like '%"+searchParam.getKeyword()+"%' ";
         }
         
      }
      
      try {
         stmt = conn.createStatement();
         
         rs = stmt.executeQuery(sql);
         
         if(rs.next()) {
            totalCnt = rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return totalCnt;
   }

   public List<MemberInfo> selectListById(Connection conn, int index, int count, SearchParam searchParam) {
	
	   List<MemberInfo> memberList = new ArrayList();
	   
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	  
	   String sql = "SELECT * FROM member WHERE uId LIKE ?  LIMIT ?,?";
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
		pstmt.setInt(2, index);
		pstmt.setInt(3, count);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			memberList.add(new MemberInfo(
						   rs.getInt("idx"), 
						   rs.getString("uId"), 
						   rs.getString("uPw"), 
						   rs.getString("uName"), 
						   rs.getString("uPhoto"), 
						   new Date(rs.getDate("regDate").getTime())));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	   return memberList;
   }

   public List<MemberInfo> selectListByName(Connection conn, int index, int count, SearchParam searchParam) {
	
	   List<MemberInfo> memberList = new ArrayList<MemberInfo>();
	   
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   String sql = "SELECT * FROM member WHERE uName like ? LIMIT ?,? ";
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
		pstmt.setInt(2, index);
		pstmt.setInt(3, count);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			memberList.add(new MemberInfo(
						   rs.getInt("idx"), 
						   rs.getString("uId"), 
						   rs.getString("uPw"), 
						   rs.getString("uName"), 
						   rs.getString("uPhoto"), 
						   new Date(rs.getDate("regDate").getTime())));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	   
	   return memberList;
   }

   public List<MemberInfo> selectListByBoth(Connection conn, int index, int count, SearchParam searchParam) {
	
	   List<MemberInfo> memberList = new ArrayList<MemberInfo>();
	   
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   String sql = "SELECT * FROM member WHERE uId like ? or uName like ? LIMIT ?,?";
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
		pstmt.setString(2, "%"+searchParam.getKeyword()+"%");
		pstmt.setInt(3, index);
		pstmt.setInt(4, count);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			memberList.add(new MemberInfo(
						   rs.getInt("idx"), 
						   rs.getString("uId"), 
						   rs.getString("uPw"), 
						   rs.getString("uName"), 
						   rs.getString("uPhoto"), 
						   new Date(rs.getDate("regDate").getTime())));
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			   
			   
	   
	   
	   return memberList;
   }
   
   

}
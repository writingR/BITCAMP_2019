package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBC_Example {

	public static void main(String[] args) {
		Connection conn = null;
		
		// 1.데이터베이스 드라이버 로드
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    
			// 2.데이터베이스 연결
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC","bit","bit");
				
			System.out.println("mysql 데이터베이스에 접속했습니다.");
			
			
			// 3.Statement 객체생성
			// (1).statement는 왜 생성해야 하는가?
			Statement stmt = conn.createStatement();
			
		
		
		// INSERT 	
		String sql = "insert into EMP values (?,?,?,?,?,?,?,?)";
		// (2).PreparedStatement는 어떤 기능을 하는가?
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		//EMPNO(Int), ENAME(String), JOB(String), MGR(Int), HIREDATE(Date), SAL(Int), COMM(Int), DEPTNO(Int)
		pstmt.setInt(1, 9231);
		pstmt.setString(2, "CHOIRN");
		pstmt.setString(3, "MANAGER");
		pstmt.setInt(4, 7351);
		pstmt.setDate(5, java.sql.Date.valueOf("2018-12-13"));
		pstmt.setInt(6, 3500);
		pstmt.setInt(7, 100);
		pstmt.setInt(8, 30);
		//pstmt.executeUpdate();
		
		
		// UPDATE문으로 원하는 조건 수정하기
		String sql2 = "update EMP set sal=? where ename='SCOTT'";
		PreparedStatement pUdt = conn.prepareStatement(sql2);
		// 사원 'SCOTT'의 이름을 찾아 --> sal을 1000으로 변경시켜준다. 
		pUdt.setInt(1,1000);
		pUdt.executeUpdate();
		
		
		// Select문으로 원하는 조건 출력하기  --> select문은 ResultSet --> while문을 통해 원하는 데이터를 출력한다.
		String sql3 = "select * from EMP where ENAME = 'SCOTT'";
		PreparedStatement pSel = conn.prepareStatement(sql3);
		ResultSet rs1 = pSel.executeQuery();
		while(rs1.next()) {
			 System.out.println("사원번호 "+rs1.getInt(1));
			 System.out.println("사원이름 " +rs1.getString(2));
			 System.out.println("직급 " +rs1.getString(3));
			 System.out.println("담당자 " +rs1.getInt(4));
			 System.out.println("입사일 " +rs1.getDate(5));
			 System.out.println("급여 " +rs1.getInt(6));
			 System.out.println("커미션 " +rs1.getInt(7));
			 System.out.println("부서번호 " +rs1.getInt(8));
			 System.out.println("-------------------------------");
		 }
	 
	
		// 4.SQL 실행 : SELECT / INSERT/ UPDATE / DELETE
		String sql1 = "select * from EMP order by ENAME";
		
		ResultSet rs = stmt.executeQuery(sql1); 
		
		
		// 5.결과출력
		System.out.println("-------------------------------");
		 
		 while(rs.next()) {
			 System.out.println("사원번호 "+rs.getInt(1));
			 System.out.println("사원이름 " +rs.getString(2));
			 System.out.println("직급 " +rs.getString(3));
			 System.out.println("담당자 " +rs.getInt(4));
			 System.out.println("입사일 " +rs.getDate(5));
			 System.out.println("급여 " +rs.getInt(6));
			 System.out.println("커미션 " +rs.getInt(7));
			 System.out.println("부서번호 " +rs.getInt(8));
			 System.out.println("-------------------------------");
		 }
		
		 
		// 6.사용 객체 CLOSE : ResultSet, Statement, Connection 
		rs.close();
		stmt.close();
		conn.close();
		pstmt.close();
		
		
		 
		 

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}

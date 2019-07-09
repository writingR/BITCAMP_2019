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
		
		// 1.�����ͺ��̽� ����̹� �ε�
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    
			// 2.�����ͺ��̽� ����
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC","bit","bit");
				
			System.out.println("mysql �����ͺ��̽��� �����߽��ϴ�.");
			
			
			// 3.Statement ��ü����
			// (1).statement�� �� �����ؾ� �ϴ°�?
			Statement stmt = conn.createStatement();
			
		
		
		// INSERT 	
		String sql = "insert into EMP values (?,?,?,?,?,?,?,?)";
		// (2).PreparedStatement�� � ����� �ϴ°�?
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
		
		
		// UPDATE������ ���ϴ� ���� �����ϱ�
		String sql2 = "update EMP set sal=? where ename='SCOTT'";
		PreparedStatement pUdt = conn.prepareStatement(sql2);
		// ��� 'SCOTT'�� �̸��� ã�� --> sal�� 1000���� ��������ش�. 
		pUdt.setInt(1,1000);
		pUdt.executeUpdate();
		
		
		// Select������ ���ϴ� ���� ����ϱ�  --> select���� ResultSet --> while���� ���� ���ϴ� �����͸� ����Ѵ�.
		String sql3 = "select * from EMP where ENAME = 'SCOTT'";
		PreparedStatement pSel = conn.prepareStatement(sql3);
		ResultSet rs1 = pSel.executeQuery();
		while(rs1.next()) {
			 System.out.println("�����ȣ "+rs1.getInt(1));
			 System.out.println("����̸� " +rs1.getString(2));
			 System.out.println("���� " +rs1.getString(3));
			 System.out.println("����� " +rs1.getInt(4));
			 System.out.println("�Ի��� " +rs1.getDate(5));
			 System.out.println("�޿� " +rs1.getInt(6));
			 System.out.println("Ŀ�̼� " +rs1.getInt(7));
			 System.out.println("�μ���ȣ " +rs1.getInt(8));
			 System.out.println("-------------------------------");
		 }
	 
	
		// 4.SQL ���� : SELECT / INSERT/ UPDATE / DELETE
		String sql1 = "select * from EMP order by ENAME";
		
		ResultSet rs = stmt.executeQuery(sql1); 
		
		
		// 5.������
		System.out.println("-------------------------------");
		 
		 while(rs.next()) {
			 System.out.println("�����ȣ "+rs.getInt(1));
			 System.out.println("����̸� " +rs.getString(2));
			 System.out.println("���� " +rs.getString(3));
			 System.out.println("����� " +rs.getInt(4));
			 System.out.println("�Ի��� " +rs.getDate(5));
			 System.out.println("�޿� " +rs.getInt(6));
			 System.out.println("Ŀ�̼� " +rs.getInt(7));
			 System.out.println("�μ���ȣ " +rs.getInt(8));
			 System.out.println("-------------------------------");
		 }
		
		 
		// 6.��� ��ü CLOSE : ResultSet, Statement, Connection 
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

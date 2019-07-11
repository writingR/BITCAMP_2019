<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     


<%-- <!-- usebean 액션 테그를 이용한 객체 생성 ( 찾고 -> 없을 때 생성 )  -->
<jsp:useBean id="memberInfo" class="member.MemberInfo"/>
<!-- 생성된 객체에 데이터 바인딩 : 폼의 name 속성과 beans 클래스의 변수 이름이 동일해야한다 !!!!!  -->
<jsp:setProperty property="*" name="memberInfo"/>     --%>
    



<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="member" class= "member.MemberInfo" scope="session"/>
<jsp:setProperty property="*" name="member"/> --%>


<%
	
	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
	

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcUrl,"bit","bit");
		
		String sql = "insert into Bmember (rId,iPw,iName) values (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, userId);
		pstmt.setString(2, userPw);
		pstmt.setString(3, userName);
			
		int result = pstmt.executeUpdate();
		System.out.println("*******result*******");
			
		
		
		if(result != 0){
			out.println("<script>");
		    out.println("location.href='login.jsp'");
		    out.println("</script>");
		} else {
			out.println("<script>");
		    out.println("location.href='memberRegForm.jsp'");
		    out.println("</script>");
		}
	
	
	
		} catch (ClassNotFoundException cs){
			cs.printStackTrace();
		} catch(SQLException se){
			se.printStackTrace();
		} 
	
		session.setAttribute("uId", userId);
		response.sendRedirect("index.jsp");
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/memberM/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	.mInfor {
		border : 2px solid #ddd;
		box-shadow: 1px 1px 3px #EEE;
		padding : 10px;
	}
</style>
</head>
<body>

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원가입 페이지</h3>
	<h5>회원가입이 완료되었습니다.</h5>
	 	
	 	<!-- 테이블 행 반복 끝 -->
	 	
	 </table>
	
	
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->



</body>
</html>





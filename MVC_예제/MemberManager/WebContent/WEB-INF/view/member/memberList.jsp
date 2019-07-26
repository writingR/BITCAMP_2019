<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="membermanager.member.model.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${loginInfo eq null}">
<script>
	alert('로그인 후 사용가능 페이지 입니다.');
	location.href='loginForm.do';
</script>
</c:if>
<c:if test="${!(loginInfo eq null)}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	img.sumnail {
		height : 25px;
		margin : 2px;
	}
	
	table {
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
	}
	
	table td {
		padding : 3px;
		border : 1px solid #AAA;
	}
	
	table tr:first-child>td {
		text-align: center;
		background-color: #EEE;
		font-weight: bold;
	}
	
}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/view/frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/view/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->

<%-- <%=request.getRequestURI()%><br> --%>
<div id="contents">
	<h3>회원 리스트</h3>
	<hr>
	<table>
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이미지</td>
			<td>가입일</td>
		</tr>
		
<%	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	     try {
			conn = ConnectionProvider.getConnection();
			System.out.println(conn + "conn memberList.jsp");
			
			pstmt = conn.prepareStatement("SELECT * FROM member ORDER BY idx ASC");
			
			rs = pstmt.executeQuery();
			System.out.println(rs + "rs memberList.jsp");
			
			while(rs.next()) {
	%>			
				<tr>
				<td><%=  rs.getInt("idx") %></td>
				<td><%= rs.getString("uId") %></td>
				<td><%= rs.getString("uPw") %></td>
				<td><%= rs.getString("uName") %></td>
				<td><img class="sumnail" alt="회원 사진" src="<c:url value='/uploadfile/${loginInfo.uPhoto}'/>"> </td>
				<td><%= rs.getString("regDate") %></td>
				<td><a href="#">수정</a> | <a href="#">삭제</a> </td>
				</tr>
    <%				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	 		
	 	}if(rs != null){
	 		try{
	 		pstmt.close();
	 		}catch(SQLException e){
	 			e.printStackTrace();
	 		}
	 	}if(pstmt != null){
	 		try{
	 		pstmt.close();
	 		}catch(SQLException e){
	 			e.printStackTrace();
	 		}
	 	}if(conn != null){
	 		try{
	 		conn.close();
	 		}catch(SQLException e){
	 			e.printStackTrace();
	 		}
	 	}
		    
	%>			
	</table> 
</div>

<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/view/frame/footer.jsp" %>
<!-- 푸터 끝 -->




</body>
</html>
</c:if>
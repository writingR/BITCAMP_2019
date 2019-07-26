<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/mm/css/default.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
%>

<!-- 해더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원가입 요청 처리 페이지</h3>
	<hr>

	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><input type="email" name="uId" value="<%= userId %>" > </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="uPw" value="<%= userPw %>" > </td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="uName" value="<%= userName %>" > </td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="uPhoto"> </td>
		</tr>
		<tr>
			<td></td>
			<td> </td>
		</tr>
	</table>

</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>
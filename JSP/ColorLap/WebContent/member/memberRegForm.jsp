<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../js/bootstrap.js">

<!-- jquery 1.12.4 cdn -->
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- css 시작 -->
<style>

</style>

</head>

<!-- contents -->
<body>
<%
	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
%>

<!-- 헤더 시작 -->
<%@ include file="../body/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비 시작 -->
<%@ include file="../body/nav.jsp" %>
<!-- 네비 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원 가입 페이지</h3>
	<hr>
	<form action="memberRegForm.jsp" method="post">
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><input type="email" name="uId" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="uPw" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="uName" required></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="uPhoto"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->





</body>

</html>
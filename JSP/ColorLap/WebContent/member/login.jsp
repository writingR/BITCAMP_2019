<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
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

<!-- 헤더 시작 -->
<%@ include file="../body/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비 시작 -->
<%@ include file="../body/nav.jsp" %>
<!-- 네비 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>Login</h3>
	<hr>
	<form action="loginProgram.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="uPw"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->

<!-- 푸터 시작 -->
<%@ include file="../body/footer.jsp" %>
<!-- 푸터 끝 -->



</body>

</html>
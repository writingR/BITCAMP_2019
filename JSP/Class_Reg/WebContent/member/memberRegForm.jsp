<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/mm/css/default.css">
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
 request.setCharacterEncoding("utf-8");
%>



<%@ include file="../frame/header.jsp" %>

<%@ include file="../frame/nav.jsp" %>

<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<form action="memberRegPro.jsp" method="post">
		<table>
			<tr>
				<td>이메일(아이디)</td>
				<td>
				<input type="email" name="uId" required>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
				<input type="password" name="uPw" required>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
				<input type="text" name="uName">
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
				<input type="file" name="uPhoto">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../frame/footer.jsp" %>

</body>

</html>
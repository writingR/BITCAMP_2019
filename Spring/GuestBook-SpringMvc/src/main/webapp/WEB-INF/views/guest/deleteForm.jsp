<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>

	<h1>메시지 삭제 비밀번호 확인</h1>
	<form method="post">
	
		${param.message_id}번 메시지를 삭제하시려면 비밀번호를 입력하세요.<br>
		<input type="hidden" name="message_id" value="${param.message_id}">
		비밀번호 <input type="password" name="password" required> <br>
		<input type="submit" value="삭제하기">	
	
	
	</form>

















</body>
</html>
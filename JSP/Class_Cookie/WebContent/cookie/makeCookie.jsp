<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

	<!-- 쿠키 등록 방법 (쿠키를 굽는다.) -->
	<!-- 1.Cookie 객체를 생성 : new Cookie(쿠키이름, 데이터) 2.response 객체에 Cookie를 추가 : response.addCookie(쿠키객체의 참조변수) -->
<%
	Cookie cookie = new Cookie("code","ace");
	// response에 쿠키 객체 추가.
	response.addCookie(cookie);
	
	Cookie c1 = new Cookie("name", "이강인");
	response.addCookie(c1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Cookie</title>
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
	

	<h1>쿠키를 생성했습니다.</h1>


</body>

</html>
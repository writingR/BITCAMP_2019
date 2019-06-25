<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

	<!-- 쿠키 등록 방법 (쿠키를 굽는다.) -->
	<!-- 1.Cookie 객체를 생성 : new Cookie(쿠키이름, 데이터) 2.response 객체에 Cookie를 추가 : response.addCookie(쿠키객체의 참조변수) -->
<%
	/* Cookie cookie = new Cookie("code","ace"); */

	Cookie cookie = CookieBox.createCookie("code", "0");
	// response에 쿠키 객체 추가.
	response.addCookie(cookie);
	
	/* Cookie c1 = new Cookie("name", "choi"); */
	Cookie c1 = CookieBox.createCookie("name", "chio_r");
	response.addCookie(c1);
	
	/* Cookie c2 = new Cookie("id","cool");
	c2.setMaxAge(60); // 시간은 1분으로 처리. */
	
	Cookie c2 = CookieBox.createCookie("nicName", "hot", 60*30);
	response.addCookie(c2);
	
	/* Cookie c3 = new Cookie("email", "test@test.com");
	c3.setMaxAge(60*60); // 시간은 1시간으로. */
	
	Cookie c3 = CookieBox.createCookie("pw", "1234", 60*60*2);
	response.addCookie(c3);
	
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
<a href="viewCookie.jsp">viewCookie</a>	

	


</body>

</html>
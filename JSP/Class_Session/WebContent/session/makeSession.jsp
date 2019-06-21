<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<h1>session을 이용한 데이터 저장</h1>

	<%
		session.setAttribute("name", "KING");
		session.setAttribute("id", "tiger");
		session.setAttribute("isLogin", true);
		session.setAttribute("age", 20);
		
	%>
	<h5>세션의 데이터를 저장했습니다.</h5>
	
	<a href="viewSession.jsp">viewSession1</a> <br>
	<a href="../response/viewSession.jsp">response/viewSession1</a> <br>
	
	<a href="logout.jsp">logout</a>
	
</body>

</html>
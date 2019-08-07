<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css"> --%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Cinzel&display=swap" rel="stylesheet">
<style>
body{
background-image: url("<c:url value="/images/main2.png"/>");
width: 2100px;
height:1200px;
background-size: cover;
background-repeat: no-repeat;
}
#nav {
padding : 5px 20px ;
height : 30px;
}
#nav>ul {
overflow: hidden;
}
#nav>ul>li {
list-style: none;
float: left; 
padding: 0 15px;	
line-height: 30px;
}
#nav>ul>li>a {
padding: 30px;
text-decoration: none;
font-size: 20px;
color: black;
font-family: 'Cinzel', serif;
line-height: 140px;
}
</style>
<title>Home</title>
</head>
<body>


<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>


</body>
</html>

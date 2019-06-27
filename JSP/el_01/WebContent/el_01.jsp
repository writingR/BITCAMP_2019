<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>   
<jsp:useBean id="member" class="com.javalec.ex.MemberInfo" scope="page"/>
<jsp:setProperty property="name" name="member" value="최아리"/>
<jsp:setProperty property="id" name="member" value="super"/>
<jsp:setProperty property="pw" name="member" value="1234"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>
		
		I   D : ${member.id} <br>
		
		I   D : <jsp:getProperty property="id" name="member"/> <br>
		
		P   W : ${member.pw} <br>
		
		P   W : <jsp:getProperty property="pw" name="member"/>
	
	</h2>

</body>
</html>
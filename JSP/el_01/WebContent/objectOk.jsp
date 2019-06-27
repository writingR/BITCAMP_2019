<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	아이디  : <%= id %> <br>
	비밀번호 : <%= pw %>
	
	<hr>
	
	아이디 : ${param.id} <br>
	비밀번호 : ${param.pw}
	
	<hr>
	
	applicationScope : ${applicationScope.application_name} <br>
	sessionScope : ${session_name} <br>
	pageScope : ${pageScope.page_name} <br>
	requestScope : ${requestScope.request_name}
	
	<hr>
	
	context 초기화 파라미터 <br>
	${initParam.con_name} <br>
	${initParam.con_id} <br>
	${initParam.com_pw}
	
</body>
</html>
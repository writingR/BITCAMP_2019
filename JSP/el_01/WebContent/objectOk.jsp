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


	���̵�  : <%= id %> <br>
	��й�ȣ : <%= pw %>
	
	<hr>
	
	���̵� : ${param.id} <br>
	��й�ȣ : ${param.pw}
	
	<hr>
	
	applicationScope : ${applicationScope.application_name} <br>
	sessionScope : ${session_name} <br>
	pageScope : ${pageScope.page_name} <br>
	requestScope : ${requestScope.request_name}
	
	<hr>
	
	context �ʱ�ȭ �Ķ���� <br>
	${initParam.con_name} <br>
	${initParam.con_id} <br>
	${initParam.com_pw}
	
</body>
</html>
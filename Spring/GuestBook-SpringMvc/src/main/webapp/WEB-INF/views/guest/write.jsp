<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<h1> ${resultCnt} </h1>
	<h1>결과 :
		<c:if test="${resultCnt==1}">
			정상적으로 입력되었습니다.			
		</c:if>
		<c:if test="${!(resultCnt==1)}">
			입력 실패 !!			
		</c:if>
	</h1>
	
	<a href="<c:url value="/guest/list" />">리스트</a>

























</body>
</html>
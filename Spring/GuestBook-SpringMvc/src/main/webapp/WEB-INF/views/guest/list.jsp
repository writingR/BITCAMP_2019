<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	div {
		border : 2px solid #666;
		width : 200px;
	}
</style>
</head>
<body>

	<h4>
		<%-- ${viewData.messageTotalCount} <br> ${viewData.currentPageNumber}
		<br> ${viewData.currentPageNumber} <br>
		${viewData.pageTotalCount} <br> ${viewData.messageCountPerPage} <br>
		${viewData.firstRow} <br> ${viewData.endRow} <br> --%>

	</h4>
	
	<H1> 방명록 </H1>
	
	<DIV style="text-align: right;"> <a href="writeForm">글쓰기</a></DIV>
	
	
	<c:if test="${viewData.messageTotalCount>0}">
	
	<c:forEach items="${viewData.messageList}" var="message">
		<div>
		메시지 번호 : ${message.id}<br> 
		손님 이름 :${message.guestName}<br>
		메시지 :${message.message}<br> 
		<a href="delete?messageId=${message.id}">삭제하기</a>
		</div>
	
	
	</c:forEach>
	
	
	<c:forEach begin="1" end="${viewData.pageTotalCount}" step="1" var="num">
		<a href="list?page=${num}">[${num}]</a> 
	</c:forEach>

	</c:if>













</body>
</html>
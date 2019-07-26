<%@page import="membermanager.member.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/> --%>
<%--
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("loginInfo");
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/mm/css/default.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">

	<h3>회원 정보 페이지</h3>
	
	<c:if test="${loginInfo ne null}">
	
	${sessionScope.loginInfo}
	
	<hr>
	
		<img src="../images/${loginInfo.uPhoto}">
		<h4>이름 : ${loginInfo.uName}</h4>
		<h4>아이디 : ${loginInfo.uId} </h4>
		<h4>가입일 : <fmt:formatDate value="${loginInfo.regDate}" pattern="yyyy.MM.dd"/>  </h4>
	
	</c:if>

	<c:if test="${loginInfo eq null}">
	<script>
		alert('로그인 후 이용가능한 페이지 입니다.');
		location.href = 'login.jsp';
	</script>
	</c:if>
	
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>
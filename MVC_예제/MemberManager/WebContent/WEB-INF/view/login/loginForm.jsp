<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="/WEB-INF/view/frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/view/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>로그인 페이지</h3>
	<hr>
	<form action="login.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId" required> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" required> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="로그인"> </td>
			</tr>
		</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/view/frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>
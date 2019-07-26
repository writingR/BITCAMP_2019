<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${loginInfo eq null}">
<script>
	alert('로그인 후 사용가능 페이지 입니다.');
	location.href='../loginForm.do';
</script>
</c:if>
<c:if test="${!(loginInfo eq null)}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
	div.mypage_box {
		width : 450px;
	}
	img {
		display: block;
		width: 100px;
	}
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
	
	<h1>MyPage</h1>
	<%-- ${loginInfo}  --%>
	<div class="mypage_box">
		<img alt="회원사진" src="<c:url value='/uploadfile/${loginInfo.uPhoto}'/>">
		회원 이름 : ${loginInfo.uName} <br>
		회원 아이디 : ${loginInfo.uId} <br>
	</div>
	
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/view/frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>
</c:if>



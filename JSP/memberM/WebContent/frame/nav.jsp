<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Knewave&display=swap" rel="stylesheet">
<%-- <div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">HOME</a></li>
		<li><a href="<c:url value='/member/login.jsp' />">LOGIN </a></li>
		<li><a href="<c:url value='/member/memberRegForm.jsp' />">JOIN</a></li>
		<li><a href="<c:url value='/member/mypage.jsp' />">MyInfo</a></li>
		<li><a href="<c:url value='/member/memberLIst.jsp' />">LIST</a></li>
		<li><a href="<c:url value='/member/logout.jsp' />">LOGOUT</a></li>
	</ul>
	<ul>
		<li><a href="${pageContext.request.contextPath}">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인 </a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">MyPage</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberList.jsp">회원리스트</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a></li>
	</ul>
</div> --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<!--   <span>
  <img id="logo" src="image/logo.png" href="#">
  </span> -->
  <a class="navbar-brand" href="<c:url value='/' />" style="font-family: 'Knewave', cursive;">NEVERLAND</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav" style="margin-left: 70%;">
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='/member/login.jsp' />">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='/member/memberRegForm.jsp' />">회원가입</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='/member/mypage.jsp' />">회원정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='/member/memberLIst.jsp' />">회원리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
</nav>
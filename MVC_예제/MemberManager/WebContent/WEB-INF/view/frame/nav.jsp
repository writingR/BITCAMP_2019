<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">홈</a></li>
		<li><a href="<c:url value='/member/loginForm.do' />">로그인 </a></li>
		<li><a href="<c:url value='/member/memberRegForm.do' />">회원가입</a></li>
		<li><a href="<c:url value='/member/mypage.do' />">MyPage</a></li>
		<%-- <li><a href="<c:url value='/member/mypage/mypage.do' />">MyPage2</a></li> --%>
		<li><a href="<c:url value='/member/memberList.do' />">회원리스트</a></li>
		<%-- <li><a href="<c:url value='/member/memberList2.jsp' />">회원리스트2</a></li> --%>
		<li><a href="<c:url value='/member/logout.do' />">LOGOUT</a></li>
	</ul>
	<%-- <ul>
		<li><a href="${pageContext.request.contextPath}">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인 </a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">MyPage</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberList.jsp">회원리스트</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a></li>
	</ul> --%>
</div>
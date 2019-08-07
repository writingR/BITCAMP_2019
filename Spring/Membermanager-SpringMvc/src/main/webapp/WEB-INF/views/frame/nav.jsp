<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">Home</a></li>
		
		
		<li>
		<c:if test="${loginInfo eq null}">
		<a href="<c:url value='/member/login' />">Login </a>
		</li>
		</c:if>
		<c:if test="${loginInfo ne null}">
		<a href="<c:url value='/member/logout' />">Logout </a>
		</c:if>
		<li><a href="<c:url value='/member/regist' />">join</a></li>
		<li><a href="<c:url value='/member/mypage' />">Mypage</a></li>
		<li><a href="<c:url value='/member/memberList' />">Mylist1</a></li>
		<li><a href="<c:url value='/member/memberList' />">Mylist2</a></li>
		<li><a href="<c:url value='/member/logout.do' />">Logout</a></li>
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
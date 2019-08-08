<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
 <ul>
	<li> <a href="/mypro/home">홈</a> </li>
	<li> <a href="<c:url value="/member/Regist"/>">회원가입</a> </li>
	<li> <a href="<c:url value="/member/Login"/>">로그인</a> </li>
	<li> <a href="<c:url value="/write/Write"/>">방명록</a> </li>
	<li> <a href="<c:url value="/member/MyPage"/>">마이페이지</a> </li>
	<li> <a href="<c:url value="/member/List"/>">리스트</a> </li>
	<li> <a href="<c:url value="/member/Logout"/>">로그아웃</a> </li>
 </ul>	
</div>	
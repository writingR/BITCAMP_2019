<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getSession(false).invalidate();
	%>
	<script>
	 alert('로그아웃 처리 되었습니다.');
	 history.go(-2);
	</script>
	<%

%>
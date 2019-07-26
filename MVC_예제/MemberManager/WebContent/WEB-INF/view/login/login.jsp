    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert('${msg}');
	<c:if test="${loginChk}">
	location.href='../index.do';
	</c:if>
	<c:if test="${!loginChk}">
	location.href='loginForm.do';
	</c:if>
</script>
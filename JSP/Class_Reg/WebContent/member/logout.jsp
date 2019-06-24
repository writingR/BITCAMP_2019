<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<% 

	request.getSession(false).invalidate();

	response.sendRedirect(request.getContextPath());


%>
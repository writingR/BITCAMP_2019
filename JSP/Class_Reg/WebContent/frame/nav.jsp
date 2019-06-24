<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="nav">
	<ul>
		<li><a href="<%= request.getContextPath() %>">HOME</a></li>
		<li><a href="<%= request.getContextPath() %>/member/login.jsp">LOGIN</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberRegForm.jsp">JOIN</a></li>
		<li><a href="<%= request.getContextPath() %>/member/myInfo.jsp">INFO</a></li>
		<li><a href="<%= request.getContextPath() %>/member/logout.jsp">LOGOUT</a></li>
	</ul>
</div>
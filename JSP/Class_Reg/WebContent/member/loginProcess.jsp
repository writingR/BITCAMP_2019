<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<jsp:useBean id="memberInfo" class="member.MemberInfo" scope="session"/>
<jsp:setProperty property="*" name="memberInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../js/bootstrap.js">
<link rel="stylesheet" href="/mm/css/default.css"> 
<!-- jquery 1.12.4 cdn -->
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- css 시작 -->
<style>

</style>

</head>

<!-- contents -->
<body>


<%
 request.setCharacterEncoding("utf-8");
%>


<%

	String uId = request.getParameter("uId");
	String uPw = request.getParameter("uPw");
	
	if(uId != null && uPw != null 
	&& uId.equals("admin@admin.com")&&uPw.equals("admin")){
		response.sendRedirect(request.getContextPath());
	}



%>



<%@ include file="../frame/header.jsp" %>

<%@ include file="../frame/nav.jsp" %>

<div id="contents">
	<h3>로그인 요청 처리 페이지</h3>
	<hr>
	<form action="loginProcess.jsp" method="post">
		<table>
			<tr>
				<td>이메일(아이디)</td>
				<td>
				<input type="email" name="uId" value="<%= uId %>">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
				<input type="password" name="uPw" value=" <%= uPw %>" >
				</td>
			</tr>

		</table>
	</form>
</div>

<%@ include file="../frame/footer.jsp" %>

</body>

</html>
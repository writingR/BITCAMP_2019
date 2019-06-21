<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../js/bootstrap.js">

<!-- jquery 1.12.4 cdn -->
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- css 시작 -->
<style>
	h1{
		text-align : center;
		border-bottom: 1px solid #ddd;
		padding : 10px;
	}
	table{
		width : 500px;
		border : 0;
		border-collapse: collapse;
		margin : 0 auto;
	}
	td{
		border : 1px solid #666;
		padding : 20px;
	}
	select{
		height : 25px;
	}
	table tr:first-child>td:first-child {
		width : 120px;
	}
	
</style>

</head>

<!-- contents -->
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

	<div id="header">
	<h1>전송결과</h1>
	</div>

	<div id="contents">
	<table>
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("uName") %></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%= request.getParameter("job") %></td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
			<%
	
			String[] field = request.getParameterValues("field");
			if(field != null){
		
			for(int i = 0; i<field.length;i++){
			out.println(field[i]+"\t");
				}
			}
			%>
			</td>
		</tr>

	</table>
	</div>



</body>

</html>
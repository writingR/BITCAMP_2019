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
	table tr:last-child>td {
		text-align: center;
		padding : 10px;
	}
</style>

</head>

<!-- contents -->
<body>
	<div id="header">
	<h1>request 테스트 폼</h1>
	</div>

	<div id="contents">
	<form action="result.jsp" method="post">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="uName"></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><select name="job">
			<option>가수</option>
			<option>정치인</option>
			<option>개발자</option>
			<option>예술가</option>
			</select>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
			<input type="checkbox"  filed="object" value="java" name="field"> java
			<input type="checkbox"  filed="object" value="HTML" name="field"> HTML
			<input type="checkbox"  filed="object" value="css" name="field"> css
			<input type="checkbox"  filed="object" value="script" name="field"> script
			<input type="checkbox"  filed="object" value="JSP" name="field"> JSP
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="보내기">
			<input type="reset">
			</td>
		</tr>
	</table>
	</form>
	</div>



</body>

</html>
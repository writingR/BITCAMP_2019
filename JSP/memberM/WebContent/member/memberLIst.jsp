<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/memberM/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	img.sumnail {
		height : 25px;
		margin : 2px;
	}
	
	table {
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
	}
	
	table td {
		padding : 3px;
		border : 1px solid #AAA;
	}
	
	table tr:first-child>td {
		text-align: center;
		background-color: #EEE;
		font-weight: bold;
	}
	
}
</style>
</head>
<body>


<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3 style="text-align: center;margin-top: 100px;">회원 리스트</h3>
	<hr>
	<table>
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>관리</td>
		</tr>
		
		<!-- 리스트 반복 시작 -->
		
	<%
		int cnt = 0; 
		
		while(e.hasMoreElements()){
			
			String name = e.nextElement();
			
			Object obj = application.getAttribute(name);
			
			if(obj instanceof MemberInfo ){
				MemberInfo member = (MemberInfo)obj;
				%>
		<tr>
			<td><%= ++cnt %></td>
			<td><%= member.getuId() %></td>
			<td><%= member.getuName() %></td>
			<td><%= member.getuPw() %></td>
			<td><a href="#">수정</a> | <a href="#">삭제</a> </td>
		</tr>
				<%
			}
			
			
			
		}
	
	%>
		<!-- 리스트 반복 종료 -->
	</table>

</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->









</body>
</html>
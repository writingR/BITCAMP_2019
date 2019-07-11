<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	
	request.setCharacterEncoding("utf-8");
	String pageNumberstr = request.getParameter("page");
	
	int pageNumber = 1;
	
	if(pageNumberstr != null){
		
		pageNumber = Integer.parseInt(pageNumberstr);
		
	}
	
	// 핵심 처리할 서비스 객체
	GetMessageListService service = GetMessageListService.getInstance();
	
	// 응답 데이터의 결과
	MessageListView viewData = service.getMassageListView(pageNumber);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>
	div{
		border : 2px solid #333;
		margin : 5px 0px;
		width : 300px;
	}
</style>
<body>

	<h3>방명록 글쓰기</h3>
	<hr>
	
	
	<form action="writeMessage.jsp" method="post">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="guestName"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>메시지</td>
			<td><textarea rows="3" cols="30" name="message"></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="등록"></td>
		</tr>
	</table>
	</form>

	<hr>
	<%
		if(viewData.isEmpty()){
			%>
			<h3>등록된 메시지가 없습니다.</h3>
			<%
		} else {
			
			for(Message message : viewData.getMessageList()){ 
			
			%>
			<div>
				메시지 번호 :<%= message.getId() %> <br>
				손님이름 :<%= message.getGuestName() %> <br>
				메시지 :<%= message.getMessage() %> <br>
				<a href="#">삭제하기</a> 
			</div>
			<%
			}
		}
		
	// [1] [2] [3]
	for	(int i=1; i <= viewData.getPageTotalCount();i++ ){
		
	%>
	<a href="list.jsp?page=<%= i%>">[<%=i %>]</a>
	
	<%
	}
	%>

</body>
</html>

<%
		try{
		// 예외처리는 바디 밑쪽에 들어가도 상관없다.
		}catch (Exception se) {
			se.printStackTrace();

		}
			
		
%>




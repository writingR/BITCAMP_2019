<%@page import="java.sql.SQLException"%>
<%@page import="guestbook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	// 1. 폼으로부터 데이터를 받는다.
	
	
	// 4. write 메서드 실행 : 리턴타입 ----> 1 또는 0
	request.setCharacterEncoding("utf-8");
%>
<!--2. Message 객체에 저장 : useBean 액션태그  --> 
<jsp:useBean id="message" class="guestbook.model.Message"/>
<jsp:setProperty property="*" name="message"/>

<%
	//3. WriteMessageService 객체 생성
	WriteMessageService service = WriteMessageService.getInstance();
	int cnt = service.write(message);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 삼항연산자 사용 -->
	<!-- 정상적인 결과가 나올경우  1이 반환된다. -->
	<h1>
	<%= cnt>0 ? "방명록에 메시지를 남겼습니다." : "메시지 등록에 실패하였습니다." %>
	</h1>

	<a href="list.jsp">목록보기</a>
	


</body>
</html>

<%
		try{
		// 예외처리는 바디 밑쪽에 들어가도 상관없다.
		}catch (Exception se) {
			se.printStackTrace();

		}
			
		
%>


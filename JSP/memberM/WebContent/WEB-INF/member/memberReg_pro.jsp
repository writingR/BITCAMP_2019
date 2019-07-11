<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

 <%

        String userId = request.getParameter("uId");
        String userPw = request.getParameter("uPw");
        String userName = request.getParameter("uName");
        
        try {
            // 1.드라이버 로딩
            //Class.forName("com.mysql.jdbc.Driver");
            
            // 2.mysql 접속
            String url = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
            String uid = "bit";
            String upw = "bit";
            
            // insert 실행
            Connection conn = DriverManager.getConnection(url, uid, upw);
            Statement st = conn.createStatement();
            String sql = "insert into Bmember values ('" + userId +  "','" + userPw +  "','" + userName + "')"; 
   			st.executeUpdate(sql);
         
            response.sendRedirect("login.jsp");
            
        } catch (Exception e) {       
            out.println("회원가입에 실패하였습니다.");
            e.printStackTrace();
        } 
    	

    %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">WELCOME TO.</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>">HOME</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/member/login.jsp">LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/member/memberRegForm.jsp">JOIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">INFO</a>
      </li> 
    </ul>
  </div> 
</nav>
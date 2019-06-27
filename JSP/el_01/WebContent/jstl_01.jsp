<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.ex.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%

	List <MemberInfo> list = new ArrayList <MemberInfo>();

	list.add(new MemberInfo("�־Ƹ�","su","112"));
	list.add(new MemberInfo("ȫ�浿","sup","113"));
	list.add(new MemberInfo("�����","supe","114"));
	list.add(new MemberInfo("�̰���","super","115"));
	list.add(new MemberInfo("������","super1","1116"));
	list.add(new MemberInfo("����","super12","1117"));
	list.add(new MemberInfo("�־Ƹ�1","super123","1118"));
	list.add(new MemberInfo("ȫ�浿1","super124","1119"));
	list.add(new MemberInfo("�����1","test8","1110"));
	list.add(new MemberInfo("�̰���1","test9","1112"));

	application.setAttribute("member", list);
	
	
 %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
table{
border: 0;
border-collapse: collapse;
width : 60%;
}
table td{
padding: 10px;
border: 1px solid #ddd;
}

table tr:first-child {
	font-weight: bold;
}
</style>
<body>

	<c:set var="varName" value="varVal"/>
	varName : <c:out value="${vatName}"/><br>

	<c:remove var="varRemove" />
	varRemove : <c:out value="${vatRemove}"/><br>

	<hr>
	
	<c:catch var="error">
	<%= 2/0 %>
	</c:catch>
	<br>
	<c:out value="${error}"/>
	
	<hr>
	
	<c:if test="${1+2==3}">
	  <c:out value="���� 3�� �½��ϴ�."/><br>
	</c:if>
	<c:if test="${1+3 != 3}">
	  <c:out value="���� 3�� �ƴմϴ�."/>
	</c:if>
	
	
	<hr>
	
	<table>
		<tr>
			<td>index/count</td>
			<td>�̸�</td>
			<td>���̵�</td>
			<td>��й�ȣ</td>
		</tr>
	
	
	<c:forEach items="${member}" var="fe" begin="0" end="3" step="1" varStatus="status">
		<tr>
			<td> ${status.index} / ${status.count} </td>
			<td> ${fe.name} </td>
			<td> ${fe.id} </td>
			<td> ${fe.pw} </td>
		</tr>
	</c:forEach>
	
	
	</table>
	
</body>
</html>
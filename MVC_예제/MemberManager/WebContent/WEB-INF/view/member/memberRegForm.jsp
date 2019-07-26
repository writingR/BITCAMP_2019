<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
	#idcheck {
		display: none;
	}
	
	.color_red {
		color : red;
	}
	.color_blue {
		color : blue;
	}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<form action="memberReg.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td>
				<input type="checkbox" id='idcheck'>
				<input type="email" id="uId" name="uId" required> <span id="idcheckmsg"></span> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" required> </td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="uPhoto"> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원가입"> </td>
			</tr>
		</table>
	</form>
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

<script>
	
	$(document).ready(function(){
		
		$('#uId').focusout(function(){
			
			// aJax 비동기 통신 id 전송 사용 유무에 대한 결과 값을 반환
			
			$.ajax({
				url: 'idCheck.do',
				type: 'get',
				data: {uId: $(this).val() },
				success: function(data){
					alert(data);
					
					$('#idcheckmsg').html('');
					$('#idcheckmsg').removeClass('color_red');
					$('#idcheckmsg').removeClass('color_blue');
					
					if(data == 'Y'){
						$('#idcheck').prop('checked', true);
						$('#idcheckmsg').html('사용가능합니다.');
						$('#idcheckmsg').addClass('color_blue');
					} else {
						$('#idcheck').prop('checked', false);
						$('#idcheckmsg').html('사용중인 아이디 이거나 탈퇴한 아이디 입니다.');
						$('#idcheckmsg').addClass('color_red');
					}
					
				}
			});
			
			
			
			
		});
		
		
		
		
		
		
		
		
		
	});
</script>
































</body>
</html>
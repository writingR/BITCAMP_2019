<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Cinzel&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%-- <link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css"> --%>
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
#nav {
padding : 5px 20px ;
height : 30px;
}
#nav>ul {
overflow: hidden;
}
#nav>ul>li {
list-style: none;
float: left; 
padding: 0 15px;	
line-height: 30px;
}
#nav>ul>li>a {
padding: 35px;
text-decoration: none;
font-size: 20px;
color: black;
font-family: 'Cinzel', serif;
line-height: 140px;
}
</style>
</head>
<body>

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
<!-- 	<h3>회원가입 페이지</h3>
	<hr> -->
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  <form id="regform" method="post" enctype="multipart/form-data" style="width:600px; margin:0 auto;">
  <div class="form-group">
    <label for="uId">아이디 (Email)</label>
    <input type="text" class="form-control" id="uId" name="uId" placeholder="아이디를 입력하세요."> <span id="idcheckmsg"></span> 
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">비밀번호 (Password)</label>
    <input type="password" class="form-control" id="formGroupExampleInput2" name="uPw" placeholder="비밀번호를 입력하세요."> <span id="idcheckmsg1"></span> 
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput3">이름 (Name)</label>
    <input type="text" class="form-control" id="formGroupExampleInput3" name="uName" placeholder="이름을 입력하세요."> <span id="idcheckmsg2"></span> 
  </div>
  <div class="form-group">
    <!-- <label for="exampleFormControlFile1"></label> -->
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="uPhoto">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">가입하기</button><button type="reset" class="btn btn-secondary" style="margin-left: 3px;">취소하기</button>
</form>	

</div>
<!-- 컨텐츠 끝 -->


<%-- <!-- 푸터 시작 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
<!-- 푸터 끝 --> --%>

<script>
	/* 
	$(document).ready(function(){
		
		$('#uId').focusout(function(){
			
			// aJax 비동기 통신 id 전송 사용 유무에 대한 결과 값을 반환
			
			$.ajax({
				url: 'idCheck.do',
				type: 'get',
				data: {id: $(this).val() },
				success: function(data){
					alert(data);
					
					$('#idcheckmsg').html('');
					$('#idcheckmsg').removeClass('color_red');
					$('#idcheckmsg').removeClass('color_blue');
					
					if(data == 'Y'){
						$('#idcheck').prop('checked', true);
						$('#idcheckmsg').html('사용가능한 멋진 아이디 입니다.');
						$('#idcheckmsg').addClass('color_blue');
					} else {
						$('#idcheck').prop('checked', false);
						$('#idcheckmsg').html('사용중인 아이디 이거나 탈퇴한 아이디 입니다.');
						$('#idcheckmsg').addClass('color_red');
					}
					
				}
			});
			
			$('#regform').submit(function(){
				
				if(!$('#idcheck').prop('checked')){
					alert('아이디 중복확인이 필요합니다.');
					return false;
				}
				
				
			});
			
			
			
			
		});
		
		
		
		
		
		
		
		
		
	});
 */
</script>




</body>
</html>
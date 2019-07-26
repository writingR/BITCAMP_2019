<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var chk = ${rCnt};
	if(chk>0){
		alert('가입완료!');
		location.href='../index.do';
	} else {
		alert('회원가입에 실패했습니다.');
		location.href='../index.do';
	}
</script>
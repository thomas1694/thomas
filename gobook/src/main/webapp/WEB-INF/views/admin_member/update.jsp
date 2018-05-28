<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function inCheck(f){   
	if(f.old_passwd.value==""){
		alert("현재 비밀번호를 입력해 주세요");
		f.c_id.focus();
		return false;
	}
	if(f.a_passwd.value==""){
		alert("바꿀 패스워드를 입력해 주세요");
		f.c_passwd.focus();
		return false;
	}
	if(f.a_repasswd.value==""){
		alert("바꾸실 비밀번호 확인을 입력해 주세요");
		f.c_repasswd.focus();
		return false;
	}
	if(f.a_repasswd.value!=f.c_passwd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
		f.c_repasswd.focus();
		return false;
	}
}
</script>
</head>
<body>
<form name='frm' method='POST' action='./update'
		onsubmit="return inCheck(this)">
<table>
	<tr> 
		<th>관리자 아이디(*)</th>
		<td>${dto.a_id }</td>
	</tr>
	<tr> 
		<th>비밀번호(*)</th>
		<td><input type="password" name= "old_passwd"></td>
	</tr>
	<tr> 
		<th>변경할 비밀번호(*)</th>
		<td><input type="password" name="a_passwd" ></td>
	</tr>
	<tr> 
		<th>변경할 비밀번호 확인(*)</th>
		<td><input type="password" name="a_repasswd"></td>
	</tr>
	<tr>
		<th>관리자 부서</th>
		<td><input type="text" name="a_depart" value="${dto.a_depart }"></td>
	</tr>
</table>
<button>수정</button>
<button type="button" onclick="history.back();">취소</button>
<input type="hidden" name="a_id" value="${dto.a_id}">
<input type="hidden" name="uri" value="${uri}">
</form>
</body>
</html>
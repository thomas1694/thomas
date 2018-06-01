<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){	
	if(f.oldpasswd.value==""){
		alert("기존 패스워드를 입력해 주세요");
		f.c_passwd.focus();
		return false;
	}
	if(f.newpasswd1.value==""){
		alert("새 비밀번호를 입력해 주세요");
		f.newpasswd1.focus();
		return false;
	}
	if(f.newpasswd2.value==""){
		alert("새 비밀번호확인을 입력해 주세요");
		f.newpasswd2.focus();
		return false;
	}
	if(f.newpasswd2.value!=f.newpasswd1.value){
		alert("새 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
		f.newpasswd2.focus();
		return false;
	}
}
</script>

</head> 
<body>
 
<DIV>비밀번호 변경</DIV>
<div>
안전한 비밀번호로 내정보를 보호하세요<br>
다른 아이디/사이트에서 사용한 적 없는 비밀번호,<br>
이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
</div>

<FORM name='frm' method='POST' action='${root}/c_member/updatePasswdProc'
onsubmit="return incheck(this)"
>
<input type="hidden" name="id" value="${param.c_id }">
  <TABLE border="1">
    <TR>
      <TH>현재 비밀번호</TH>
      <TD><input type="password" name="oldpasswd"/></TD>
    </TR>

     <TR>
      <TH>새 비밀번호</TH>
      <TD><input type="password" name="newpasswd1"/></TD>
    </TR>
     <TR>
      <TH>비밀번호 확인</TH>
      <TD><input type="password" name="newpasswd2"/></TD>
    </TR>
  </TABLE>
  
  <DIV>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</body>
</html> 
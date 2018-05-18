<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
  
<div class="content">
email을 입력하세요<br><br>
</div>
<FORM name='frm' method='POST' action='./email_proc'>
  <TABLE>
    <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="c_email" size="20" required></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="window.close()">  
    <!-- window.close() 현재 열린 창이 닫히게(새창에서 주로 많이 쓴다.) -->
  </DIV>
</FORM>

</body>
</html>
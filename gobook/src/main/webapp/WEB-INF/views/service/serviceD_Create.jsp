<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 등록</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function onlyNumber(obj) {
	    $(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	    }); 
	}
	</script>
</head>
<body>
 
<FORM name='frm' 
 method='POST' 
 action='./Dcreate'
 enctype="multipart/form-data"
 onsubmit="return inputCheck(this)">
 <input type="hidden" name="sv_num" value="${param.sv_num}">
 
<DIV class="container">
 <h2>상세 서비스 등록</h2>
  <TABLE>
     <TR>
      <TH>사진등록</TH>
      <TD>
      <input type="file" name="filenameMF">
      </TD>
    </TR>
    <TR>
      <TH>상세서비스명</TH>
      <TD><input type="text" name="sv_title"></TD>
    </TR>
    <TR>
      <TH>서비스 내용</TH>
      <TD>
      <textarea rows="10" cols="45" name="sv_content"></textarea>
      </TD>
   </TR>
    <TR>
      <TH>서비스가격</TH>
      <TD><input type="text" onkeydown="onlyNumber(this)" name="sv_price"></TD>
    </TR>
     <TR>
      <TH>타임당 예약인원수</TH>
      <TD><input type="text" onkeydown="onlyNumber(this)" name="sv_timeperson"></TD>
    </TR>
    
  </TABLE>
  
  </DIV>
  
 <DIV class='bottom' style="text-align: center;margin-bottom: 50px;">
    <input type='submit'  class="btn btn-Default btn-md" style="width: 80px;height: 50px;" value='등록'">
    <input type='reset'  class="btn btn-Default btn-md" style="width: 80px;height: 50px;"	 value='취소'>
  </DIV>

  </FORM>

</body>
</html> 
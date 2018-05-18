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
<title>서비스 수정</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="resources/js/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
  top: 300px;
  left:1000px;
  position:absolute;
}
.bottom{
 bottom: 100px;
  left:500px;
  position:absolute;
}
</style>
</head>
<body>
<FORM name='frm' 
 method='POST' 
 action='./update'
 enctype="multipart/form-data"
 onsubmit="return inputCheck(this)">
 <input type="hidden" name="sv_num" value="${dto.sv_num}">
  <input type="hidden" name="sv_num_upper" value="${dto.sv_num_upper}">
   <input type="hidden" name="simg_num" value="${dto.serdto.simg_num}">
   
<DIV class="container">
 <h2>상세 서비스 수정</h2>
 
  <TABLE>
    <TR>
      <TH>서비스 사진</TH>
      <TD><img src="./storage_s/${dto.serdto.simg_filename}"></TD>
    </TR>
    
    <TR>
      <TH>상세서비스명</TH>
      <TD><input type="text" name="sv_title" value="${dto.sv_title}"></TD>
    </TR>
    <TR>
      <TH>서비스 내용</TH>
      <TD>
      <input type="text" name="sv_content" value="${dto.sv_content}">
      </TD>
    </TR>
    <TR>
      <TH>서비스가격</TH>
      <TD><input type="text" name="sv_price" value="${dto.sv_price}"></TD>
    </TR>
     <TR>
      <TH>타임당 예약인원수</TH>
      <TD><input type="text" name="sv_timeperson" value="${dto.sv_timeperson}"></TD>
    </TR>
    <TR>
      <TH>템플릿</TH>
      <TD>
      <input type ="text" name="sv_template" value="${dto.sv_template}">
      </TD>
      <td>템플릿을 선택하세요</td>
    </TR>
    
  </TABLE>
  
  </DIV>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='reset' value='취소'>
  </DIV>

  </FORM>

</body>
</html>
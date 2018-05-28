<%@ page contentType="text/html; charset=UTF-8" %>  
<%@ include file="ssi.jsp"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head> 
<!-- *********************************************** -->
<body>

 <div class="container ">
				<h2>사진 업로드</h2>
 
<FORM name='frm' 
	  method='POST' 
	  action='./updatefile'
	  enctype="multipart/form-data">
	  <input type="hidden" name="sv_num" value="${param.sv_num}">
	  <input type="hidden" name="oldfile" value="${param.oldfile}">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="${root}/storage/service_image/img/${param.oldfile}"><br>
       원본파일명:${param.oldfile}
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="filenameMF" accept=".png,.gif,.jpg">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom' style="text-align:center;">
    <input class="btn btn-Default btn-md"  type='submit' value='변경'>
    <input class="btn btn-Default btn-md"  type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
</body>
<!-- *********************************************** -->
</html> 
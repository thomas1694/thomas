<%@ page contentType="text/html; charset=UTF-8" %>  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 등록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title"><h1>서비스 대분류 등록</h1></DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create'
	  enctype="multipart/form-data">
 
<!--   <input type="hidden" name="sv_content" value="0"> -->
<!--   <input type="hidden" name="sv_template" value="0"> -->
<!--   <input type="hidden" name="sv_price" value="0"> -->
<!--    <input type="hidden" name="sv_timeperson" value="0"> -->
  <TABLE>
   
    <TR>
      <TH>사진등록</TH>
      <TD>
      <input type="file" name="filenameMF">
      </TD>
    </TR>
    <TR>
      <TH>대분류 서비스 제목</TH>
      <TD>
      <input type="text" name="sv_title">
      </TD>
    </TR>
   
    
  </TABLE>
  
  <DIV class='bottom' style="text-align: center;">
    <input type='submit' class="btn btn-Default btn-md" style="width: 80px;height: 50px;" value='등록'>
    <input type='button' class="btn btn-Default btn-md" style="width: 80px;height: 50px;" value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
</body>
<!-- *********************************************** -->
</html>  
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function incheck(f){
	if(f.re_title.value==""){
		alert("제목을 입력하세요");
		f.re_title.focus();//커서를 옯긴다
		return false;
	}
	
	/* 
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();//커서를 옯긴다
		
		return false;
	} */
	if (CKEDITOR.instances['re_content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['re_content'].focus();
	      return false;
	
	}

}
</script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
 var $jjj=jQuery.noConflict(); 
 $jjj(document).ready(function($){
     CKEDITOR.replace('re_content');  // <TEXTAREA>태그 id 값
  });
 </script>

</head> 
<body>
 
	<h2><span class="glyphicon glyphicon-pencil"></span>수정</h2>
<div class="container">
 
<FORM name='frm' 
	method='POST' 
	action='./update'
	onsubmit="return incheck(this)"
	enctype="multipart/form-data"> 
	<input type="hidden" name="c_id" value="${sessionScope.id }">
  <TABLE class="table table-bordered">
  <tr>
      <TH>제목</TH>
      <TD><input type="text" name="re_title" value="${dto.re_title }"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD ><textarea rows="10" cols="45" name="re_content">${dto.re_content }</textarea></TD>
    </TR>
    
    
    
    
    
  </TABLE>
  
  <DIV style="text-align: center;">
    <input type='submit' class="btn btn-default" style="width: 70px;height: 40px;" value='등록' >
    <input type='button' class="btn btn-default" style="width: 70px;height: 40px;" value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 </div>
</body>
</html> 


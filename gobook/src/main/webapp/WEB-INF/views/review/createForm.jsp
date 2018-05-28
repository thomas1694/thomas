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
var $jjj2=jQuery.noConflict(); 
$jjj2(document).ready(function ($) {
	 
	  $("#rateYo").rateYo({
	 	
	    onSet: function (rating, rateYoInstance) {
	 	if(rating<0.5){
	 		alert('최소 평점은 0.5 이상 입력해야 합니다.');
	 		$("#rateYo").rateYo().rateYo("rating",0.5);
	 		$("#rrr").text('('+0.5+')');
	 	}else{
	    	$("#rrr").text('('+rating+')');
	      document.getElementById('rating').value=eval(rating);
	    }}
	  });
	});
  </script>
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
	if(f.filenameMF.value==""){
		alert("이미지를 등록하세요");
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
 
	<h2><span class="glyphicon glyphicon-pencil"></span>등록</h2>
<div class="container">
 
<FORM name='frm' 
	method='POST' 
	action='./create'
	onsubmit="return incheck(this)"
	enctype="multipart/form-data"> 
	<input type="hidden" name="c_id" value="ctest">
	<input type="hidden" name="s_id" value="stest">
  <TABLE class="table table-bordered">
  <tr>
      <TH>제목</TH>
      <TD><input type="text" name="re_title" ></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD ><textarea rows="10" cols="45" name="re_content"></textarea></TD>
    </TR>
    <tr>
    <th>평점</th>
    <td>
 <div id="rateYo" ></div>

 <div id="rrr" style="margin-left:7%;"></div>
 <input type="hidden" name="re_rating" id="rating">
</td>
    </tr>
    
    
    <TR>
      <TH>이미지</TH>
      <TD ><input type="file" name="filenameMF" accept="image/gif, image/jpeg, image/png" ></TD>
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


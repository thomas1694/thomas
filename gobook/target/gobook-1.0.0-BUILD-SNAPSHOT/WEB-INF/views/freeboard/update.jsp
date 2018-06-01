<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
<script type="text/javascript">
function incheck(){
	var f = document.frm; 
	
	if(f.id.value==""){
		alert("이름을 입력하시요");
		f.id.focus();
		
		return;
	}	
	
	if(f.f_title.value==""){
		alert("제목을 입력하시요");
		f.f_title.focus();
		
		return;
	}	
	  if (CKEDITOR.instances['f_content'].getData() == '') {
		    window.alert('내용을 입력해 주세요.');
		    CKEDITOR.instances['f_content'].focus();
		    return;
	 }
	
	
	f.submit();
}
 

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('f_content');  
  };
 </script>
 <link rel="Stylesheet" href="${root}/top/assets/css/main.css">
</head>
<body>
<DIV class="title">수정</DIV>
 
<FORM name='frm'
 	  method='POST' 
 	  action='./update'
 	  enctype="multipart/form-data"
 	  >
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="f_num" value="${dto.f_num}">
<input type="hidden" name="oldfile" value="${dto.f_filename}">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD>${dto.id }</TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="f_title" value="${dto.f_title}"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="45" name="f_content">${dto.f_content}</textarea>
      </TD>
    </TR>
    
    
      <TH>파일명</TH>
      <TD><input type="file" name="filenameMF">
      ${dto.f_filename}</TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="incheck()">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 

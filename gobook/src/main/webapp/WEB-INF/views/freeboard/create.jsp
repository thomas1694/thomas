<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
function incheck(f){
	
	if(f.id.value==""){
		alert("이름을 입력해 주세요");
		f.id.focus();
		
		return false;
	}	
	
	if(f.f_title.value==""){
		alert("제목을 입력해 주세요");
		f.title.focus();
		
		return false;
	}	
	  if (CKEDITOR.instances['content'].getData() == '') {
		    window.alert('내용을 입력해 주세요.');
		    CKEDITOR.instances['content'].focus();
		    return false;
	}
	
	
}
 

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
 <link rel="Stylesheet" href="${root}/top/assets/css/main.css">
</head>
<body>
 
<div class="container">
<h2><span class="glyphicon glyphicon-th-list"></span>등록</h2>
 
<FORM name='frm'
method='POST' 
 	  action='./create'
  	  onsubmit="return incheck(this)"
  	  enctype="multipart/form-data">
  	  <input type="hidden" name="id" value="ctest">
  <TABLE class ="table table-bordered">
    <TR>
      <TH>성명</TH>
      <TD>ctest</TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="f_title"></TD>
    </TR>
    <TR>
      <TH valign ="middle">내용</TH>
      <TD>
      <textarea rows="10" cols="45" name="f_content"></textarea></TD>
    </TR>
    
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
</body>
</html>
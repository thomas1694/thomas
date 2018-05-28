<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="util"  uri="/ELFunctions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(f){
	
	if(f.id.value==""){
		alert("이름을 입력하시요");
		f.id.focus();
		
		return false;
	}	
	
	if(f.f_title.value==""){
		alert("제목을 입력하시요");
		f.f_title.focus();
		
		return false;
	}	
	if(f.f_content.value==""){
		alert("내용을 입력하시요");
		f.f_content.focus();
			
		return false;	
	}	
	
	
}
 

</script>
<link rel="Stylesheet" href="${root}/top/assets/css/main.css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<div class="container">
<h2><span class="glyphicon glyphicon-th-list"></span>답변</h2>
 
<FORM name='frm'
 	  method='POST' 
 	  action='./reply'
  	  onsubmit="return incheck(this)"
  	  enctype="multipart/form-data">
  	  <input type="hidden" name="nowPage" value="${param.nowPage}">
  	  <input type="hidden" name="col" value="${param.col}">
  	  <input type="hidden" name="word" value="${param.word}">
  	  <input type="hidden" name="f_num" value="${dto.f_num}">
  	  <input type="hidden" name="f_grpno" value="${dto.f_grpno}">
  	  <input type="hidden" name="f_indent" value="${dto.f_indent}">
  	  <input type="hidden" name="f_ansnum" value="${dto.f_ansnum}">
      <input type="hidden" name="id" value="${sessionScope.id }">
  	  <TABLE class ="table table-bordered">
  	  

    <TR>
      <TH>성명</TH>
      <TD>${sessionScope.id }</TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="f_title" value="${dto.f_title}"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="45" name="f_content"></textarea></TD>
    </TR>
    
    
    
    <TR>
      <TH>파일명</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</div>
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 

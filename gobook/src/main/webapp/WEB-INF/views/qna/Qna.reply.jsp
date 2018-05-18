<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%  request.setCharacterEncoding("utf-8");%>
<c:set var="root" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<%-- <link href="${root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(f){
	if(f.q_title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		
		return false;	
	}
	if(f.q_content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		
		return false;
	}	
}

</script>
</head> 

<body>

<div class="container">
<h2><span class="glyphicon glyphicon-pencil"></span>질문과 답변</h2>
 
<FORM name='frm' 
	  method='POST' 
	  action='./reply'
	  onsubmit="return incheck(this)"
	  >
  <input type="hidden" name="nowPage" value="${param.nowPage}">	  
  <input type="hidden" name="col" value="${param.col}">	  
  <input type="hidden" name="word" value="${param.word}">	  
  <input type="hidden" name="q_num" value="${param.q_num}">	  
  <input type="hidden" name="q_grpno" value="${dto.q_grpno}">	  
  <input type="hidden" name="q_indent" value="${dto.q_indent}">	  
  <input type="hidden" name="q_ansnum" value="${dto.q_ansnum}">	  
  <TABLE class="table table-bordered"> 
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="q_title" size="149" value="${dto.q_title}"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="24" cols="150" name="q_content">${dto.q_content}</textarea></TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
</body>
<!-- *********************************************** -->
</html>
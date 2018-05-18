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
<script type="text/javascript">
function blist() {
	var url = "./list";
	location.href= url;
}
</script>

</head> 
<body>
	
			<DIV class="title">정말로 삭제 하겠습니까?</DIV>
			 
			<FORM name='frm' method='POST' action='delete'>
			<input type="hidden" name = "nowPage" value="${param.nowPage}">
			<input type="hidden" name = "col" value="${param.col}">
			<input type="hidden" name = "word" value="${param.word}">
			<input type="hidden" name = "re_num" value="${param.re_num}">
			<input type="hidden" name = "oldfile" value="${param.oldfile}">
			 
			  
			  <DIV class='bottom'>
			    <input type='submit' value='삭제'>
			    <input type='button' value='목록' onclick="blist()">
			  </DIV>
			</FORM>
 
</body>
</html> 

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>
<%String root=request.getContextPath(); %>

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
	var url = "./list.do";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	location.href = url;
}
</script>
</head> 
<body>

<DIV class="title">삭제확인</DIV>
<DIV class="content">
<c:choose>
	<c:when test="${!pflag }">
 	무언가에 의해 삭제 실패
	<button type='button' onclick='history.back()'>다시시도</button>
	</c:when>
	<c:when test="${flag }">글을 삭제했어요</c:when>
	<c:otherwise>
		삭제실패.
	</c:otherwise>	
</c:choose>

</DIV>
 
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>

</body>
</html> 

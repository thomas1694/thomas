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
<script type="text/javascript">
function nlist(n_num){
	var url = "${root}/notice/list";
	url += "?n_num="+n_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	
	location.href = url;
}
</script>
<title>notice</title>
</head>
<body>
<FORM name="not" method="POST" action="./delete" >
<input type="hidden" name="n_num" value="${param.n_num}">
<h3>정말 삭제하시겠습니까 ?</h3>

<input type="submit" class="btn btn-Default btn-md" value='삭제'/>
<input type="button" class="btn btn-Default btn-md" onclick="history.back()" value='취소'/>
</FORM>
</body>
</html>
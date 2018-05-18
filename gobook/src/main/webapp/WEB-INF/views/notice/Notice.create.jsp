<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%  request.setCharacterEncoding("utf-8");%>
<c:set var="root" value="${pageContext.request.contextPath }"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>notice</title>
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
</head>	
<body>
<div class="container">
<h2><i class="glyphicon glyphicon-th-list"></i>공지사항</h2>
<br><br>
<FORM name="not" method="POST" action="./create">
<input type="hidden" name="a_id" value="atest" >
<table class="table table-bordered">
	<tr>
	<th style="text-align:center;">제목</th>
	<td><input type="text" name="n_title" size="149"></td>
	</tr>
	<tr>
	<th style="text-align:center;">내용</th>
	<td><textarea name="n_content" rows="24" cols="150"></textarea></td>
	</tr>
</table>
<br><br>
<div style="text-align: center;">
<button class="btn btn-Default btn-md" type="submit" >등록</button>
<button class="btn btn-Default btn-md" type="button" name="" onclick="history.back()">취소</button>
</div>

</FORM>
</div>
</body>
</html>
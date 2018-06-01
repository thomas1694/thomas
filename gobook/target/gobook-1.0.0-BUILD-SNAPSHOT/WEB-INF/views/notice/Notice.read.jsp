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
function nupdate(n_num){
	var url = "${root}/notice/update";
	url += "?n_num="+n_num;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
function ndelete(n_num){
	var url = "${root}/notice/delete";
	url += "?n_num="+n_num;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
function ncreate(n_num){
	var url = "${root}/notice/create";
	url += "?n_num=";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
function nmain(){
	location.href='${root}/notice/list';
}


</script>
<title>notice</title>
<style type="text/css">

container{
text-align:center;
margin:auto;
}

</style>
</head>
<body>
<div class="container">
<h2><i class="glyphicon glyphicon-th-list"></i>공지사항</h2>
<br><br>
<table class="table table-bordered" style="text-align:center;">
	
	<tr>
		<th class="active" style="text-align:center;">번호</th>
		<td width="100">${dto.n_num}</td>
		<th class="active" style="text-align:center;">제목</th>
		<td>${dto.n_title}</td>
	</tr>
		
	<tr>
		<th class="active" style="text-align:center;">내용</th>
		<td colspan="3" width="50" style="text-align:left;">${dto.n_content}</td>	
    </tr>
    
    <tr>
		<th class="active" style="text-align:center;">작성자</th>
		<td width="70">${dto.a_id}</td>
		<th class="active" style="text-align:center;">작성일</th>
		<td>${dto.n_wdate}</td>
	</tr>
	

</table>
<br><br>
<div style="text-align: center; margin-bottom: 50px;">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="nmain()">목록</button>
	<c:if test="${sessionScope.grade=='A' }">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="ncreate('${dto.n_num}')">글 작성</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="nupdate('${dto.n_num}')">수정</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="ndelete('${dto.n_num}')">삭제</button>
	</c:if>

</div>
</div>
</body>
</html>
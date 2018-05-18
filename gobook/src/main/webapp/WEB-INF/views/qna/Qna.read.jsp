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
function qreply(q_num){
	var url = "${root}/qna/reply";
	url += "?q_num="+q_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}



function qupdate(q_num){
	var url = "${root}/qna/update";
	url += "?q_num="+q_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}

function qdelete(q_num){
	var url = "${root}/qna/delete";
	url += "?q_num="+q_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
</script>
<title>qna</title>
<style type="text/css">

container{
text-align:center;
margin:auto;
}

</style>
</head>
<body>
<div class="container">
<h2><i class="	glyphicon glyphicon-pencil"></i>질문과 답변</h2>
<br><br>
<table class="table table-bordered" style="text-align:center;">
	<tbody>
	<tr>
		<th class="active" style="text-align:center;">번호</th>
		<td width="100">${dto.q_num}</td>
		<th class="active" style="text-align:center;">제목</th>
		<td>${dto.q_title}</td>
	</tr>
		
	<tr>
		<th class="active" style="text-align:center;">내용</th>
		<td colspan="3" width="50" style="text-align:left;">${dto.q_content}</td>	
    </tr>
    
    <tr>
		<th class="active" style="text-align:center;">작성자</th>
		<td width="70">${dto.id}</td>
		<th class="active" style="text-align:center;">작성일</th>
		<td>${dto.q_wdate}</td>
	</tr>
	</tbody>
</table>
<br><br>
<div style="text-align: center;">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="history.back()">뒤로가기</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="main()">메인으로</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="qupdate('${dto.q_num}')">수정</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="qdelete('${dto.q_num}')">삭제</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="qreply('${dto.q_num}')">답글</button>
</div>
</div>
</body>
</html>
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
<script type="text/javascript">
function qlist(q_num){
	var url = "${root}/qna/list";
	url += "?q_num="+q_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}

</script>
<title>qna</title>

</head>	
<body>
<FORM method="POST" action="./reply">
<input type="hidden" name="q_num" value=${param.q_num }>
<div class="container">
<h2><i class="	glyphicon glyphicon-pencil"></i>질문과 답변</h2>
<br><br>
<table class="table table-bordered">
	
	<tr>
	<th style="text-align:center;">제목</th>
	<td><input type="text" name="q_title" size="30"></td>
	</tr>
	
	<tr>
	<th style="text-align:center;">내용</th>
	<td><textarea rows="24" cols="30" name="q_content"></textarea>
	<br>
	<input type="checkbox" name="q_lock" value="L" >비밀글 선택
	</td>
	
	</tr>
	

</table>
</div>
<br><br>
<div style="text-align: center;">
<button class="btn btn-Default btn-md" type="submit" name="" >등록</button>
<button class="btn btn-Default btn-md" type="button" name="" onclick="history.back()">취소</button>
</div>
</FORM>
</body>
</html>
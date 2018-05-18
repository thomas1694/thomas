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
function flist(faq_num){
	var url = "${root}/faq/list";
	url += "?faq_num="+faq_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	

	location.href = url;	
}

</script>
<title>faq</title>

</head>	
<body>
<FORM method="POST" action="./create">
<input type="hidden" name="a_id" value="atest">
<div class="container">
<h2><i class="glyphicon glyphicon-list-alt"></i>자주하는 질문들</h2>
<br><br>
<table class="table table-bordered">
	<tr>
	<th style="text-align:center;">제목</th>
	<td><input type="text" name="faq_title" size="149"></td>
	</tr>
	
	<tr>
	<th style="text-align:center">분류</th>
	<td>
	
	<SELECT name="faq_category">
      	<option value='이용안내' selected>이용안내</option>
      	<option value='비용'>비용</option>
      	<option value='기간'>기간</option>
      	<option value='예약'>예약</option>
      	<option value='디자인'>디자인</option>
      </select> 
	</td>
	</tr>
	
	<tr>
	<th style="text-align:center;">내용</th>
	<td><textarea name="faq_content" rows="24" cols="150"></textarea></td>
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

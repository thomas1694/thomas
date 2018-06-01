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
<title>faq</title>
<style type="text/css">
 a{
 	color: black;
 }
 a:hover {
	text-decoration: none;
}
container{
text-align:center;
margin:auto;
}
</style>
<script type="text/javascript">
	function fupdate(faq_num){
		var url = "${root}/faq/update";
		url += "?faq_num="+faq_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";	
		location.href = url;
}
	
	function fdelete(faq_num){
		var url = "${root}/faq/delete";
		url += "?faq_num="+faq_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";	
		location.href = url;
}
</script>
</head>
<body>
	<div class="faq">
	<form name="faql">
</form>
<div class="container"> 
		<h2><i class="glyphicon glyphicon-list-alt"></i>자주하는 질문들</h2>
		<br><br>
		 <table class="table table-hover table-bordered" style="text-align:center;">
		
			<tr>
				<th class="active" style="text-align:center;"><STRONG><BIG>번호</BIG></STRONG>
				<th class="active" style="text-align:center;"><STRONG><BIG>분류</BIG></STRONG></th>
				<th class="active" style="text-align:center;"><STRONG><BIG>제목</BIG></STRONG></th>
				<th class="active" style="text-align:center;"><STRONG><BIG>작성자</BIG></STRONG></th>
				<th class="active" style="text-align:center;"><STRONG><BIG>작성일</BIG></STRONG></th>
			</tr>
			
			
			<tbody>
			<tr>
				<td rowspan="2">${dto.faq_num}</td>
				<td rowspan="2">${dto.faq_category}</td>
				<td><a href="javascript:read('${dto.faq_num}')"><i class="glyphicon glyphicon-question-sign"></i>${dto.faq_title}</a></td>
				<td rowspan="2">${dto.a_id}</td>
				<td rowspan="2">${dto.faq_wdate}</td>
				</tr>
				
				<tr>
				<td><i class="glyphicon glyphicon-hand-right"></i>
				${dto.faq_content}
				</td>
				</tr>
			
			<tr>
			<td>${dto.faq_num}</td>
			<td>${dto.faq_category}</td>
			<td><a href="#">${dto.faq_title}</a></td>
			<td>${dto.a_id}</td>
				<td>${dto.faq_wdate}</td>
				</tr>
				
				<tr>
			<td>${dto.faq_num}</td>
			<td>${dto.faq_category}</td>
			<td><a href="javascript:read2('${dto.faq_num}')">${dto.faq_title}</a></td>
			<td>${dto.a_id}</td>
				<td>${dto.faq_wdate}</td>
				</tr>
				
				</tbody>
		</table>
		</div>
		<div style="text-align: center;">
	페이징1 2
	</div>
	</div>
	<br><br>
	<div style="text-align: center;">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="main()">메인으로</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="history.back()">뒤로가기</button>
	
	<button class="btn btn-Default btn-md" type="button" name="" onclick="fupdate(${dto.faq_num})">수정</button>
	<button class="btn btn-Default btn-md" type="button" name="" onclick="fdelete(${dto.faq_num})">삭제</button>
	
	</div>
</body>
</html>
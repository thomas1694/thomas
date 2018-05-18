<!-- 판매자 회원리스트 페이지 -->
<!-- 판매자용 템플릿 적용 필요함 -->
<!-- value값 받아와야 함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/c_style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="container body">	
	<h2 class='title'>회원목록</h2>
	
	<div class="search">
		<form method="post" action="./list">
			<select name="col">
				<option value="mname">성명</option>
				<option value="id">ID</option>
				<option value="email">E-mail</option>
				<option value="total">전체출력</option>
			</select>
			<input type="search" name="word" value="" placeholder="검색값을 입력하세요">
			<button class="button">검색</button>
			<br>
			<br>
		</form>
	</div>
	
	<table class="s_list">
	<tr>
		<th width="10%">아이디</th>
		<th width="10%">성명</th>
		<th width="10%">성별</th>
		<th width="15%">전화번호</th>
		<th width="20%">이메일</th>
		<th width="15%">가입일</th>	
	</tr>
	<tr>	
		<td><a href="javascript:read('')"></a></td>
		<td></td>	
		<td></td>	
		<td></td>	
		<td></td>	
		<td></td>
	</tr>
	</table>
	
	<div>
		1 2 3 4 5
	</div>	

</div>
</body>
</html>



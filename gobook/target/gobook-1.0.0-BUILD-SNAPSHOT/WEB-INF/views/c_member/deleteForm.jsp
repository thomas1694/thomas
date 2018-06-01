<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--STYLESHEETS-->
<link href="../css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container">
	<h2 class='title'></h2>

	<FORM name='frm' method='POST' action='./delete'>
		<input type="hidden" name="c_id" value="<%= (String)request.getSession().getAttribute("id") %>"/>		
		<div style="text-align: center;">
			탈퇴 후에는 아이디 <%= (String)request.getSession().getAttribute("id") %> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다. <br>
			게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
			그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.<br>
		</div>

		<DIV class='btn1'>
			<input type='submit' class="btn_submit" value='탈퇴'> 
			<input type='button' class="btn_reset" value='취소' onclick="history.back()">
		</DIV>
		
	</FORM>
</div>
</body>
</html>
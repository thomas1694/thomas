<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function big_category() {
		$("div#small_category").append("<div>카테고리 추가 input..</div>");               //태그 안에 들어간다.
	});
</script>

</head>
<body>

<div>
<form name="login-form" class="login-form" action="" method="post">
	<!--big_category-->
    <div class="big_category">
	    <!--TITLE--><h2>대분류</h2><!--END TITLE-->
	    <input type="text" name="big_category" placeholder="대분류를 입력하세요"/>
	    <button class="button" onclick="big_category()">확인</button>
    </div>
    <!--END big_category-->
	
	<!--small_category-->
    <div class="small_category">
		 <!--TITLE--><h2>소분류 추가</h2><!--END TITLE-->
	    <input type="text" name="small_category" placeholder="소분류를 입력하세요"/>
	    <button class="button" onclick="small_category()">확인</button>
	</div>
    <!--END small_category-->

</form>
</div>

</body>
</html>
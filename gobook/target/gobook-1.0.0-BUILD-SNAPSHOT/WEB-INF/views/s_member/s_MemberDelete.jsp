<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./delete" method="post">
정말 삭제 할꺼야?ㅠㅠ
<input type="hidden" name="s_id" value="${param.s_id }">
<button>삭제하기</button>
</form>

</body>
</html>
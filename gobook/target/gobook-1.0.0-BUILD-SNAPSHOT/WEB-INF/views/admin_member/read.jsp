<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr> 
		<th>관리자 아이디</th>
		<td>${dto.a_id }</td>
	</tr>
	<tr>
		<th>관리자 부서</th>
		<td>${dto.a_depart }</td>
	</tr>
	<tr>
		<td colspan="2">
			<button>수정</button>
		</td>
	</tr>
</table>
</body>
</html>
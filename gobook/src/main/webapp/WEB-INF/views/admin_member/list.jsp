<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>관리자아이디</th>
			<th>관리자부서</th>
			<th>비고</th>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>	
			<td>${dto.a_id }</td>
			<td>${dto.a_depart }</td>
			<td>
				<input type="button" value="수정" onclick="location.href='./update?aid=${dto.a_id}'">
				<c:if test="${dto.a_id!='admin' }">
				<input type="button" value="삭제" onclick="location.href='./delete?aid=${dto.a_id}'">
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<input type="button" value="관리자추가" onclick="location.href='./create'">
</body>
</html>
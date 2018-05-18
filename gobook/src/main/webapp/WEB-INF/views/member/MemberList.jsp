<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	width: 100%;
	}
	table,th,td{
	
	border: 1px solid black;
	border-collapse: collapse;
	}
	th{
	background-color: #A4A4A4;
	}
	
</style>


</head>
<body >
<div style="width: 70%;margin: auto;text-align: center;">
<h3 style="text-align: center;">회원 목록</h3>
<form style="text-align: center;margin: auto;" action="./member" method="get">
<div>
<select name="col" style="width: 30%;display: inline;">
			<option value="id">ID
			<option value="grade">회원등급
			<option value="">전체목록
		</select>

<input style="margin-left:15px;margin-right:15px;  font: 30px;height: 40px;" type="search" name="word">
<button type="submit" style="height: 40px;font:30px;width: 60px;" >검색</button>
</div>
</form>
<br><br>

<table style="vertical-align: middle;">
	<tr height="50px">
		<th style="padding: 0;vertical-align: middle;">회원ID</th>
		<th style="padding: 0;vertical-align: middle;">회원등급</th>
		<th style="padding: 0;vertical-align: middle;">비고</th>
	</tr> 
	<c:choose>
		<c:when test="${empty list }">
			<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;" colspan="3">등록된 회원이 없습니다</td>
		
	</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr height="200px;">
					<td style="padding: 0;vertical-align: middle;">${dto.id }</td>
					<td style="padding: 0;vertical-align: middle;">${dto.grade }</td>
					<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
</body>
</html>
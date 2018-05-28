<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body >
<div class="container">
<h2><span class="glyphicon glyphicon-list"></span>회원 목록</h2>
<form style="text-align: center;margin: auto;" action="./list" method="get">
<div>
<select name="col" style="width: 20%;display: inline;">
			<option value="id">ID
			<option value="grade">회원등급
			<option value="">전체목록
		</select>

<input style="width:20%;display: inline;" type="text" name="word">
<button type="submit" class="btn btn-Default btn-md" style="width: 90px;height: 40px;" >검색</button>
</div>
</form>

<table  class="table table-hover" style="margin-top: 50px;">
	<tr height="50px">
		<th style="text-align:center; width:33%; vertical-align: middle;">회원ID</th>
		<th style="text-align:center; width:33%; vertical-align: middle;">회원등급</th>
		<th style="text-align:center; width:33%; vertical-align: middle;">비고</th>
	</tr> 
	<c:choose>
		<c:when test="${empty list }">
			<tr >
		<td style="padding: 0;vertical-align: middle;" colspan="3">등록된 회원이 없습니다</td>
		
	</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr >
					<td style="text-align:center; width:33%; vertical-align: middle;">${dto.id }</td>
					<td style="text-align:center;width:33%;vertical-align: middle;">${dto.grade }</td>
					<td style="text-align:center;vertical-align: middle;">
					<form class="form-inline" action="./read" method="post" style="display: inline;" >
					<input type="hidden" name="id" value="${dto.id }">
					<input type="hidden" name="grade" value="${dto.grade }">
					<button class="btn btn-Default btn-md" style=" width: 90px;height: 40px;">정보보기</button>
					</form>
					<c:if test="${dto.id!='admin' }">
					<form class="form-inline" action="./delete" method="post" style="display: inline;"> 
					<input type="hidden" name="id" value="${dto.id }">
					<button class="btn btn-Default btn-md" style="width: 90px;height: 40px;">강제탈퇴</button>
					</form>
					</c:if>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<div style="text-align: center;margin-bottom: 50px;">
	${paging}
	</div>
</div>
</body>
</html>
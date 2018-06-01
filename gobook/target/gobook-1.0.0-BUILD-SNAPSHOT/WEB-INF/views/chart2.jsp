<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-top: -120px;">
<table style="text-align: center;">
	<tr>
	
<td>
<h1>방문자 성비율</h1>
<img src="${root }/storage/chart/${sessionScope.id}1.jpg" width="70%" >
</td>
<td>
<h1>날짜별 방문자수</h1>
<img src="${root }/storage/chart/${sessionScope.id}2.jpg" width="70%" >
	</td></tr>
</table>
</body>
</html>
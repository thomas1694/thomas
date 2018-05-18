<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<%-- <%
	String root = request.getContextPath();
	
	String str = (String)request.getAttribute("str");
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<DIV class="title">아이디 및 이메일 중복확인</DIV>
	<div class="content">
		${str}
	</div>
	<DIV class='bottom'>
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>

</body>
</html>
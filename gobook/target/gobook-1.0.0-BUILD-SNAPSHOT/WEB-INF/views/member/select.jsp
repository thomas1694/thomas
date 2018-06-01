<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.select_background{
	width:100%;
	height: 500px;
}

.select_center{
	margin: 0 auto;
	padding-top: 80px;
	padding-bottom: 80px;
	width:100%;
	text-align:center;
	background-color: #ececec;
}
.select_c{
	text-align: left;
	width:210px;
	margin-left: -30px;
}
.select_c input{
	width:210px;
}

.select_s{
	text-align: left;
	width:210px;
	margin-left: 30px;
}
.select_s input{
	width:210px;
}

</style>
</head>
<body>

<div class="select_background">
<div class="select_center">
	<span class="select_c">
		<input type="image" src="${root }/resources/ksy/images/c_select.png" 
		onclick="location.href='${root }/c_member/agree'"> 
	</span>
	<span class="select_s">
		<input type="image" src="${root }/resources/ksy/images/s_select.png" 
		onclick="location.href='${root }/s_member/agree'"> 
	</span>
</div>
</div>
</body>
</html>
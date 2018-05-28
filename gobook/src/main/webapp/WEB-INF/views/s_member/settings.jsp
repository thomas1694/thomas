<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${root }/service/list">서비스설정</a>
<a href="${root }/reservationM/list">예약정보 보기</a>
<a href="${root }/Page_Image/list">홈페이지 이미지 설정</a>
<a href="#stat">통계 확인</a>
</body>
</html>
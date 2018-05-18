<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta charset="UTF-8"> 
<title></title> 
<link rel="Stylesheet" href="${root}/top/assets/css/main.css">
</head> 
<body>

<div class="content">
<c:choose>
<c:when test="${flag}">댓글이 있으므로 삭제할 수 없습니다.<Br>
  <DIV class='bottom'>
    <input type='submit' value='뒤로' onclick="history.back()">
    <input type='button' value='목록' onclick="location.href='list'">
  </DIV>
</c:when>
<c:otherwise>
<DIV class="title"></DIV>
<FORM name='frm' method='POST' action='delete'>
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="f_num" value="${param.f_num}">
<input type="hidden" name="oldfile" value="${param.oldfile}">


  <div class='content'>정말 삭제하시겠습니까?</div>
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='목록' onclick="location.href='list'">
  </DIV>
</FORM>
</c:otherwise>
</c:choose>
 </div>

</body>
</html> 
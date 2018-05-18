<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%  request.setCharacterEncoding("utf-8");%>
<c:set var="root" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
<title>faq</title>

</head>	
<body>
<div class="container">
<h2><i class="glyphicon glyphicon-list-alt"></i>자주하는 질문들</h2>
<br><br>
<FROM name="not" method="POST" action="./update">
<input type="hidden" name="faq_num" value="${dto.faq_num}">
<table class="table table-bordered">

	
	<tr>
	<th style="text-align:center;">제목</th>
	<td><input type="text" name="faq_title" size="149" value="${dto.faq_title}"></td>
	</tr>
	
	<tr>
	<th style="text-align:center">분류</th>
	<td>
	<SELECT name="faq_category">
	
	<option  
	<c:if test="${dto.faq_category=='이용안내' }">selected="selected"</c:if>
	value="이용안내">이용안내</option>
	<option value="비용"
	<c:if test="${dto.faq_category=='비용' }">selected="selected"</c:if>
	>비용</option>
	<option value="기간"
	<c:if test="${dto.faq_category=='기간' }">selected="selected"</c:if>
	>기간</option>
	<option value="예약"
	<c:if test="${dto.faq_category=='예약' }">selected="selected"</c:if>
	>예약</option>
	<option value="디자인"
	<c:if test="${dto.faq_category=='디자인' }">selected="selected"</c:if>
	>디자인</option>
	</SELECT>
	</td>
	</tr>
	
	<tr>
	<th style="text-align:center;">내용</th>
	<td><textarea rows="24" cols="150" name="faq_content">${dto.faq_content}</textarea></td>
	</tr>
	
</table>
</div>
<br><br>
<div style="text-align: center;">
<button class="btn btn-Default btn-md" type="submit" name="" >업데이트 등록</button>
<button class="btn btn-Default btn-md" type="button" name="" onclick="history.back()">취소</button>

<input type="hidden" name="faq_num">
	<input type="hidden" name="faq_title">
	<input type="hidden" name="faq_content">
	<input type="hidden" name="faq_category">
	<input type="hidden" name="faq_wdate">
	<input type="hidden" name="a_id">
	<input type="hidden" name="col">
	<input type="hidden" name="word">
	<input type="hidden" name="nowPage">	
</div>
</FORM>
</body>
</html>
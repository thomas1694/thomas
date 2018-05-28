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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script type="text/javascript">
 function gobook(sid){
	 location.href="${root}/"+sid;
 }

</script>
</head>
<body >
<div style="width: 70%;margin: auto;text-align: center;">
<h3 style="text-align: center;">판매회원 목록</h3>
<form style="text-align: center;margin: auto;" action="./list" method="get">
<div>
<input type="hidden" name="col" value="id">
<input style="margin-left:15px;margin-right:15px;  font: 30px;height: 40px;" value="${param.word }" type="search" name="word" placeholder="다시 검색하기"><button type="submit" style="height: 40px;font:30px;width: 60px;">검색</button>
</div>
</form>
<br><br>
<table style="vertical-align: middle;">
	<tr height="50px">
		<th style="padding: 0;vertical-align: middle;">비지니스카테고리</th>
		<th style="padding: 0;vertical-align: middle;">회사ID</th>
		<th style="padding: 0;vertical-align: middle;">회사명</th>
		<th style="padding: 0;vertical-align: middle;">회사사진</th>
		<th style="padding: 0;vertical-align: middle;">평점</th>
		<th style="padding: 0;vertical-align: middle;">비고</th>
	</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;" colspan="6">검색 결과가 없습니다</td>
		
	</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }"> 
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;"><a href="#">${dto.s_category }</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">${dto.s_id }</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">${dto.s_name }</a></td>
		<td style="padding: 0;vertical-align: middle;">${dto.s_filename }</td>
		<td style="padding: 0;vertical-align: middle;"><div id="${dto.s_id }"  style="margin: auto;" >${dto.rating} 
		<script type="text/javascript">
		var $j232 = jQuery.noConflict();   

		$j232(document).ready(function ($) {
			 
			  $('#${dto.s_id}').rateYo({
			    rating: $('#${dto.s_id}').text(),
			    readOnly:true
			  });
			 
			  
			});
		</script>
		
		</div><div>(${dto.rating})</div></td>
		<td style="padding: 0;vertical-align: middle;"><button onclick="gobook('${dto.s_id}')">예약하러가기</button></td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	
</table>
</div>
</body>
</html>
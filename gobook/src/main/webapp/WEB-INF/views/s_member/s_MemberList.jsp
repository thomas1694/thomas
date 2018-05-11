<%@page contentType="text/html; charset=UTF-8" %>
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
var $j232 = jQuery.noConflict();   

$j232(document).ready(function ($) {
	 
	  $("#rateYo").rateYo({
	    rating: 3.6,
	    readOnly:true
	  });
	 
	  $("#rateYo2").rateYo({
		    rating: 4.5,
		    readOnly:true
		  });
	});
</script>
</head>
<body >
<div style="width: 70%;margin: auto;text-align: center;">
<h3 style="text-align: center;">판매회원 목록</h3>
<form style="text-align: center;margin: auto;">
<div>
<select id="col" style="width: 30%;display: inline;">
			<option value="A01">판매자번호
			<option value="A02">비지니스카테고리
			<option value="A03">회사ID
			<option value="A04">회사명
		</select>

<input style="margin-left:15px;margin-right:15px;  font: 30px;height: 40px;" type="search" id="word"><button type="button" style="height: 40px;font:30px;width: 60px;">검색</button>
</div>
</form>
<br><br>
<table style="vertical-align: middle;">
	<tr height="50px">
		<th style="padding: 0;vertical-align: middle;">판매자번호</th>
		<th style="padding: 0;vertical-align: middle;">비지니스카테고리</th>
		<th style="padding: 0;vertical-align: middle;">회사ID</th>
		<th style="padding: 0;vertical-align: middle;">회사명</th>
		<th style="padding: 0;vertical-align: middle;">회사사진</th>
		<th style="padding: 0;vertical-align: middle;">평점</th>
		<th style="padding: 0;vertical-align: middle;">비고</th>
	</tr> 
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">2</td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">레스토랑</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">MomsTouch</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">Mom's Touch</a></td>
		<td style="padding: 0;vertical-align: middle;"><img src="http://www.parque-net.com/foreign/cmn/img/restaurants/alhambra_img.jpg" width="200px" height="200px"></td>
		<td style="padding: 0;vertical-align: middle;"><div id="rateYo" style="margin: auto;"></div></td>
		<td style="padding: 0;vertical-align: middle;"><button>예약하러가기</button></td>
	</tr>
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">1</td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">병원</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">JSHospital</a></td>
		<td style="padding: 0;vertical-align: middle;"><a href="#">JinSick</a></td>
		<td style="padding: 0;vertical-align: middle;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPNTFC97CjLRzBDnWn33j-_e0U45aNmeUcW2nXiQ52CQm0uhqz" width="200px" height="200px"></td>
		<td style="padding: 0;vertical-align: middle;"><div id="rateYo2" style="margin: auto;"></div></td>
		<td style="padding: 0;vertical-align: middle;"><button>예약하러가기</button></td>
	</tr>
</table>
</div>
</body>
</html>
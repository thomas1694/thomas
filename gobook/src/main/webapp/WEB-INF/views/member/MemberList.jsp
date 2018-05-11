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


</head>
<body >
<div style="width: 70%;margin: auto;text-align: center;">
<h3 style="text-align: center;">회원 목록</h3>
<form style="text-align: center;margin: auto;">
<div>
<select id="col" style="width: 30%;display: inline;">
			<option value="B01">ID
			<option value="B02">회원등급
			<option value="B03">전체목록
		</select>

<input style="margin-left:15px;margin-right:15px;  font: 30px;height: 40px;" type="search" id="word"><button type="button" style="height: 40px;font:30px;width: 60px;">검색</button>
</div>
</form>
<br><br>
<table style="vertical-align: middle;">
	<tr height="50px">
		<th style="padding: 0;vertical-align: middle;">회원ID</th>
		<th style="padding: 0;vertical-align: middle;">회원등급</th>
		<th style="padding: 0;vertical-align: middle;">비고</th>
	</tr> 
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">aaa</td>
		<td style="padding: 0;vertical-align: middle;">S</td>
		<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
	</tr>
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">bbb</td>
		<td style="padding: 0;vertical-align: middle;">S</td>
		<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
	</tr>
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">ccc</td>
		<td style="padding: 0;vertical-align: middle;">C</td>
		<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
	</tr>
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">ddd</td>
		<td style="padding: 0;vertical-align: middle;">C</td>
		<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
	</tr>
	<tr height="200px;">
		<td style="padding: 0;vertical-align: middle;">eee</td>
		<td style="padding: 0;vertical-align: middle;">A</td>
		<td style="padding: 0;vertical-align: middle;"><button>강제탈퇴</button></td>
	</tr>
</table>
</div>
</body>
</html>
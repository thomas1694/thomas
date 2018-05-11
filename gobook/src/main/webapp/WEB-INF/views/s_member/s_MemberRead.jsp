<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #map {
        height: 400px;
        width: 50%;
       }
      table{
      width: 100%;
      }
       table,th,td{
       border-collapse: collapse;
       border: 1px solid black;
       }
</style>

	<script type="text/javascript">
	function update_mimg(){
		
			var url = "${root}/member/imgupdate";
			
			
			wr = window.open(url, "대표이미지변경", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
		
	}
	function update_smember(){
		var url="${root}/s_member/update";
		location.href=url;
	}
	function delete_smember(){
		var url="${root}/s_member/delete";
		location.href=url;
	}
	</script>
    <script>
      function initMap() {
        var uluru = {lat: 37.493484, lng: 126.726519};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5l8wf2nrNmC5QGOLqqSB7bJG0fNiVjS0&callback=initMap">
    </script>
</head>
<body>
	<h3 style="text-align: center;">판매회원 정보</h3>
	<table>
		<tr>
			<th style="vertical-align: top;">대표이미지</th>
			<td><img src="${root }/storage/member/img/member.jpg" width="225px" height="225px"></td>
		</tr>
		<tr>
			<th>회사ID</th>
			<td>JSH</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>JSH@Jinsick.com</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td>+821021312221</td>
		</tr>
		
		<tr>
			<th>비지니스카테고리</th>
			<td>병원</td>
		</tr>
		
		<tr>
			<th>회사위치</th>
			<td>인천시 부평구 부평동 롯데시네마 3층 Jinsick의원<div id="map"></div></td>
		</tr>
		
		<tr>
			<th>회사명</th>
			<td>진식이비인후과</td>
		</tr>
		
		<tr>
			<th>회사설명</th>
			<td>부평 근방에서 막힌코를 제일 잘 뚫어드립니다!
			</td>
		</tr>
		
		<tr>
			<th>영업시간</th>
			<td>월 = 09:00~17:00<br>
			화 = 09:00~17:00<br>
			수 = 09:00~17:00<br>
			목 = 09:00~17:00<br>
			금 = 09:00~17:00<br>
			토 = 09:00~17:00<br>
			일 = 09:00~17:00<br>
			
			</td>
		</tr>
	</table>
	<br>
	<div style="text-align: center; font-size: 20px;">
	<button type="button" onclick="update_mimg()">대표이미지변경</button>
	<button type="button" onclick="update_smember()">회원정보수정</button>
	<button type="button" onclick="update_passwd()">패스워드변경</button>
	<button type="button" onclick="delete_smember()">회원탈퇴</button>
	</div>
</body>
</html>
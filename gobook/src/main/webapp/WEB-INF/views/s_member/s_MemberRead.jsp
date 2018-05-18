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
       #gbfile,#gbsubmit{
          display: block;
   		  visibility: hidden;
   		  width: 0;
   		  height: 0;
       }
</style>

	<script type="text/javascript">
	function update_mimg(){
		
		
		    $('#gbfile').click();
		    $('#gbfile').change(function (){
		    	$('#gbsubmit').click();
		    });
		           
		
	}
	function update_smember(){
		var url="${root}/s_member/update?s_id=";
		url+="${dto.s_id }";
		location.href=url;
	}
	function delete_smember(){
		var url="${root}/s_member/delete?s_id=";
		url+="${dto.s_id }";
		location.href=url;
	}
	</script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47844deb89b482d0297165cccbc1dd67&libraries=services"></script>
	<script>
	var $d = jQuery.noConflict(); 

	$d(document).ready(function($){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
        		center: new daum.maps.LatLng(${dto.s_location }), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
    		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var markerPosition  = new daum.maps.LatLng(${dto.s_location }); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	});
		</script>
</head>
<body>
	<h3 style="text-align: center;">판매회원 정보</h3>
	<table>
		<tr>
			<th style="vertical-align: top;">대표이미지</th>
			<td><img src="${root }/storage/member/img/${dto.s_filename}" width="225px" height="225px"></td>
		</tr>
		<tr>
			<th>회사ID</th>
			<td>${dto.s_id }</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>${dto.s_email }</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td>${dto.s_tel }</td>
		</tr>
		
		<tr>
			<th>비지니스카테고리</th>
			<td>${dto.s_category }</td>
		</tr>
		
		<tr>
			<th>회사위치</th>
			<td>${s_address1 }  ${s_address2 }<div id="map"></div></td>
		</tr>
		<tr>
			<th>회사우편번호</th>
			<td>${dto.s_zipcode }</td>
		</tr>
		<tr>
			<th>회사명</th>
			<td>${dto.s_name }</td>
		</tr>
		
		<tr>
			<th>회사설명</th>
			<td>${dto.s_info }
			</td>
		</tr>
		
		<tr>
			<th>영업시간</th>
			<td>${dto.s_hour }
			
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
	<div>
	<form action="./updateImg" method="post" enctype="multipart/form-data">
	<input type="file" id="gbfile" name="filenameMF">
	<input type="hidden" name="s_id" value="${dto.s_id }">
	<input type="submit" id="gbsubmit">
	</form>
	</div>
</body>
</html>
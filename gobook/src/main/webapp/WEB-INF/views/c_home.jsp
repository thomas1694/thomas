<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>


<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${root }/resources/pmw/c_template/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbc9a44495a229ba6b4ecd67265a238a&libraries=services"></script>
	<script>
	var $d = jQuery.noConflict(); 

	$d(document).ready(function($){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
        		center: new daum.maps.LatLng(${sdto.s_location }), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
    		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		
		var markerPosition  = new daum.maps.LatLng(${sdto.s_location }); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	});
		</script>
		
		<script type="text/javascript">
		function chat(){
			var url = "${root}/${sdto.s_id}/chat";
			wr = window.open(url, "채팅하기", "width=500,height=800"); /*  window.open : 새창  wr는 새창을 말한다.*/		
			wr.moveTo((window.screen.width-800)/2,(window.screen.height-1200)/2);
			}              /* x좌표와 y좌표를 나타낸다 */
		
		
		</script>
	</head>
	<body>

		
		<!-- Main -->
			<div id="main" style="margin-left: 0;">
				
				<!-- Portfolio -->
					<section id="top" class="one">
						<div class="container">

							<header>
								<h2>${sdto.s_id } 소개</h2>
							</header>

							<p>${sdto.s_info }</p>
							
							
							<c:choose>
								<c:when test="${empty plist }">
									<p>등록된 사진이 없습니다.</p>
									<br>
									<c:if test="${sessionScope.id==sdto.s_id }">
									<input type="button" value="설정하러 가기" onclick="location.href='${root}/s_member/settings'">
									</c:if>
								</c:when>
								<c:otherwise>
								<c:forEach var="pdto" items="${plist }"  varStatus="status">
								<c:if test="${status.index eq 0 || status.index eq 3 }">
								<div class="row">
								</c:if>
									<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="${root }/storage/page_image/${pdto.pg_filename}" alt="" /></a>
										<header>
											<h3>${pdto.pg_content }</h3>
										</header>
									</article>
								</div>
								
								<c:if test="${status.index eq 2 || status.index eq 5 }">
									</div>
								</c:if>
							</c:forEach>
							</c:otherwise>
							</c:choose>
						
						</div>
					</section>

				


				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>Location</h2>
							</header>


							<div id="map" style="width: 100%;height:700px;"></div>
							<p>${sdto.s_address1 }  ${sdto.s_address2 }</p>
						</div>
					</section>

				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">

							<header>
								<h2>Info & Contact Me</h2>
							</header>
							<p>전화번호 : ${sdto.s_tel }</p>

							<p>영업시간 : <br><div style="margin-left:100px;">${sdto.c_hour }시</div></p>

							<p>이 메 일 : ${sdto.s_email }</p>
								
							<p>문의 사항 및 요청 사항이 있으신분은 아래 버튼으로 실시간 채팅 서비스를 이용하세요!</p>

							<button type="button" onclick="chat()">채팅하기</button>
						</div>
					</section>

			

		

	</body>
</html>
<%@page contentType="text/html; charset=UTF-8" %>
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
		<link rel="stylesheet" href="css/c_template/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
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

		
		<!-- Main -->
			<div id="main">
				
				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>${id } 소개</h2>
							</header>

							<p>코를 정말 잘 뚫어주는 병원입니다.</p>

							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img1.jpg" alt="" /></a>
										<header>
											<h3>진료중인 진시크 원장님</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img2.jpg" alt="" /></a>
										<header>
											<h3>병원 내부</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img3.jpg" alt="" /></a>
										<header>
											<h3>주사실</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img4.jpg" alt="" /></a>
										<header>
											<h3>대기실</h3>
										</header>
									</article>
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img5.png" alt="" /></a>
										<header>
											<h3>검사실</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="css/c_template/images/img6.JPG" alt="" /></a>
										<header>
											<h3>병원 카운터</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>Location</h2>
							</header>


							<div id="map" ></div>
						</div>
					</section>

				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">

							<header>
								<h2>Contact Me</h2>
							</header>
								
							<p>문의 사항 및 요청 사항이 있으신분은 아래 버튼으로 실시간 채팅 서비스를 이용하세요!</p>

							<form method="post" action="#">
								<div class="row">
									
									<div class="12u$">
										<input type="submit" value="채팅 시작하기" />
									</div>
								</div>
							</form>

						</div>
					</section>

			</div>

		

	</body>
</html>
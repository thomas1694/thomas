<!DOCTYPE html>
<html>
<head>
<title>Gobook</title>
<meta charset="utf-8">
<meta name="description" content="Traveling HTML5 Template" />
<meta name="author" content="Design Hooks" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Raleway:400,700"
	rel="stylesheet" />
<link href="img/favicon.png" type="image/x-icon" rel="shortcut icon" />
<link href="css/screen.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>



</head>
<body class="home" id="page">
	<!-- Header -->
	<div class="main-header">
	<%@include file="../top/top.html" %>
	</div>
	<!-- Main Content -->
	<div class="content-box">
		<!-- Hero Section -->
		<section class="section section-hero">
			<div class="hero-box">
				<div class="container">
					<div class="hero-text align-center">
						<h1>Let's make a reservation</h1>
						<p>From our site Gobook!</p>
					</div>

					<form class="destinations-form">
						<div class="input-line">
							<input style="background-color: #ffffff;" type="text" name="destination" value=""
								class="form-input check-value" placeholder="검색해봐." />
							<button type="button" name="destination-submit"
								class="form-submit btn btn-special">Find a Gobook</button>
						</div>
					</form>
				</div>
			</div>

			<!-- Statistics Box -->
			<div class="container">
				<div class="statistics-box">
					<div class="statistics-item">
						<span class="value">2,300</span>
						<p class="title">등록된 스토어수</p>
					</div>

					<div class="statistics-item">
						<span class="value">1,000</span>
						<p class="title">일 스토어 방문자 수</p>
					</div>

					<div class="statistics-item">
						<span class="value">350,000</span>
						<p class="title">평균 방문자 수</p>
					</div>

					<div class="statistics-item">
						<span class="value">500,000</span>
						<p class="title">총 회원수</p>
					</div>
				</div>
			</div>
		</section>
		</div>

		<!-- Footer -->
		<footer class="main-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="widget widget_links">
							<h5 class="widget-title">Gobook</h5>
							<ul>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="../team2/index.html">후기게시판</a></li>
								<li><a href="#">질문게시판</a></li>
								<li><a href="#">자주하는질문</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-5">
						<div class="widget widget_links">
							<h5 class="widget-title">category</h5>
							<ul>
								<li><a href="#">Food</a></li>
								<li><a href="#">Stay</a></li>
								<li><a href="#">shopping</a></li>
								<li><a href="#">Everyday life</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-9">
						<div class="widget widget_social">
							<h5 class="widget-title">스토어 검색</h5>
							<form class="subscribe-form">
								<div class="input-line">
									<input type="text" name="subscribe-email" value=""
										placeholder="For example : Pizza" />
								</div>
								<button type="button" name="subscribe-submit"
									class="btn btn-special no-icon">Search</button>
							</form>

							<ul class="clean-list social-block">
								<li><a href="#"><i class="icon-facebook"></i></a></li>
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-google-plus"></i></a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-5">
						<div class="widget widget_links">
							<h5 class="widget-title">Contact us</h5>
							<ul>
								<li><a href="#">임시 테이블</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>

		<!-- Scripts -->
		<script src="js/jquery.js"></script>
		<script src="js/functions.js"></script>
		
		
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>고북닷컴</title>
<meta charset="utf-8">
<meta name="description" content="Traveling HTML5 Template" />
<meta name="author" content="Design Hooks" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>



</head>
<body class="home" id="page">
	

	<!-- Main Content -->
	<div class="content-box" style="margin-top: -150px;">
		<!-- Hero Section -->
		<section class="section section-hero">
			<div class="hero-box">
				<div class="container">
					<div class="hero-text align-center">
						<h1>Let's make a reservation</h1>
						<p>From our site Gobook!</p>
					</div>

					<form class="destinations-form" method="get" action="./s_member/list">
						<div class="input-line">
							<input type="hidden" name="col" value="id">
							<input style="background-color: #ffffff;" type="text" name="word" value=""
								class="form-input check-value" placeholder="검색해봐." />
							<button type="submit" 
								class="form-submit btn btn-special">Find a Gobook</button>
						</div>
					</form>
				</div>
			</div>

			<!-- Statistics Box -->
			<div class="container">
				<div class="statistics-box">
					<div class="statistics-item">
						<span class="value">${stotal }</span>
						<p class="title">등록된 스토어수</p>
					</div>

					<div class="statistics-item">
						<span class="value">${sessionScope.todayCount}</span>
						<p class="title">일 스토어 방문자 수</p>
					</div>

					<div class="statistics-item">
						<span class="value">${sessionScope.totalCount}</span>
						<p class="title">평균 방문자 수</p>
					</div>

					<div class="statistics-item">
						<span class="value">${total }</span>
						<p class="title">총 회원수</p>
					</div>
				</div>
			</div>
		</section>



		<!-- Scripts -->
		<script src="${root }/resources/pmw/bottom/js/jquery.js"></script>
		<script src="${root }/resources/pmw/bottom/js/functions.js"></script>
		
		<script src="${root }/resources/pmw/bottom/js/jquery.min.js"></script>
		<script src="${root }/resources/pmw/bottom/js/skel.min.js"></script>
		<script src="${root }/resources/pmw/bottom/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${root }/resources/pmw/bottom/js/main.js"></script>
		
</body>
</html>


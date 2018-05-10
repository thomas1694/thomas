<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${root }/top/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" style="height: 150px; background-color: #70866F; color: white; font-size: 20px;">
						
						<h1 style="margin-top: 30px; width:20%;text-align: center;"><a href="#"><img src="${root }/top/images/goobookTitle.png" width="250px" ></a></h1>
						<nav class="links">
							<ul style="margin-top:45px;">
								<li><a href="#">Notice</a></li>
								<li><a href="#">FreeBoard</a></li>
								<li><a href="#">Customer Center</a></li>
							</ul>
						</nav>
						<nav class="main" >
							<ul  >
								<li class="search">
									<a style="margin-top: 40px;" class="fa-search" href="#search">Search</a>
									<form style="margin-top:40px;"  id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="user">
									<a style="margin-top:40px;" class="fa-user" href="#user">User</a>
								</li>
								<li class="menu">
									<a style="margin-top: 40px;" class="fa-bars" href="#menu">Menu</a>
								</li>
								
							</ul>
						</nav>
						
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
									<li><a href="#" class="btn big fit">Log In</a></li>
								</ul>
							</section>

					</section>

				

					


			</div>

		<!-- Scripts -->
			<script src="${root }/top/assets/js/jquery.min.js"></script>
			<script src="${root }/top/assets/js/skel.min.js"></script>
			<script src="${root }/top/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${root }/top/assets/js/main.js"></script>

	</body>
</html>
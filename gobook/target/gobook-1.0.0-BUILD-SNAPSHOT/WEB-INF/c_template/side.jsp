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
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		<script type="text/javascript">
			function book(){
				jQuery.noConflict();
				if(${sessionScope.id==null}){
					alert('예약을 하기 위해서는 로그인이 필요합니다. 로그인 페이지로 이동합니다.');
					location.href="${root}/member/login";
				}else if(${sessionScope.grade=="S"}){
					alert('예약은 소비자 회원만 가능합니다.');
				}else{	
					jQuery("#res").css("color","white");
					var url = "${root}/${sdto.s_id}/reservation"
					wr = window.open(url, "예약하기", "width=1500,height=900"); /*  window.open : 새창  wr는 새창을 말한다.*/		
					wr.moveTo((window.screen.width-1500)/2,(window.screen.height-1200)/2);
					}              /* x좌표와 y좌표를 나타낸다 */
			};
		</script>
	</head>
	<body>

		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="${root }/storage/member/img/${sdto.s_filename}" alt="" /></span>
							<h1 id="title">${sdto.s_id }</h1>
							<p>${sdto.s_category }</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<!--

								Prologue's nav expects links in one of two formats:

								1. Hash link (scrolls to a different section within the page)

								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>

							-->
							<ul>
								<li><a href="${root }/${sdto.s_id }#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Intro</span></a></li>
								<li><a href="javascript:book()" id="portfolio-link" class="skel-layers-ignoreHref"><span id="res" class="icon fa-th">Reservation</span></a></li>
								<li><a href="${root }/${sdto.s_id }/review/list" id="portfolio-link" class="skel-layers-ignoreHref"><span id="res" class="icon fa-th">Review</span></a></li>
								<li><a href="${root }/${sdto.s_id }#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-map-marker">Location</span></a></li>
								<li><a href="${root }/${sdto.s_id }#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-comments-o">Contact me</span></a></li>
							</ul>
						</nav>

				</div>

				<div class="bottom" style="text-align: center;">
				<c:if test="${sessionScope.id==null }">
					<ul>
					<li><a href="${root}/member/login"  class="skel-layers-ignoreHref"><i class="fas fa-sign-in-alt"></i>Log In</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id!=null }">
					<ul>
					<li><a href="${root}/member/logout"  class="skel-layers-ignoreHref"><i class="fas fa-sign-out-alt"></i>Log Out</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id==sdto.s_id }">
					<ul>
					<li><a href="${root}/s_member/settings" class="skel-layers-ignoreHref"><i class="fas fa-cogs"></i> Settings</a></li>
					</ul>
				</c:if>
					<!-- Social Icons -->
					<!-- 	<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
					-->
					<a href="${root }"><img src="${root }/resources/pmw/top/images/goobookTitle.png" width="90%" ></a>
				</div>

			</div>

		

		

		<!-- Scripts -->
			<script src="${root }/resources/pmw/c_template/assets/js/jquery.min.js"></script>
			<script src="${root }/resources/pmw/c_template/assets/js/jquery.scrolly.min.js"></script>
			<script src="${root }/resources/pmw/c_template/assets/js/jquery.scrollzer.min.js"></script>
			<script src="${root }/resources/pmw/c_template/assets/js/skel.min.js"></script>
			<script src="${root }/resources/pmw/c_template/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${root }/resources/pmw/c_template/assets/js/main.js"></script>

	</body>
</html>
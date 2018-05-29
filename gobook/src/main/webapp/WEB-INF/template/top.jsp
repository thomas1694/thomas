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
		<link rel="stylesheet" href="${root }/resources/pmw/top/assets/css/main.css" />
		<link rel="stylesheet" href="${root }/resources/syh/css/message.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script src="${root }/resources/pmw/top/assets/js/jquery.min.js"></script>
		<script type="text/javascript">
			sessionStorage.setItem('id', '${sessionScope.id}');
		</script>
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" style="height: 150px; background-color: #70866F; color: white; font-size: 20px;">
						
						<h1 style="margin-top: 30px; width:20%;text-align: center;"><a href="${root }"><img src="${root }/resources/pmw/top/images/goobookTitle.png" width="250px" ></a></h1>
						<nav class="links">
							<ul style="margin-top:45px;">
								<li><a href="${root }/freeboard/list">FreeBoard</a></li>
								<li><a href="${root }/cscenter">Customer Center</a></li>
								<c:if test="${sessionScope.grade=='S' }">
								<li><a href="${root }/s_member/settings">Settings</a></li>
								<li><a href="${root }/${sessionScope.id}">My Home</a></li>
								</c:if>
								<c:if test="${sessionScope.grade=='C' }">
								<li><a href="${root }/reservationM/list">My Book</a></li>
								</c:if>
								<c:if test="${sessionScope.grade=='A' }">
								<li><a href="${root }/member/list">Member</a></li>
								</c:if>
								<c:if test="${sessionScope.grade=='A'&&sessionScope.id=='admin' }">
								<li><a href="${root }/admin/list">Admin Manage</a></li>
								</c:if>
							</ul>
						</nav>
						<nav class="main" >
							<ul>
								<li class="search" style="display: inline;">
									<a style="margin-top: 40px;" class="fa-search" href="#search">Search</a>
									<form style="margin-top:60px;"  id="search" method="get" action="${root }/s_member/list">
										<input type="text" id="sp" name="word" placeholder="검색어 입력후 엔터!" />
										<input type="hidden" name="col" value="id"/>
									</form>
								</li>
								<% if(session.getAttribute("id")!=null) { %> 
								<li class="message">
								<span id="span_count" style="z-index: 2;"></span>
									<a style="margin-top:67px; z-index: 1;" class="fa fa-envelope-o" href="javascript:messageop()">Message</a>
									<div id="message_div">
										<div id="message_nav">
											<div class="message_navbtn" id="listbtn" onclick="newmlist()">받은쪽지함</div>
											<div class="message_navbtn" id="sendlistbtn" onclick="newmsendlist()">보낸쪽지함</div>
											<div class="message_navbtn" id="createbtn" onclick="mcreateform()">쪽지보내기</div>
										</div>
										<table id="message_content"></table>
										<div id="message_paging" style="text-align:center"></div>
										<div id="message_etc"></div>
									</div>
								</li>
								<li class="user">
									<a style="margin-top:40px;" class="fa-user" href="#user">User</a>
									<form style="margin-top:40px;"  id="user" method="get" action="${root }/s_member/list">
									<div>
									<% if(session.getAttribute("grade").equals("A")){ %>
										<input type="button" onclick="location.href='${root}/admin/read'" name="1" value="정보보기" style="width:100%; background-color: #70866F; color: white; text-align: center;"><br>
									<%}else{ %>
										<input type="button" onclick="location.href='${root}/member/read'" name="1" value="정보보기" style="width:100%; background-color: #70866F; color: white; text-align: center;"><br>
										<%} %>
										<input type="button" name="2" onclick="location.href='${root}/member/logout'" value="로그아웃" style="width:100%;background-color: #70866F; color: white; text-align: center;"></div>
									</form>
								</li>
								<% }else{ %>
								<li class="user">
									<a style="margin-top:40px;" class="fa-user" href="${root }/member/login">User</a>
									
								</li>
								<%} %> 
								
							</ul>
						</nav>
						
					</header>

				

				

					


			</div>
		<!-- Scripts -->
			<script src="${root }/resources/syh/js/message.js"/></script>
		<!-- Scripts -->
			
			<script src="${root }/resources/pmw/top/assets/js/skel.min.js"></script>
			<script src="${root }/resources/pmw/top/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${root }/resources/pmw/top/assets/js/main.js"></script>

	</body>
</html>
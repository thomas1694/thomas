<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="description" content="Traveling HTML5 Template" />
<meta name="author" content="Design Hooks" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<link href="${root }/resources/pmw/bottom/img/gobook_icon.png" type="image/x-icon" rel="shortcut icon" />
<link href="${root }/resources/pmw/bottom/css/screen.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>



</head>
<body class="home" id="page">
	

		<!-- Footer -->
		<footer class="main-footer" style="height: 250px; ">
		
			<div class="container"  style="width: 1200px;margin: auto;">
				<div class="row2">
					<div class="col-md-5" style="margin-right: 18%;">
						<div class="widget widget_links">
							<h5 class="widget-title">Gobook</h5>
							<ul>
								<li><a href="${root }/notice/list">공지사항</a></li>
								<li><a href="${root }/freeboard/list">자유게시판</a></li>
								<li><a href="${root }/review/list">후기게시판</a></li>
								<li><a href="${root }/qna/list">질문게시판</a></li>
								<li><a href="${root }/faq/list">자주하는질문</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-5" style="margin-right: 18%;">
						<div class="widget widget_links">
							<h5 class="widget-title">category</h5>
							<ul>
								<li><a href="${root }/s_member/list?col=id&word=restaurant">레스토랑</a></li>
								<li><a href="${root }/s_member/list?col=id&word=hospital">병원</a></li>
								<li><a href="${root }/s_member/list?col=id&word=studycafe">스터디카페</a></li>
								<li><a href="${root }/s_member/list?col=id&word=beauty">뷰티</a></li>
								<li><a href="${root }/s_member/list?col=id&word=etc">기타</a></li>
							</ul>
						</div>
					</div>

					

					<div class="col-md-5">
						<div class="widget widget_links">
							<h5 class="widget-title">Contact us</h5>
							<ul>
								<li>서울특별시 종로구 관철동 코아빌딩 5층 <br>솔데스크 3강의실</li>
								
							</ul>
							<br><br>
							<ul class="clean-list social-block">
								<li><a href="https://www.facebook.com"><i class="icon-facebook"></i></a></li>
								<li><a href="https://twitter.com/?lang=ko"><i class="icon-twitter"></i></a></li>
								<li><a href="https://www.google.co.kr"><i class="icon-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</footer>

		<!-- Scripts -->
		<script src="${root }/resources/pmw/bottom/js/jquery.js"></script>
		<script src="${root }/resources/pmw/bottom/js/functions.js"></script>
		
		<script src="${root }/resources/pmw/bottom/js/skel.min.js"></script>
		<script src="${root }/resources/pmw/bottom/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${root }/resources/pmw/bottom/js/main.js"></script>
</body>
</html>

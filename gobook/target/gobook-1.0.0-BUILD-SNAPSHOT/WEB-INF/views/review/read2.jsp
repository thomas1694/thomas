<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function mupdate(re_num){
var url ="./update";
url +=  "?re_num="+re_num;
url += "&oldfile=${dto.filename}"; 
url += "&col=${param.col}";
url += "&word=${param.word}";
url += "&nowPage=${param.nowPage}";

location.href=url;
}
function mdel(re_num){
var url ="./delete";
url += "?re_num="+re_num;
url += "&oldfile=${dto.filename}";
url += "&col=${param.col}";
url += "&word=${param.word}";
url += "&nowPage=${param.nowPage}";

location.href=url;
}
function mlist(re_num){
	var url = "./list";
	url += "?re_num="+re_num;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script> 
<title>Post detail</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- Fonts-->
<link rel="stylesheet" type="text/css"
	href="${root }/resources/cjs/css/css_review/assets/fonts/fontawesome/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${root }/resources/cjs/css/css_review/assets/fonts/pe-icon/pe-icon.css">
<!-- Vendors-->
<link rel="stylesheet" type="text/css"
	href="${root }/resources/cjs/css/css_review/assets/vendors/bootstrap/grid.css">
<link rel="stylesheet" type="text/css"
	href="${root }/resources/cjs/css/css_review/assets/vendors/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet" type="text/css"
	href="${root }/resources/cjs/css/css_review/assets/vendors/swiper/swiper.css">
<!-- App & fonts-->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:400,700">
<link rel="stylesheet" type="text/css" id="app-stylesheet"
	href="${root }/resources/cjs/css/css_review/assets/css/main.css">
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<![endif]-->
</head>


<body>
	<div class="page-wrap" id="root">




		<!-- Section -->
		<section class="awe-section ">
			<div class="container">

				<!--  -->
				<div>
					<div class="post-detail__media">
						<img
							src="https://i.pinimg.com/originals/c3/ba/5c/c3ba5c903f414c9e014771d55f083eac.jpg?w=1260&amp;h=750&amp;auto=compress&amp;cs=tinysrgb"
							alt="" />
					</div>
					<div class="post-detail__entry row">
						<div class="col-md-8">
							<h5>"아저씨,사랑해요.사랑해."</h5>

							<p>"천년 만년 가는 슬픔이 어딨겠어.천년 만년 가는 사랑이 어딨고."</p>
							<p>"난 있다에 한 표."</p>
							<p>"어느 쪽에 걸건데?슬픔이야,사랑이야?"</p>
							<p>"슬픈 사랑?"</p>
							<p>'슬픈 사랑' 이 말이 도깨비-김신(공유)와 도깨비 신부-지은탁(김고은),왕여-저승사자(이동욱)와
								김선-써니(유인나)의 사랑을 정의한다.</p>
							<p>도깨비와 사랑에 빠졌지만 검을 뽑아 도깨비를 무로 되돌릴 운명의 도깨비 신부.</p>
							<p>그 운명을 알기에 벗어나려 애쓰는 도깨비.</p>
							<p>전생에 자신을 죽게 하고,오라버니를 죽게 하고,가문의 죄없는 사람들을 죽게 한 사람을 아직도 사랑하는
								선.</p>
							<p>그 전생의 죄를 뼈저리게 후회하고 아파하고 선을 그리워하는 여.</p>
							<p>이 두 '슬픈 사랑'은 각기 다른 양상을 띈다.</p>
							<p>정해진 운명을 넘어서 사랑을 이루는 도깨비 내외와</p>
							<p>전생에도 현생에도 서로 사랑하지만 결국 이루어지지 못하는 여와 선.</p>
							<p>결국 이 둘은 세번째 생이 되어서야 진정 사랑을 나누게 된다.</p>
				

						</div>
					</div>
					<div class="sharebox__module">
						<p class="social-text">MENU</p>

						<DIV class='bottom'>

							<input type='button' value='추천' onclick="">
							<input type='button' value='LIST' onclick="mlist(${dto.re_num})">
							<input type='button' value='UPDATE'onclick="mupdate(${dto.re_num})"> 
							<input type='button'value='DELETE' onclick="mdel(${dto.re_num})">
						</DIV>

					</div>
				</div>
				<!-- End /  -->
		</section>
		<!-- End / Section -->

	</div>
	<!-- End / Content-->


	</div>
	<!-- Vendors-->
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/imagesloaded/imagesloaded.pkgd.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/isotope-layout/isotope.pkgd.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/jquery-one-page/jquery.nav.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/jquery.easing/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/jquery.matchHeight/jquery.matchHeight.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/masonry-layout/masonry.pkgd.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/jquery.waypoints/jquery.waypoints.min.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/swiper/swiper.jquery.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/menu/menu.js"></script>
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/vendors/typed/typed.min.js"></script>
	<!-- App-->
	<script type="text/javascript"
		src="${root }/resources/cjs/css/css_review/assets/js/main.js"></script>
</body>
</html>
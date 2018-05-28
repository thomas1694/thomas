<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.setting_background{
	width:100%;
	height: 600px;
}

.setting_center{
	margin-top:30px;
	margin-left:20%;
}
.setting_center2{
	margin-top:0px;
	margin-left:20%;
}

.setting_1_img{
	width: 120px;
	height:169px; 
	margin-top: 0px;
	margin-right: 0px;
	margin-left: 120px;
	vertical-align:middle;
	border:0px;	
	background:#e5e2da;
}
.setting_1{	
	color:#fff; 
	margin-right:0%;	
	line-height:160px;
	width:500px;
	font-size:30px;
	font-family:"NanumGothic",sans-serif;
	background:#a59d89;
	text-align: right;
	vertical-align:middle;
	border:0px;
}

.setting_2_img{
	width: 120px;
	height:169px; 
	margin-top: 0px;
	margin-right: 120px;
	margin-left: 0px;
	vertical-align:middle;
	border:0px;	
	background:#e8d8d8;
}
.setting_2{	
	color:#fff; 
	margin-right:0%;	
	line-height:160px;
	width:500px;
	font-size:30px;
	font-family:"NanumGothic",sans-serif;
	background:#a48889;
	text-align: left;
	vertical-align:middle;
	border:0px;
}

.setting_3_img{
	width: 120px;
	height:169px; 
	margin-top: 0px;
	margin-right: 0px;
	margin-left: 40px;
	vertical-align:middle;
	border:0px;	
	background:#b9c1B7;
}
.setting_3{	
	color:#fff; 
	margin-right:0%;	
	line-height:160px;
	width:500px;
	font-size:30px;
	font-family:"NanumGothic",sans-serif;
	background:#788b73;
	text-align: right;
	vertical-align:middle;
	border:0px;
}

.setting_4_img{
	width: 120px;
	height:169px; 
	margin-top: 0px;
	margin-right: 120px;
	margin-left: 0px;
	vertical-align:middle;
	border:0px;	
	background:#95969c;
}
.setting_4{	
	color:#fff; 
	margin-right:0%;
	margin-top: 0px;	
	line-height:160px;
	width:500px;
	font-size:30px;
	font-family:"NanumGothic",sans-serif;
	background:#5f6370;
	text-align: left;
	vertical-align:middle;
	border:0px;
}

.setting_center .setting_1:hover, .setting_2:hover, .setting_3:hover, .setting_4:hover{
	color:#fff;
	opacity: 0.7;
    filter: alpha(opacity=40); /* For IE8 and earlier */
}

</style>
</head>
<body>
<div class="setting_background">
<div class="setting_center">
	<button class="setting_1" onclick="location.href='${root }/service/list'">
		서비스설정
		<img src="${root }/resources/ksy/images/set1.png" class="setting_1_img"/>	
	</button>
	<button class="setting_2" onclick="location.href='${root }/reservationM/list'">
		<img src="${root }/resources/ksy/images/set2.png" class="setting_2_img"/>
		예약정보 보기
	</button>
</div>
<div class="setting_center2">
	<button class="setting_3" onclick="location.href='${root }/Page_Image/list'">
		홈페이지 이미지 설정
		<img src="${root }/resources/ksy/images/set3.png" class="setting_3_img"/>	
	</button>
	<button class="setting_4" onclick="location.href='#stat'">
		<img src="${root }/resources/ksy/images/set4.png" class="setting_4_img"/>
		통계 확인
	</button>
</div>
</div>
</body>
</html>
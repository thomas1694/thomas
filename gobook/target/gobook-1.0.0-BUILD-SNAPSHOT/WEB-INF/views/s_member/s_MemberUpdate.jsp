<!-- 판매자 회원가입 페이지 -->
<!-- top, bottom 필요함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--STYLESHEETS-->
<link href="${root }/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var mw = jQuery.noConflict();
mw(document).ready(function() {
	$(".joincode").css("display", "none");
});


function inCheck(f){                      //얘는submit 할때 검증되는 함수임
	if(f.s_id.value==""){
		alert("아이디를 입력해 주세요");
		f.s_id.focus();
		return false;
	}
	if(f.s_passwd.value==""){
		alert("패스워드를 입력해 주세요");
		f.s_passwd.focus();
		return false;
	}
	if(f.s_repasswd.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.s_repasswd.focus();
		return false;
	}
	if(f.s_repasswd.value!=f.s_passwd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
		f.s_repasswd.focus();
		return false;
	}
	if(f.s_name.value==""){
		alert("회사명을 입력해 주세요");
		f.s_name.focus();
		return false;
	}
	if(f.s_tel.value==""){
		alert("전화번호를 입력해 주세요");
		f.s_tel.focus();
		return false;
	}
	if(f.s_email.value==""){
		alert("이메일을 입력해 주세요");
		f.s_email.focus();
		return false;
	}
	if(f.s_zipcode.value==""){
		alert("주소 검색을 해 주세요");
		return false;
	}
	if(f.s_address1.value==""){
		alert("주소 검색을 해 주세요");
		return false;
	}
	if(f.s_address2.value==""){
		alert("상세주소를 입력해 주세요");
		f.s_address2.focus();
		return false;
	}

	

	
	
	if($(".joincode").is(':visible') == false ){

		alert("이메일 중복확인 검사를 해 주세요");
		f.s_email.focus();
		return false;
	}
	if(f.email_code.value==""){
		alert("이메일 인증코드를 입력해 주세요");
		f.email_code.focus();
		return false;
	}
	if($("#em1").text()==""){
		alert("인증코드 확인을 눌러주세요");
		return false;
	}
	if(Code==false){
		alert("인증코드가 틀렸습니다. 다시 입력 해 주세요");
		f.email_code.focus();
		return false;
	}
	if(f.s_info.value==""){
		alert("회사 설명을 입력해 주세요");
		f.s_address2.focus();
		return false;
	}
	
	if(grecaptcha.getResponse()==""){
		alert("스팸방지코드를 확인해 주세요");
		return false;
}
	
}

function idCheck(s_id){
	if(s_id==""){
		alert("아이디를 입력해 주세요");
		document.frm.s_id.focus();
	}else{
		var url = "./id_proc"
		url += "?s_id="+s_id;
		
		wr = window.open(url, "아이디 검색", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/		
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
	}
}
function emailCheck(){
	var email = document.getElementById("s_email").value;
	
	if(email==""){
		alert("이메일을 입력해 주세요");
		document.frm.s_email.focus();
		return false;
	}

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = JSON.parse(xhttp.responseText);
			if(data == "true"){
				alert("이미 가입한 메일입니다.");
				$(".joincode").css("display", "none");
			}else{
				sendMail(email);
				$(".joincode").css("display", "");
			}
		}
	};	
	xhttp.open("POST", 'emailCheck/', true);	
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhttp.send('email=' + email);
}
function sendMail(email){

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			if(xhttp.status == 200)
				alert("메일을 정상적으로 보냈습니다.");
			else{
				
				alert(xhttp.status+"올바른 메일 형식이 아닙니다.");
			}
		}
	};
	xhttp.open("POST", 'sendMail/', true);
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhttp.send('email=' + email);
}

function emailNumCheck(){
	var emailcode = document.getElementById("emailcode").value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			Code = JSON.parse(xhttp.responseText);
			if(Code==true){
				$("#em1").text("인증코드 일치");
				
			}else{
				$("#em1").text("인증코드 불일치");
				
			}
		}
	};	
	xhttp.open("POST", 'codeCheck/', true);	
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhttp.send('emailcode=' + emailcode);
}


</script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
var $j144 = jQuery.noConflict();   

$j144(document).ready(function($){  

    

    // 구현하실 어떤 내용들

    

    
	$(function() {

		$("#slider-range").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour1} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time").val("휴일");
					$("#s_hour1").val("Mon/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour1").val("Mon/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time").val( $("#slider-range").slider("values", 0) +
			" : 00 ~ " + $("#slider-range").slider("values", 1) +" : 00");
		$("#s_hour1").val("Mon/"+$("#slider-range").slider("values", 0)+","+$("#slider-range").slider("values", 1));
		$("#slider-range2").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour2} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time2").val("휴일");
					$("#s_hour2").val("Tue/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time2").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour2").val("Tue/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time2").val( $("#slider-range2").slider("values", 0) +
			" : 00 ~ " + $("#slider-range2").slider("values", 1) +" : 00");
		$("#s_hour2").val("Tue/"+$("#slider-range2").slider("values", 0)+","+$("#slider-range2").slider("values", 1));
		$("#slider-range3").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour3} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time3").val("휴일");
					$("#s_hour3").val("Wed/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time3").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour3").val("Wed/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time3").val( $("#slider-range3").slider("values", 0) +
			" : 00 ~ " + $("#slider-range3").slider("values", 1) +" : 00");
		$("#s_hour3").val("Wed/"+$("#slider-range3").slider("values", 0)+","+$("#slider-range3").slider("values", 1));
		$("#slider-range4").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour4} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time4").val("휴일");
					$("#s_hour4").val("Thu/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time4").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour4").val("Thu/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time4").val( $("#slider-range4").slider("values", 0) +
			" : 00 ~ " + $("#slider-range4").slider("values", 1) +" : 00");
		$("#s_hour4").val("Thu/"+$("#slider-range4").slider("values", 0)+","+$("#slider-range4").slider("values", 1));
		$("#slider-range5").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour5} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time5").val("휴일");
					$("#s_hour5").val("Fri/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time5").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour5").val("Fri/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time5").val( $("#slider-range5").slider("values", 0) +
			" : 00 ~ " + $("#slider-range5").slider("values", 1) +" : 00");
		$("#s_hour5").val("Fri/"+$("#slider-range5").slider("values", 0)+","+$("#slider-range5").slider("values", 1));
		$("#slider-range6").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour6} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time6").val("휴일");
					$("#s_hour6").val("Sat"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time6").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour6").val("Sat/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time6").val( $("#slider-range6").slider("values", 0) +
			" : 00 ~ " + $("#slider-range6").slider("values", 1) +" : 00");
		$("#s_hour6").val("Sat/"+$("#slider-range6").slider("values", 0)+","+$("#slider-range6").slider("values", 1));
		$("#slider-range7").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ ${dto.s_hour7} ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time7").val("휴일");
					$("#s_hour7").val("Sun/"+ui.values[0]+","+ ui.values[1]);
				}else{
					$("#s_time7").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
					$("#s_hour7").val("Sun/"+ui.values[0]+","+ ui.values[1]);
				}
				}
		});
		$("#s_time7").val( $("#slider-range7").slider("values", 0) +
			" : 00 ~ " + $("#slider-range7").slider("values", 1) +" : 00");
		$("#s_hour7").val("Sun/"+$("#slider-range7").slider("values", 0)+","+$("#slider-range7").slider("values", 1));
	});
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<!-- recaptcha -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<!-- 다음 지도 api -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cbc9a44495a229ba6b4ecd67265a238a&libraries=services"></script>
<script>
var $d = jQuery.noConflict(); 

$d(document).ready(function($){ 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${dto.s_address1}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(${dto.s_location});

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        marker.setDraggable(true); 
        daum.maps.event.addListener(marker, 'dragend', function() {
        	infowindow.close();
        	infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);
            document.getElementById("s_location").value=marker.getPosition().toString();
        });
        document.getElementById("s_location").value=marker.getPosition().toString();
    } 
});     
});


$d(document).change(function($){ 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var address1=document.getElementById('sample6_address').value;
// 주소로 좌표를 검색합니다
geocoder.addressSearch(address1, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        marker.setDraggable(true); 
        daum.maps.event.addListener(marker, 'dragend', function() {
        	infowindow.close();
        	infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);
            document.getElementById("s_location").value=marker.getPosition().toString();
        });
        document.getElementById("s_location").value=marker.getPosition().toString();
    } 
});    });
</script>
</head>

<body>

	<!-- Form -->
	<FORM name='frm' method='POST' action='./update'
		onsubmit="return inCheck(this)">
		<input type="hidden" name="s_hour1" id="s_hour1">
		<input type="hidden" name="s_hour2" id="s_hour2">
		<input type="hidden" name="s_hour3" id="s_hour3">
		<input type="hidden" name="s_hour4" id="s_hour4">
		<input type="hidden" name="s_hour5" id="s_hour5">
		<input type="hidden" name="s_hour6" id="s_hour6">
		<input type="hidden" name="s_hour7" id="s_hour7">
		<input type="hidden" name="s_id" value="${dto.s_id }">
	<div class="container">
	<h2 class='title'>판매자 회원정보 수정</h2>
		<table class="question">
			<caption class="qtit">(<img src="${root }/resources/ksy/images/star.png"/>은 필수 입력사항)</caption>
			<tr>
				<th class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>회사ID</th>
				<td>${dto.s_id }
				</td>
			</tr>
			<tr>
				<th class="th"><img src="${root }/resources/ksy/images/star.png"/>비밀번호</th>
				<td><input type="password" name="s_passwd" size="20"></td>
			</tr>
			<tr>
				<th class="th"><img src="${root }/resources/ksy/images/star.png"/>비밀번호 확인</th>
				<td><input type="password" name="s_repasswd" size="20"></td>
			</tr>
			<tr>
				<th class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>회사명</th>
				<td><input type="text" name="s_name" value="${dto.s_name }" size="25" placeholder="실명을 입력해 주세요"></td>
			</tr>
			
			
			
			<TR>
				<th class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>전화번호</TH>
				<TD><input type="text" name="s_tel" value="${dto.s_tel }" size="25" placeholder="예: 010-0000-0000"></TD>
			</TR>
			<TR>
				<TH rowspan="2" class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>이메일</TH>
				<TD>
					<input type="email" value="${dto.s_email }" id="s_email" name="s_email" size="30" maxlength="4" placeholder="예 : gobook@xxxxx.com"> <!--  타입이 email이면 submit 시에 @가 있는지 확인한다. -->
					<button type="button" class="button" onclick="emailCheck()">e-mail 인증</button>
					<!-- 이메일 인증 버튼을 누르면 우선 중복확인을 한 뒤 인증 이메일이 보내진다. -->
				</TD>
			</TR>
			<TR>
				<TD class="joincode">
					인증코드 &nbsp 
					<input type="password" name="email_code" class="wid20" style="display:inline;" id="emailcode" size="8" maxlength="5">
					<input type="button" class="button" onclick="emailNumCheck()" value="확인"/>
					<em id="em1"></em>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>우편번호</TH>
				<TD>
					<input type="text" value="${dto.s_zipcode }" name="s_zipcode" size="10" id="sample6_postcode" placeholder="우편번호">
					<button type="button" class="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">주소검색</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>회사 주소</TH>
				<TD>
					<input type="text" name="s_address1" value="${dto.s_address1 }" size="80" id="sample6_address" placeholder="주소"> 
					<input type="text" name="s_address2" value="${dto.s_address2 }" size="40" id="sample6_address2" placeholder="상세주소">
				</TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>비지니스 카테고리</TH>
				<TD>
					<select name="s_category">
						<option value="레스토랑"
				<c:if test="${dto.s_category=='레스토랑' }">selected</c:if>
						>레스토랑
						<option value="병원"
				<c:if test="${dto.s_category=='병원' }">selected</c:if>
						>병원
						<option value="스터디카페"
				<c:if test="${dto.s_category=='스터디카페' }">selected</c:if>
						>스터디카페
						<option value="어린이놀이방"
				<c:if test="${dto.s_category=='어린이놀이방' }">selected</c:if>
						>어린이놀이방
						<option value="카페"
				<c:if test="${dto.s_category=='카페' }">selected</c:if>
						>카페
						<option value="뷰티"
				<c:if test="${dto.s_category=='뷰티' }">selected</c:if>
						>뷰티
						<option value="기타"
				<c:if test="${dto.s_category=='기타' }">selected</c:if>
						>기타
					</select>
				</TD>
			</TR>
			<tr>
				<th class="th" scope="row">회사설명</th>
				<td>
					<textarea rows="20" name="s_info" cols="20">${dto.s_info }</textarea>
				</td>
			</tr>
			<tr>
				<th class="th" scope="row">영업시간</th>
				<td>
					<label for="s_time">월요일 영업시간:</label>
  			<input type="text" name="s_time" id="s_time" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time2">화요일 영업시간:</label>
  			<input type="text" name="s_time2" id="s_time2" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range2" style="width:30%;text-align: center;margin: auto;"></div>
 		
 		<label for="s_time3">수요일 영업시간:</label>
  			<input type="text" name="s_time3" id="s_time3" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range3" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time4">목요일 영업시간:</label>
  			<input type="text" name="s_time4" id="s_time4" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range4" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time5">금요일 영업시간:</label>
  			<input type="text" name="s_time5" id="s_time5" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range5" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time6">토요일 영업시간:</label>
  			<input type="text" name="s_time6" id="s_time6" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range6" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time7">일요일 영업시간:</label>
  			<input type="text" name="s_time7" id="s_time7" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range7" style="width:30%;text-align: center;margin: auto;"></div>
				</td>
			</tr>
			<tr>
				<TH class="th" scope="row"><img src="${root }/resources/ksy/images/star.png"/>회사 위치</TH>
				<td>
					<div id="map" style="width:100%;height:350px;"></div>
					<input type="hidden" id="s_location" name="s_location" value="">
				</td>
			</tr>
			
			<tr>
				<th class="th" scope="row"></th>
				<td><center>
					<div class="g-recaptcha"  data-sitekey="6Ld1rVUUAAAAAB2nvuPJCRM-aQ7Ef4pWGqsoN-wk"></div>
					</center>
				</td>
			</tr>
		</table>

		<DIV class="btn1">
			<input type='submit' class="btn_submit" value='수정하기'> 
			<input type='reset' class="btn_reset" value='초기화'>
		</DIV>
	</div>
	</FORM>
	<!-- //Form -->

</body>
</html>



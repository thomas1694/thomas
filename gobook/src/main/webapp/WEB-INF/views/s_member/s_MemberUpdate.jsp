<!-- 판매자 회원가입 페이지 -->
<!-- top, bottom 필요함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function inCheck(f){                      //얘는submit 할때 검증되는 함수임
	if(f.id.value==""){
		alert("아이디를 입력해 주세요");
		f.id.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("패스워드를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.repasswd.value!=f.passwd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
		f.repasswd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력해 주세요");
		f.mname.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해 주세요");
		f.email.focus();
		return false;
	}
}
function idCheck(id){
	if(id==""){
		alert("아이디를 입력해 주세요");
		document.frm.id.focus();
	}else{
		var url = "./id_proc"
		url += "?id="+id;
		
		wr = window.open(url, "아이디 검색", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
	}
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력해 주세요");
		document.frm.email.focus();
	}else{
		var url = "./email_proc"
		url += "?email="+email;
		
		wr = window.open(url, "이메일 검색", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
	}
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
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time").val("휴일");
				}else{
					$("#s_time").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time").val( $("#slider-range").slider("values", 0) +
			" : 00 ~ " + $("#slider-range").slider("values", 1) +" : 00");
	
		$("#slider-range2").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time2").val("휴일");
				}else{
					$("#s_time2").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time2").val( $("#slider-range2").slider("values", 0) +
			" : 00 ~ " + $("#slider-range2").slider("values", 1) +" : 00");
		
		$("#slider-range3").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time3").val("휴일");
				}else{
					$("#s_time3").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time3").val( $("#slider-range3").slider("values", 0) +
			" : 00 ~ " + $("#slider-range3").slider("values", 1) +" : 00");
		
		$("#slider-range4").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time4").val("휴일");
				}else{
					$("#s_time4").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time4").val( $("#slider-range4").slider("values", 0) +
			" : 00 ~ " + $("#slider-range4").slider("values", 1) +" : 00");
		
		$("#slider-range5").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time5").val("휴일");
				}else{
					$("#s_time5").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time5").val( $("#slider-range5").slider("values", 0) +
			" : 00 ~ " + $("#slider-range5").slider("values", 1) +" : 00");
		
		$("#slider-range6").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time6").val("휴일");
				}else{
					$("#s_time6").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time6").val( $("#slider-range6").slider("values", 0) +
			" : 00 ~ " + $("#slider-range6").slider("values", 1) +" : 00");
		
		$("#slider-range7").slider({
			range : true,
			min : 0,
			max : 24,
			values : [ 9, 17 ],
			slide : function(event, ui) {
				if(ui.values[0]==ui.values[1]){
					$("#s_time7").val("휴일");
				}else{
					$("#s_time7").val( ui.values[0]+" : 00" + " ~ " + ui.values[1]+" : 00");
				}
				}
		});
		$("#s_time7").val( $("#slider-range7").slider("values", 0) +
			" : 00 ~ " + $("#slider-range7").slider("values", 1) +" : 00");
	
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

</head>

<body>

	<!-- Form -->
	<FORM name='frm' method='POST' action='./createProc'
		onsubmit="return inCheck(this)">
	<div class="container">
	<h2 class='title'>판매자 회원정보 수정</h2>
		<table class="question">
			<caption class="qtit">(<img src="../images/star.png"/>은 필수 입력사항)</caption>
			<tr>
				<th class="th" scope="row"><img src="../images/star.png"/>회사ID</th>
				<td>
					<input type="text" name="s_Id" title="회사 ID를 입력하세요" class="wid20" placeholder="회사 ID를 입력하세요" />
					<button class="button" onclick="idCheck(document.frm.id.value)">ID 중복확인</button>
				</td>
			</tr>
			<tr>
				<th class="th"><img src="../images/star.png"/>비밀번호</th>
				<td><input type="password" name="s_passwd" size="20"></td>
			</tr>
			<tr>
				<th class="th"><img src="../images/star.png"/>비밀번호 확인</th>
				<td><input type="password" name="s_repasswd" size="20"></td>
			</tr>
			<tr>
				<th class="th" scope="row"><img src="../images/star.png"/>회사명</th>
				<td><input type="text" name="s_Name" size="25" placeholder="실명을 입력해 주세요"></td>
			</tr>
			
			
			
			<TR>
				<th class="th" scope="row"><img src="../images/star.png"/>전화번호</TH>
				<TD><input type="text" name="tel" size="25" placeholder="예: 010-0000-0000"></TD>
			</TR>
			<TR>
				<TH rowspan="2" class="th" scope="row"><img src="../images/star.png"/>이메일</TH>
				<TD>
					<input type="email" name="email" size="30" maxlength="4" placeholder="예 : gobook@xxxxx.com"> <!--  타입이 email이면 submit 시에 @가 있는지 확인한다. -->
					<button type="button" class="button" onclick="emailCheck(document.frm.email.value)">e-mail 인증</button>
					<!-- 이메일 인증 버튼을 누르면 우선 중복확인을 한 뒤 인증 이메일이 보내진다. -->
				</TD>
			</TR>
			<TR>
				<TD>
					인증코드 &nbsp <input type="password" name="email_code" size="8">
					<button type="button" class="button" onclick="emailNumCheck(document.frm.email_code.value)">확인</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="../images/star.png"/>우편번호</TH>
				<TD>
					<input type="text" name="zipcode" size="10" id="sample6_postcode" placeholder="우편번호">
					<button type="button" class="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">주소검색</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="../images/star.png"/>회사 주소</TH>
				<TD>
					<input type="text" name="address1" size="80" id="sample6_address" placeholder="주소"> 
					<input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소">
				</TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="../images/star.png"/>비지니스 카테고리</TH>
				<TD>
					<select>
						<option value="restaurant">레스토랑
						<option value="hospital">병원
						<option value="studycafe">스터디카페
						<option value="beauty">뷰티
					</select>
				</TD>
			</TR>
			<tr>
				<th class="th" scope="row">회사설명</th>
				<td>
					<textarea rows="20" cols="20"></textarea>
				</td>
			</tr>
			<tr>
				<th class="th" scope="row">영업시간</th>
				<td>
					<label for="s_time">월요일 영업시간:</label>
  			<input type="text" id="s_time" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time2">화요일 영업시간:</label>
  			<input type="text" id="s_time2" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range2" style="width:30%;text-align: center;margin: auto;"></div>
 		
 		<label for="s_time3">수요일 영업시간:</label>
  			<input type="text" id="s_time3" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range3" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time4">목요일 영업시간:</label>
  			<input type="text" id="s_time4" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range4" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time5">금요일 영업시간:</label>
  			<input type="text" id="s_time5" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range5" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time6">토요일 영업시간:</label>
  			<input type="text" id="s_time6" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range6" style="width:30%;text-align: center;margin: auto;"></div>
		
		<label for="s_time7">일요일 영업시간:</label>
  			<input type="text" id="s_time7" readonly style="border:0; color:#f6931f; font-weight:bold;">
		
		<div id="slider-range7" style="width:30%;text-align: center;margin: auto;"></div>
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



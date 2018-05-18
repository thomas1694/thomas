<!-- 소비자 회원가입 페이지 -->
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
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />

<script>
$(document).ready(function() {
	$(".joincode").css("display", "none");
});

function inCheck(f){                     //얘는submit 할때 검증되는 함수임
	
	if(f.c_id.value==""){
		alert("아이디를 입력해 주세요");
		f.c_id.focus();
		return false;
	}
	if(f.c_passwd.value==""){
		alert("패스워드를 입력해 주세요");
		f.c_passwd.focus();
		return false;
	}
	if(f.c_repasswd.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.c_repasswd.focus();
		return false;
	}
	if(f.c_repasswd.value!=f.c_passwd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
		f.c_repasswd.focus();
		return false;
	}
	if(f.c_name.value==""){
		alert("이름을 입력해 주세요");
		f.c_name.focus();
		return false;
	}
	if(f.c_birth.value==""){
		alert("생일을 입력해 주세요");
		f.c_birth.focus();
		return false;
	}
	if(f.c_gender.value==""){
		alert("성별을 입력해 주세요");
		f.c_gender[0].focus();
		return false;
	}
	if(f.c_tel.value==""){
		alert("전화번호를 입력해 주세요");
		f.c_tel.focus();
		return false;
	}
	if(f.c_zipcode.value==""){
		alert("우편번호를 검색해 주세요");
		f.c_zipcode.focus();
		return false;
	}
	if(f.c_address2.value==""){
		alert("상세주소를 입력해 주세요");
		f.c_address2.focus();
		return false;
	}	
	if(f.c_email.value==""){
		alert("이메일을 입력해 주세요");
		f.c_email.focus();
		return false;
	}
	if(f.c_email.value==""){
		alert("이메일 중복확인 검사를 해 주세요");
		f.c_email.focus();
		return false;
	}
	if(f.c_email_code.value==""){
		alert("이메일 인증코드를 입력해 주세요");
		f.c_email_code.focus();
		return false;
	}
}
function idCheck(c_id){
	if(c_id==""){
		alert("아이디를 입력해 주세요");
		document.frm.c_id.focus();
	}else{
		var url = "./id_proc"
		url += "?c_id="+c_id;
		
		wr = window.open(url, "아이디 검색", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/		
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
	}
}
function emailCheck(){
	var email = document.getElementById("c_email").value;
	
	if(email==""){
		alert("이메일을 입력해 주세요");
		document.frm.c_email.focus();
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
			var Code = JSON.parse(xhttp.responseText);
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
</head>

<body>

	<!-- Form -->
	<FORM name='frm' method='POST' action='./createProc'
		onsubmit="return inCheck(this)">
	<div class="container">
	<h2 class='title'>GoBook 회원가입</h2>
		<table class="question">
			<caption class="qtit">(<img src="${root}/resources/ksy/images/star.png"/>은 필수 입력사항)</caption>
			<tr>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>ID</th>
				<td>
					<input type="text" name="c_id" title="ID를 입력하세요" class="wid20" placeholder="이름을 입력하세요" />
					<input type="button" class="button" onclick="idCheck(document.frm.c_id.value)" value="ID 중복확인">
				</td>
			</tr>
			<tr>
				<th class="th"><img src="${root}/resources/ksy/images/star.png"/>비밀번호</th>
				<td><input type="password" name="c_passwd" size="20"></td>
			</tr>
			<tr>
				<th class="th"><img src="${root}/resources/ksy/images/star.png"/>비밀번호 확인</th>
				<td><input type="password" name="c_repasswd" size="20"></td>
			</tr>
			<tr>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>성명</th>
				<td><input type="text" name="c_name" size="25" placeholder="실명을 입력해 주세요"></td>
			</tr>
			<tr>
				<th class="th" scope="row">별명</th>
				<td><input type="text" name="c_nickname" size="25" placeholder="게시판용?"></td>
			</tr>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>생일</TH>
				<TD><input type="date" name="c_birth" size="15" value=""></TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>성별</TH>
				<TD>
					남자 &nbsp<input type="radio" name="c_gender" value="m"> 
					여자 &nbsp<input type="radio" name="c_gender" value="w">
				</TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>전화번호</TH>
				<TD><input type="text" name="c_tel" size="25" placeholder="예: 010-0000-0000"></TD>
			</TR>
			<TR>
				<TH rowspan="2" class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>이메일</TH>
				<TD>
					<input type="email" name="c_email" id="c_email" size="30" placeholder="예 : gobook@xxxxx.com" value=""> <!--  타입이 email이면 submit 시에 @가 있는지 확인한다. -->
					<button type="button" class="button" onclick="emailCheck()">중복확인</button>
					<!-- 이메일 인증 버튼을 누르면 우선 중복확인을 한 뒤 인증 이메일이 보내진다. -->
				</TD>
			</TR>
			<TR class="joincode">
				<TD class="joincode">
					인증코드 &nbsp <em id="em1"></em>
					<input type="password" name="c_email_code" id="emailcode" size="8" maxlength="5">
					<input type="button" class="button" onclick="emailNumCheck()" value="확인"/>
				</TD>
			</TR>
			
			<TR>
				<TH class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>우편번호</TH>
				<TD>
					<input type="text" name="c_zipcode" size="10" id="sample6_postcode" placeholder="주소검색을 해주세요" readonly>
					<button type="button" class="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">주소검색</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>주소</TH>
				<TD>
					<input type="text" name="c_address1" size="80" id="sample6_address" placeholder="주소" readonly> 
					<input type="text" name="c_address2" size="40" id="sample6_address2" placeholder="상세주소">
				</TD>
			</TR>
			<tr>
				<th class="th" scope="row">관심사</th>
				<td>
					<p>
						<label> <input type="checkbox" name="c_interest" id="interest_0" value="I00">육아</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_1" value="I01">핸드메이드</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_2" value="I02">뷰티</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_3" value="I03">키덜트</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_4" value="I04">헤어</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_5" value="I05">숙박</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_6" value="I06">건강</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_7" value="I07">운동</label>
					</p>
			</tr>
		</table>

		<DIV class="btn1">
			<button class="btn_submit" >회원가입</button>
			<input type='reset' class="btn_reset" value='초기화'>
		</DIV>
	</div>
	</FORM>
	<!-- //Form -->

</body>
</html>

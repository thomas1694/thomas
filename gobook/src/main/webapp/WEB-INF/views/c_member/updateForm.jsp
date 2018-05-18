<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function inCheck(f){                      //얘는submit 할때 검증되는 함수임
	if(f.c_name.value==""){
		alert("이름을 입력해 주세요");
		f.c_name.focus();
		return false;
	}
	if(f.c_email.value==""){
		alert("이메일을 입력해 주세요");
		f.c_email.focus();
		return false;
	}
}
function emailCheck(c_email){
	if(c_email==""){
		alert("이메일을 입력해 주세요");
		document.frm.c_email.focus();
	}else{
		var url = "./email_proc"
		url += "?c_email="+c_email;
		
		wr = window.open(url, "이메일 검색", "width=500,height=500"); /*  window.open : 새창  wr는 새창을 말한다.*/
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);              /* x좌표와 y좌표를 나타낸다 */
	}
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
	<FORM name='frm2' method='POST' action='./update'
		onsubmit="return inCheck(this)">
	<div class="container">
	<h2 class='title'>회원정보 수정</h2>
		<table class="question">
			<caption class="qtit">(<img src="${root}/resources/ksy/images/star.png"/>은 필수 입력사항)</caption>
			<tr>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>ID</th>
				<td>
					<input type="text" name="c_id" title="ID는 수정할 수 없습니다" class="wid20" value="${dto.c_id}" readonly />
				</td>
			</tr>
			<tr>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>성명</th>
				<td><input type="text" name="c_name" size="25" value="${dto.c_name}" title="실명을 입력해 주세요" readonly></td>
			</tr>
			<tr>
				<th class="th" scope="row">별명</th>
				<td><input type="text" name="c_nickname" size="25" value="${dto.c_nickname}"></td>
			</tr>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>생일</TH>
				<TD><input type="date" name="c_birth" size="15" value="${dto.c_birth}" readonly></TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>성별</TH>
				<TD>
					남자 &nbsp<input type="radio" name="c_gender" value="m"
					<c:if test="${dto.c_gender == 'm'}">
						checked
					</c:if> disabled
					> 
					여자 &nbsp<input type="radio" name="c_gender" value="w"
					<c:if test="${dto.c_gender== 'w'}">
						checked
					</c:if> disabled
					>
				</TD>
			</TR>
			<TR>
				<th class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>전화번호</TH>
				<TD><input type="text" name="c_tel" size="25" value="${dto.c_tel}"></TD>
			</TR>
			<TR>
				<TH rowspan="2" class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>이메일</TH>
				<TD>
					<input type="email" name="c_email" size="30" value="${dto.c_email}"> <!--  타입이 email이면 submit 시에 @가 있는지 확인한다. -->
					<button type="button" class="button" maxlength="4" onclick="emailCheck(document.frm.c_email.value)">e-mail 인증</button>
					<!-- 이메일 인증 버튼을 누르면 우선 중복확인을 한 뒤 인증 이메일이 보내진다. -->
				</TD>
			</TR>
			<TR>
				<TD>
					인증코드 &nbsp <input type="password" name="c_email_code" size="8">
					<button type="button" class="button" onclick="emailNumCheck(document.frm.c_email_code.value)">확인</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>우편번호</TH>
				<TD>
					<input type="text" name="c_zipcode" size="10" id="sample6_postcode" value="${dto.c_zipcode}" readonly>
					<button type="button" class="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">주소검색</button>
				</TD>
			</TR>
			<TR>
				<TH class="th" scope="row"><img src="${root}/resources/ksy/images/star.png"/>주소</TH>
				<TD>
					<input type="text" name="c_address1" size="80" id="sample6_address" value="${dto.c_address1}" readonly> 
					<input type="text" name="c_address2" size="40" id="sample6_address2" value="${dto.c_address2}">
				</TD>
			</TR>
			<tr>
				<th class="th" scope="row">관심사</th>
				<td>
					<p>
						<label> <input type="checkbox" name="c_interest" id="interest_0" value="I00"
						<c:if test="${dto.c_interest == 'I00'}">
							checked="checked"
						</c:if>
						>육아</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_1" value="I01"
						<c:if test="${dto.c_interest == 'I01'}">
							checked="checked"
						</c:if>
						>핸드메이드</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_2" value="I02"
						<c:if test="${dto.c_interest == 'I02'}">
							checked="checked"
						</c:if>
						>뷰티</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_3" value="I03"
						<c:if test="${dto.c_interest == 'I03'}">
							checked="checked"
						</c:if>
						>키덜트</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_4" value="I04"
						<c:if test="${dto.c_interest == 'I04'}">
							checked="checked"
						</c:if>
						>헤어</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_5" value="I05"
						<c:if test="${dto.c_interest == 'I05'}">
							checked="checked"
						</c:if>
						>숙박</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_6" value="I06"
						<c:if test="${dto.c_interest == 'I06'}">
							checked="checked"
						</c:if>
						>건강</label> 
						<label> <input type="checkbox" name="c_interest" id="interest_7" value="I07"
						<c:if test="${dto.c_interest == 'I07'}">
							checked="checked"
						</c:if>
						>운동</label> 
					</p>
			</tr>
		</table>

		<DIV class="btn1">
			<input type='submit' class="btn_submit" value='수정완료'> 
			<input type='reset' class="btn_reset" value='취소' onclick="history.back();">
		</DIV>
	</div>
	</FORM>
	<!-- //Form -->

</body>
</html>

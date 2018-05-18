<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#update {
	font-size: 12px;
	text-align: center;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	color: #000000; /* 글자 색깔 */
	width: 1400px; /* 화면의 30% */
	top: 100px;
	left: 50px;
	position: absolute;

	/* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
	/* padding-top: 30px;  상단만 간격을 30px 지정   */
}

table#update {
	left: 350px;
	position: absolute;
}

/* 내용 */
td#id {
	font-size: 12px;
	text-align: center;
	width: 100%;
	padding: 10px; /* 위 오른쪽 아래 왼쪽 */
	margin: 0 auto; /* 가운데 정렬 */
}

TH {
	border-color: black; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	width: 200px;
	color: black; /* 글자 색 */
	background-color: #ebebeb; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}

td {
	border-color: black; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: #000000; /* 글자 색 */
	background-color: #ebebeb; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}

.input {
	padding: 0px;
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	border-top-style: none;
	border-right-style: none;
	border-left-style: none;
}

.textarea {
	padding: 0px;
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	border-top-style: none;
	border-right-style: none;
	border-left-style: none;
}

A:link { /* A 태그의 링크 속성 */
	text-decoration: none; /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	color: black; /* 글자색깔 검정 */
}

A:hover { /* A 태그에 마우스가 올라 갔을 경우 */
	text-decoration: none; /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	background-color: #E6F7FF; /* 배경 색 변경*/
	color: black; /* 문자열 색깔 */
}

A:visited { /* A 태그의 링크를 방문한 경우 */
	text-decoration: none; /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
	color: black; /* 글자색깔 검정 */
}

* {
	font-family: gulim;
	font-size: 20px;
}

hr {
	text-align: center;
	border: 1px solid #AAAAAA;
	width: 45%;
}

.bottom {
	margin: 20px auto;
	text-align: center;
	width: 100%;
	top: 550px;
	padding: 10px; /* 위 오른쪽 아래 왼쪽 */
	position: absolute;
}
</style>
</head>
<body>

	<div class="container" id="update">
		<h2>
			<span class="glyphicon glyphicon-pencil"></span>예약정보 수정
		</h2>
		<br>
		<FORM name='frm' method='POST' action='./update'
			onsubmit='return incheck(this)' enctype="multipart/form-data">
			<input type="hidden" name="res_code" value="${dto.resdto.res_code}">
			<input type="hidden" name="nowPage" value="${param.nowPage}"> 
			<input type="hidden" name="col" value="${param.col}"> 
			<input type="hidden" name="word" value="${param.word}">
			<TABLE class="table table-bordered" id="update">
				<TR>
					<TH>예약코드</TH>
					<TD>${dto.resdto.res_code}</TD>
				</TR>
				<TR>
					<TH>서비스번호</TH>
					<TD>${dto.sv_num}</TD>
				</TR>
				<TR>
					<TH>소비자회원iD</TH>
					<TD>${dto.resdto.c_id}</TD>
				</TR>
				<TR>
					<TH>서비스제목</TH>
					<TD>${dto.sv_title}</TD>
				</TR>
				<TR>
					<TH>서비스설명</TH>
					<TD>${dto.sv_content}</TD>
				</TR>
				<TR>
					<TH>서비스가격</TH>
					<TD>${dto.sv_price}</TD>
				</TR>
				<TR>
					<TH>예약시간</TH>
					<TD><input type="text" name="res_time"
						value="${dto.resdto.res_time}"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='수정'> <input type='button'
					value='취소' onclick="history.back()">
			</DIV>
		</FORM>
	</div>

</body>
</html>
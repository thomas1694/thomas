<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#read{
  font-size: 12px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 1400px;            /* 화면의 30% */ 
  top:100px;
  left:50px;
  position:absolute;

  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
}
 
/* 내용 */
td#id{
  font-size: 12px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
 
/* 테이블에 CSS 적용 */
TABLE#infomation{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: black;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  width:1000px;
  top:100px;
  left:150px;
  position:absolute;
}
 
TH{
  border-color: black;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  width: 200px;
  color: black;          /* 글자 색 */ 
  background-color: #ebebeb; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
}

  
td{
  border-color: black;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  color: #000000;            /* 글자 색 */ 
  background-color: #ebebeb; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */  
}
 
.input{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
 
.textarea{
  padding: 0px;
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  border-top-style: none;
  border-right-style: none;
  border-left-style: none; 
}
 
A:link {     /* A 태그의 링크 속성 */
  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
  color: black;              /* 글자색깔 검정 */
}
 
A:hover{     /* A 태그에 마우스가 올라 갔을 경우 */
  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
  background-color: #E6F7FF; /* 배경 색 변경*/
  color: black;              /* 문자열 색깔 */ 
}
 
A:visited{     /* A 태그의 링크를 방문한 경우 */
  text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */
  color: black;              /* 글자색깔 검정 */
}
*{
   font-family:gulim;
   font-size:20px;
}
hr{
  text-align:center;
  border: 1px solid #AAAAAA;
  width: 45%;
}
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  top:500px;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  position:absolute;
}
</style>
</head>
<script type="text/javascript">
function rupdate(res_code){
	var url="./update"
	url+="?res_code=${res_code}"; 
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
function rdelete(){
	var url="./delete"
    url+="?res_code=${res_code}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>
<body>
<form name="frm">
<div class="container" id="read">
<h2>소비자 회원 예약 정보</h2>
 <TABLE id="infomation">
    <TR>
      <TH>예약코드</TH>
      <TD>${dto.resdto.res_code}</TD>
    </TR>
    <TR>
      <TH>소비자회원ID</TH>
      <TD>${dto.resdto.c_id}</TD>
    </TR>
    
    <TR>
      <TH>서비스 번호</TH>
      <TD>${dto.sv_num}</TD>
    </TR>
    
    <TR>
      <TH>서비스 제목</TH>
      <TD>${dto.sv_title}</TD>
    </TR>
    <TR>
      <TH>서비스설명</TH>
         <TD id='content'>${dto.sv_content}</TD>
    </TR>
    <TR>	
      <TH>서비스가격</TH>
      <TD>${dto.sv_price}</TD>
    </TR>
    <TR>
      <TH>예약시간</TH>
      <TD>${dto.resdto.res_time}</TD>
    </TR>
    
  </TABLE>
  </div>
  
    <div class="bottom">
     <button type="button" onclick="rlist()">목록</button>
     <input type="button" onclick="rupdate('${res_code}')" value="수정">
     <button type="button" onclick="rdelete()">삭제</button>
    </div>
  </form>

</body>
</html>
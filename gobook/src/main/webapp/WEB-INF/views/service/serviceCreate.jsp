<%@ page contentType="text/html; charset=UTF-8" %>  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 등록</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="resources/js/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
<style type="text/css">
<style type="text/css">
.title{
  font-size: 12px;
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 50%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
 
/* 내용 */
.content{
  font-size: 12px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
/* 하단 메뉴 */
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
 
 
/* 테이블에 CSS 적용 */
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: black;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
 
}
 
TH{
  border-color: black;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
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
</style>

</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">서비스 대분류</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./create'
	  enctype="multipart/form-data">
  <input type="hidden" name="sv_num_upper" value="1	">
<!--   <input type="hidden" name="sv_content" value="0"> -->
<!--   <input type="hidden" name="sv_template" value="0"> -->
<!--   <input type="hidden" name="sv_price" value="0"> -->
<!--    <input type="hidden" name="sv_timeperson" value="0"> -->
  <TABLE>
   
    <TR>
      <TH>사진등록</TH>
      <TD>
      <input type="file" name="filenameMF">
      </TD>
    </TR>
    <TR>
      <TH>대분류 서비스 제목</TH>
      <TD>
      <input type="text" name="sv_title">
      </TD>
    </TR>
    
    <TR>
      <TH>회원명</TH>
      <TD>
      <input type="text" name="s_id">	
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
</body>
<!-- *********************************************** -->
</html>  
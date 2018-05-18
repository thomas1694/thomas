<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "ssi.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

 div#info{
  top:70px;
  left:100px;
  position:absolute;
}
 
/* 테이블에 CSS 적용 */
TABLE{
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

.search{
  top:400px;
  left:500px;
  width:500px;
  position:absolute;
}
div#paging{
   top:500px;
  left:700px;
  position:absolute;
}
</style>
<script type="text/javascript">
function read(res_code){
	var url="./read"
		url+="?res_code="+res_code; 
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		location.href=url;
}
</script>
</head>
<body>
<form name = "frm" action="./list" method="post">
<select name="col"><!-- 검색할 컬럼 -->
    <option value="c_id" >소비자회원</option>
    <option value="sv_title">제목</option>
    <option value="sv_content">내용</option>
     <option value="total">전체</option>
</select>
<input type="search" name="word" value="성명" required><button>검색</button>
<div class="container" id="info">
<div class="search">
</div>
<h2><span class="glyphicon glyphicon-list"></span>예약자 리스트</h2>
 <TABLE class="table table-hover">
  <thead>
    <TR>
      <TH>예약코드</TH>
      <th>서비스번호</th>
      <Th>소비자회원ID</Th>
      <Th>서비스 제목</Th>
      <Th>예약시간</Th>
      <Th>서비스 가격</Th>
      <th>수정/삭제</th>
    </TR>
   </thead> 
    
     <c:forEach var="dto" items="${list}">
    <tbody>
    <tr>
      <th><a href="javascript:read('${dto.resdto.res_code}')">${dto.resdto.res_code}</a></th>
      <th>${dto.sv_num}</th>
      <th>${dto.resdto.c_id}</th>	
      <th>${dto.sv_title}</th>
      <th>${dto.resdto.res_time}</th>
      <th>${dto.sv_price}</th>
      <th><input type="button" onclick="rdelete('${dto.resdto.res_code}')" value="삭제">
      </th>
    </tr>
    </tbody>
    
     </c:forEach>
    </TABLE>
    
     <div id="paging">${paging}</div>
 
</div>
</form>

</body>
</html>
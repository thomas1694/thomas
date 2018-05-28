<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "ssi.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function rdelete(res_code){
	var url="./delete"
    url+="?res_code="+res_code;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	location.href=url;
}
</script>
</head>
<body>
<div class="container" id="info">
<h2><span class="glyphicon glyphicon-list"></span>예약자 리스트</h2>
<form name = "frm" action="./list" method="get" style="margin: auto; text-align: center;">
<select name="col" style="width: 10%;display: inline;"><!-- 검색할 컬럼 -->
	<c:if test="${sessionScope.grade=='S' }">
    <option value="c_id" >소비자회원</option>
	</c:if>
    <option value="sv_title">제목</option>
    <option value="sv_content">내용</option>
     <option value="total">전체</option>
</select>
<input type="text" name="word"  style="width: 20%;display:inline;" required><button class="btn btn-Default" style="width: 70px; height: 40px;">검색</button>
</form>
 <TABLE class="table table-hover" style="margin-top: 50px;">
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
    
     <c:choose>
     <c:when test="${empty list }">
     <tbody>
     <TR>
     	<th colspan="7">등록된 예약이 없습니다.</th>
     </TR>
     </tbody>
     </c:when>
     <c:otherwise>
     <c:forEach var="dto" items="${list}">
    <tbody>
    <tr>
      <th>${dto.resdto.res_code}</th>
      <th>${dto.sv_num}</th>
      <th>${dto.resdto.c_id}</th>	
      <th>${dto.sv_title}</th>
      <th>${dto.resdto.res_time}</th>
      <th>${dto.sv_price}</th>
      <th><input type="button" class="btn btn-Default btn-md" style="width: 70px;height: 40px;" onclick="rdelete('${dto.resdto.res_code}')" value="삭제">
      </th>
    </tr>
    </tbody>
     </c:forEach>
     </c:otherwise>
     </c:choose>
    
    </TABLE>
    
     <div id="paging" style="margin-top:50px; margin-bottom: 100px;">${paging}</div>
 
</div >


</body>
</html>
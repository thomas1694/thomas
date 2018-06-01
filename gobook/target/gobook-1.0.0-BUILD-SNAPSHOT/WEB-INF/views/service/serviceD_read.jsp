<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상세 서비스내용</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="resources/js/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">
function supdate(sv_num){
	var url="./update";
	url+="?sv_num=${dto.sv_num}"; 
	location.href=url;
}
function slist(){
	var url="./list";
	location.href=url;
}
function sdelete(){
	var url = "./delete";
	url += "?sv_num=${dto.sv_num}";
	location.href=url;
}
function updateFile(sv_num){
	var url = "./updatefile";
	url += "?sv_num=${dto.sv_num}";
	url += "&oldfile=${dto.serdto.simg_filename}";
	 
	location.href=url;
}
function dcreate(sv_num){
	var url="./Dcreate"
	url+="?sv_num="+${sv_num}; 
	location.href=url;
}	
</script>
<body>

<div class="container" id="read">
<h2>소비자 회원 예약 정보</h2>
 <TABLE id="infomation">
 
<%--   <c:forEach var="dto" items="${list}"> --%>
  
 <TR>
      <TR>
      <TH>서비스 사진</TH>
      <TD><img src="${root}/storage/service_image/img/${sdto.simg_filename}" width='300px'></TD>
    </TR>
    <TR>
      <TH>서비스번호</TH>
      <TD>${dto.sv_num}</TD>
    </TR>
    
    <TR>
      <TH>상위카테고리 코드</TH>
      <TD>${dto.sv_num_upper}</TD>
    </TR>
    
     <TR>
      <TH>회원명</TH>
      <TD>${dto.s_id}</TD>
    </TR>
    
    
    <TR>
      <TH>상세서비스명</TH>
      <TD>${dto.sv_title}</TD>
    </TR>
    <TR>
      <TH>서비스 내용</TH>
         <TD id='content'>${dto.sv_content}</TD>
    </TR>
    <TR>	
      <TH>서비스가격</TH>
      <TD>${dto.sv_price}</TD>
    </TR>
    <TR>
      <TH>타임당 예약안원수</TH>
      <TD>${dto.sv_timeperson}</TD>
    </TR>
   
    
<%--   </c:forEach> --%>
    
  </TABLE>
  
  </div>
    <div class="bottom" style="text-align: center;margin-bottom: 50px;">
     <input type="button" class="btn btn-Default btn-md" style="width: 80px;height: 50px;" onclick="slist()" value="목록">
     <input type="button" class="btn btn-Default btn-md" style="width: 80px;height: 50px;" onclick="supdate('${dto.sv_num}')" value="수정">
     <input type='button' class="btn btn-Default btn-md" style="width: 100px;height: 50px;" value='사진수정' onclick="updateFile('${dto.sv_num}')">
     <input type="button" class="btn btn-Default btn-md" style="width: 80px;height: 50px;" onclick="sdelete()" value="삭제">
    </div>
  

</body>
</html>
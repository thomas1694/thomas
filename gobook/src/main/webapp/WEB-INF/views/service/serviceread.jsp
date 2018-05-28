<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "ssi.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대분류 서비스</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function supdate(sv_num){
	var url="./update"
	url+="?sv_num=${dto.sv_num}"; 
	location.href=url;
}
function slist(){
	var url="./list"
	location.href=url;
}
function dcreate(sv_num){
	var url="./Dcreate"
	url+="?sv_num=${dto.sv_num}"; 
	location.href=url;
}
function sdel(sv_num){
	var url="./delete"
		url+="?sv_num=${dto.sv_num}" ;
		location.href=url;
}
function updateFile(sv_num){
	var url = "./updatefile";
	url += "?sv_num=${dto.sv_num}";
	url += "&oldfile=${dto.serdto.simg_filename}";
	 
	location.href=url;
}
</script>
</head>
<body>


<div class="container" id="read">
<h2>서비스 대분류</h2>
 <TABLE id="infomation">
   <TR>
      <TH>사진등록</TH>
      <TD><img src="${root}/storage/service_image/img/${sdto.simg_filename}" width='300px;' ></TD>
    </TR>
    <TR>
      <TH>서비스번호</TH>
      <TD>${dto.sv_num}</TD>
    </TR>
    <TR>
      <TH>서비스명</TH>
      <TD>${dto.sv_title}</TD>
    </TR>
  

  </TABLE>
  </div>
  
    <div class="bottom" style="text-align: center;margin-bottom: 50px;">
     <button type="button"  class="btn btn-Default btn-md" style="width: 80px;height: 50px;" onclick="slist()">목록</button>
       <input type='button' class="btn btn-Default btn-md" style="width: 100px;height: 50px;" value='사진수정' onclick="updateFile('${dto.sv_num}')">
     <button type="button" class="btn btn-Default btn-md" style="width: 160px;height: 50px;" onclick="dcreate('${dto.sv_num}')">상세서비스 추가</button>
     <button type="button" class="btn btn-Default btn-md" style="width: 140px;height: 50px;" onclick="supdate('${dto.sv_num}')">서비스 수정</button>
     <button type="button" class="btn btn-Default btn-md" style="width: 80px;height: 50px;" onclick="sdel('${dto.sv_num}')">삭제</button>
    </div>
  

</body>
</html>
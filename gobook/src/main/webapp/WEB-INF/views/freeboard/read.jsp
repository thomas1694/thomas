<%@ page contentType="text/html; charset=UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function reply(f_num){
	var url = "./reply";
	url += "?f_num="+f_num;
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}

function bdel(){
	var url = "./delete";
	url += "?f_num=${dto.f_num}";
	url += "&oldfile=${dto.f_filename}";
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
function bupdate(f_num){
	var url ="./update";
	url += "?f_num="+f_num;
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
function blist(){
	var url = "./list";
	url += "?col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href = url;
}
function input(f){
	
	if(f.content.value==""){
		alert("댓글내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}
function rupdate(fr_num,fr_content){
	var f = document.rform;
	f.fr_content.value = fr_content;
	f.fr_num.value = fr_num;
	f.rsubmit.value="수정";
	f.action = "./rupdate";
}
function rdelete(fr_num){
	if(confirm("진짜 지워도 되겠습니까?")){
		var url = "./rdelete";
		url = url + "?fr_num="+fr_num;
		url = url + "&f_num=${dto.f_num}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&nPage=${nPage}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		
		location.href = url; 
	}
}

</script>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
hr{
text-align: center;
border: 1px solid #AAAAAA;
width: 45%;
}
.rlist{
line-height: 1.2em;
font-size:15px;
font-weight:bold;
text-align: left;
border-style: solid;
border-width: 1px;
border-color: #AAAAAA;
color: #000000;
width: 35%;
padding:10px;
margin:20px auto;
}
.rcreate{
font-size: 20px;
font-weight: bold;
text-align: left;
border-style: solid;
border-width: 1px;
border-color: #AAAAAA;
color: #000000;
width: 35%;
padding:10px;
margin: 20px auto;
}
</style> 
<%-- <link href="${root}/css/style.css" rel="Stylesheet" type="text/css"> --%>
<link rel="Stylesheet" href="${root}/top/assets/css/main.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head> 
<!-- *********************************************** -->
<body style="margin-top: -50px;">

<!-- *********************************************** -->
 
<h2><i class="glyphicon glyphicon-th-list"></i>조회</h2>
 

  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD>${dto.id}</TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD>${dto.f_title}</TD>
    </TR>
    
    <TR>
    	<TH>내용</TH>
      <TD colspan="2">${content}</TD>
    </TR>
    
    <TR>
      <TH>조회수</TH>
      <TD>${dto.f_count}</TD>
    </TR>
    
    <TR>
      <TH>등록날짜</TH>
      <TD>${dto.f_wdate}</TD>
    </TR>
    
    <TR>
      <TH>파일명</TH>
      <td>
      <c:choose>
      <c:when test="${empty dto.f_filename}">파일없음
      </c:when>
      <c:otherwise>
      <a href="javascript:fileDown('${dto.f_filename}')">
      ${dto.f_filename}(${dto.f_filesize})</a>
      </c:otherwise>
      </c:choose>
      </td>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
  	<c:if test="${sessionScope.id!=null }">
  	<button type="button" class="btn btn-Default btn-md"  onclick="reply('${dto.f_num}')">답변</button>
  	</c:if>
  	<c:if test="${sessionScope.id==dto.id ||sessionScope.grade=='A' }">
  	<button type="button" class="btn btn-Default btn-md"  onclick="bdel()">삭제</button>
  	<button type='button' class="btn btn-Default btn-md"   onclick="bupdate('${dto.f_num}')">수정</button>
  	</c:if>
    
    <button type='button' class="btn btn-Default btn-md"   onclick="blist()">목록</button>
   
  </DIV>
  
 <hr>
  <c:forEach var="rdto" items="${rlist}">
  <div class="rlist">
   ${rdto.id}<br/>
   <p>${rdto.fr_content}</p>
   ${rdto.fr_wdate}
   <c:if test="${sessionScope.id==rdto.id ||sessionScope.grade=='A' }">
   <span style="float: right;">
   	<a href="javascript:rupdate('${rdto.fr_num }','${rdto.fr_content }')">수정</a>|
   	<a href="javascript:rdelete('${rdto.fr_num }')">삭제</a>
   </span>
   </c:if>
  </div>
  </c:forEach>
  
  <div class="bottom" style="margin-bottom: 50px;">
  ${paging }
  </div>
  <c:choose>
  <c:when test="${sessionScope.id!=null }">
  <div class="rcreate">
  <form name="rform"
  action ="./rcreate"
  method ="post"
  onsubmit = "return input(this)" style="margin-bottom: 0px;">
  <textarea rows="3" cols="28" name="fr_content"></textarea>
  <input type="submit" class="btn btn-Default btn-md" style="width: 100%;height:40px; padding-top:0px;padding-bottom:0px; height:100%; margin-top: 20px;"  name="rsubmit" value="등록">
  <input type="hidden" name="id" value="${sessionScope.id }">
  <input type="hidden" name="f_num" value="${dto.f_num}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="fr_num" value="0">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="nPage" value="${nPage}">
  </form>
  </div>
  </c:when>
  <c:otherwise>
  	<div>회원만 댓글 등록이 가능합니다.<br>
  		<input type="button" class="btn btn-Default btn-md" style="width: 70px;height: 40px;" onclick="location.href='${root}/member/login'" value="로그인">
  	</div>
  </c:otherwise>
  </c:choose>
</body>
</html> 

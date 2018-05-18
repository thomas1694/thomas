<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="util"  uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<title></title> 
<script type="text/javascript">
function fileDown(filename){
	var url = "${root}/download";
	url += "?filename="+filename;
	url += "&dir=/freeboard/storage";
	
	location.href=url;
}

function bcreate(){
	var url = "./createForm";
	location.href=url;
}
function read(f_num){
	var url = "./read";
	url += "?f_num="+f_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&id=ctest";
	
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style>
<link rel="Stylesheet" href="${root}/resources/pmw/top/assets/css/main.css">
<%-- <link href="${root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head>
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<div class="search">
<form action="./list" method="post">
<select name= "col" style="width:10%; display:inline;"><!-- 검색할 컬럼 -->
	<option value="id"
	<c:if test="${col=='id'}">
	selected</c:if>
	>성명</option>
	<option value="f_title" 
	<c:if test="${col=='f_title'}">
	selected</c:if>
	>제목</option>
	<option value="f_content"
	<c:if test="${col=='f_content'}">
	selected</c:if>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<!-- 검색어 -->
<input type="search" name="word" value="${word}">
<button style ="height:30px;">검색</button>
<button type="button" onclick="location.href='./create'" style ="height:30px;">등록</button>
</form>
</div> 

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>게시판 목록</h2>

  <TABLE class="table table-condensed">
  <thead>
    <tr>
      <TH>번호</TH>
      <TH>성명</TH>
      <TH>제목</TH>
      <th>등록날짜</th>
      <th>조회수</th>
      <th>파일명</th>

	</tr>
	</tbody>
	<c:forEach var="dto" items="${list}">
	<tbody>
    <tr>
    	<td>${dto.f_num}</td>
    	<td>${dto.id }</td>
    	<td>
    	<c:forEach begin="1" end="${dto.f_indent }">
    	&nbsp;&nbsp;
		</c:forEach>
		<c:if test="${dto.f_indent>0}">
		 <img src='${root}/images/re.jpg' width=20 height=15>
    	</c:if>
    	<a href ="javascript:read('${dto.f_num}')">${dto.f_title}</a>
    	
 		<c:if test="${util:newimg(dto.f_wdate)}" >
 		<img src="../images/new.gif">
 		</c:if>  
 		<c:set var="frcount" value="${util:frcount(dto.f_num,rdao)}"/>
 		<c:if test="${frcount>0 }">
 		<span style="color:green;">(${frcount})</span>
 		</c:if>	
    	
  
    </td>
    	<td>${dto.f_wdate}</td>
    	<td>${dto.f_count }</td>
    	<td>
    	<c:choose>
    	<c:when test="${empty dto.f_filename }">${dto.f_filename}
    	</c:when>
    	
    	<c:otherwise>
    	<a href="${root }/storage/freeboard/file/${dto.f_filename }" download>${dto.f_filename }</a>
<%--     	<a href="javascript:fileDown('${dto.f_filename}')">${dto.f_filename}</a> --%>
    	</c:otherwise>
    	</c:choose>
 
    	</td>
   		</tr>
   		</c:forEach>
    </tbody>
  </TABLE>
  
  <DIV class='bottom'>
   ${paging }
  </DIV>
</div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 

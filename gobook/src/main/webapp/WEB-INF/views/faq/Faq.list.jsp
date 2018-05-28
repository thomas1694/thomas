<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%  request.setCharacterEncoding("utf-8");%>
<c:set var="root" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


function fupdate(faq_num){
	var url = "${root}/faq/update";
	url += "?faq_num="+faq_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	
	location.href = url;
}

function fdelete(faq_num){
	var url = "${root}/faq/delete";
	url += "?faq_num="+faq_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	
	location.href = url;
}

function fcreate(faq_num){
	var url = "${root}/faq/create";
	url += "?faq_num="+faq_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	
	location.href = url;
}

function read(faq_num){
	
	var a=document.getElementById(faq_num);
	
	
	if(a.style.display=='none'||a.style.display==''){
 		a.style.display='table-row';
	}else{
		a.style.display='none';
	}
}


 
</script>
<title>faq</title>
<style type="text/css">

 a{
 	color: black;
 }
 a:hover {
	text-decoration: none;
}
container{
text-align:center;
margin:auto;
}
.faq1{
	width: 80%;
	margin:2px auto;
	text-align: center;
}
.qnaRe{
display:none;
}
</style>

</head>
<body>
	
<div class="container"> 
		<h2><i class="glyphicon glyphicon-list-alt"></i>자주하는 질문들</h2>
	<form name="faql" method="POST" action="./list" style="text-align: center;margin: auto;">

		<br><br>
		<select name="col" style="width: 15%;display:inline;"><!-- 검색할 컬럼 -->
		<option value="faq_category"
		<c:if test="${col=='faq_category' }">selected</c:if>
		>분류</option>
		<option value="faq_title"
		<c:if test="${col=='faq_title' }">selected</c:if>
		>제목</option>
		<option value="total">전체출력</option>
		</select>
		<input type="text" name="word" value="${word}" size="20" style="width:30%;display:inline;">
		<button class="btn btn-Default btn-md" style="width: 70px;height: 40px;">검색</button>
	</form>	<br><br>
		 <table class="table table-hover table-bordered" style="text-align:center;">
		
			<tr>
				<th width="10%" class="active" style="text-align:center;"><STRONG><BIG>번호</BIG></STRONG>
				<th width="10%" class="active" style="text-align:center;"><STRONG><BIG>분류</BIG></STRONG></th>
				<th width="50%" class="active" style="text-align:center;"><STRONG><BIG>제목</BIG></STRONG></th>
				<th width="15%" class="active" style="text-align:center;"><STRONG><BIG>작성자</BIG></STRONG></th>
				<th width="15%" class="active" style="text-align:center;"><STRONG><BIG>작성일</BIG></STRONG></th>
			</tr>
			
			<tbody>
			<c:choose>
				<c:when test="${empty list}">
				<tbody>
				<tr>
				<td colspan="5">
				등록된 글이 없습니다.
				</td>
				</tr>
				</tbody>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
					<tbody>
					<tr>
				<td>${dto.faq_num}</td>
				<td>${dto.faq_category}</td>
			    
				<td style="text-align: left; padding-left: 20px;">
				<a href="javascript:read(${dto.faq_num })">${dto.faq_title}</a>
				
				
                 
                
<%-- 				<a href="javascript:read('${dto.faq_num}')">${dto.faq_title}</a> --%>
				
				</td>
				
		
				<td>${dto.a_id}</td>
				<td>${dto.faq_wdate}</td>
					</tr>
					
					<tr id="${dto.faq_num }" class="qnaRe">
					<td></td>
					<td>답변</td>
					
				  <td style="text-align: left; padding-left: 20px;">
                  ${dto.faq_content }
                  </td>
                  <td>관리자</td>
                  <td>
                  <c:if test="${sessionScope.grade=='A' }">
                  	<button type="button" onclick="fupdate('${dto.faq_num}')" class="btn btn-Default btn-md" style="width: 70px;height: 40px;">수정</button>
                  	<button type="button" onclick="fdelete('${dto.faq_num}')" class="btn btn-Default btn-md" style="width: 70px;height: 40px;">삭제</button>
                  </c:if>
                  </td>
		
					</tr>
					</tbody>
				</c:forEach>
				</c:otherwise>
				</c:choose>
		</table>
		</div>
		<div style="text-align: center;">
	${paging}
	</div>
	<br><br>
	<div style="text-align: center; margin-bottom: 50px;">
	<c:if test="${sessionScope.grade=='A' }">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="fcreate('${dto.faq_num}')">글 작성</button>
	</c:if>
	
	</div>
</body>
</html>
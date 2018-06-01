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
<title>qna</title>
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

</style>
<script type="text/javascript">
	function read(q_num){
		var url = "${root}/qna/read";
		url += "?q_num="+q_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function qcreate(q_num){
		var url = "${root}/qna/create";
		url += "?q_num="+q_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>

<div class="container" style="margin-top: -50px;">	
		<h2><i class="	glyphicon glyphicon-pencil"></i>질문과 답변a</h2>
		<br><br>
			<form name="qnal" method="POST" action="./list" style="text-align: center;margin: auto;">
		<select name="col" style="width: 15%;display:inline;"><!-- 검색할 컬럼 -->
		<option value="q_title"
		<c:if test="${col=='q_title' }">selected</c:if>
		>제목</option>
		<option value="id"
		<c:if test="${col=='id' }">selected</c:if>
		>작성자</option>
		<option value="total">전체출력</option></select>
		<input type="text" name="word" value="${word}" size="20" style="width:30%;display:inline;"><!-- 검색어 -->
		<button class="btn btn-Default btn-md" style="width: 70px;height: 40px;">검색</button>
	</form>	<br><br>
	
		 <table class="table table-hover table-bordered" style="text-align:center;">
		
			<tr>
				<th class="active" style="text-align:center;"><STRONG><BIG>번호</BIG></STRONG>
				<th class="active" style="text-align:center;"><STRONG><BIG>제목</BIG></STRONG></th>
				<th class="active" style="text-align:center;"><STRONG><BIG>작성자</BIG></STRONG></th>
				<th class="active" style="text-align:center;"><STRONG><BIG>작성일</BIG></STRONG></th>
			</tr>
			
			
			<tbody>
				<c:choose>
				<c:when test="${empty list}">
				<tbody>
				<tr>
				<td colspan="4">
				등록된 글이 없습니다.
				</td>
				</tr>
				</tbody>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
					<tbody>	
				<tr>
				<td width="15%">${dto.q_num}</td>
				<td width="50%" style="text-align: left; padding-left: 20px;">
				<c:if test="${dto.q_indent>0 }">
				<c:forEach begin="1" end="${dto.q_indent }">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
   				<img src='${root}/resources/jmh/img/re.png' width="30px" >
				</c:if>
				<a href="javascript:read('${dto.q_num}')">
				<c:if test="${dto.q_lock=='L' }">
				<img src="${root }/resources/jmh/img/lock.png" width="30px">
				</c:if>
				${dto.q_title}</a>
<%-- 				<c:if test="${util:newimg(dto.q_wdate) }"> --%>
<!-- 				<img src='../img/new.jpg' > -->
<%-- 				</c:if> --%>
				
				</td>
				<td width="15%">${dto.id}</td>
				<td width="20%">${dto.q_wdate}</td>
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
	<div style="text-align: center;">
	<button class="btn btn-Default btn-md" type="button" name="" onclick="qcreate('${dto.q_num}')">글 작성</button>
	</div>
</body>
</html>
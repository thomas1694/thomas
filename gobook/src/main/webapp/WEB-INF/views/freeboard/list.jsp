<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function fileDown(filename) {
		var url = "${root}/download";
		url += "?filename=" + filename;
		url += "&dir=/freeboard/storage";

		location.href = url;
	}

	function bcreate() {
		var url = "./createForm";
		location.href = url;
	}
	function read(f_num) {
		var url = "./read";
		url += "?f_num=" + f_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.search {
	width: 80%;
	margin: 2px auto;
	text-align: center;
}
</style>
<link rel="Stylesheet"
	href="${root}/resources/pmw/top/assets/css/main.css">
<%-- <link href="${root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->



	<div class="container-fluid" style="margin-top: -50px;">
		<h2>
			<i class="glyphicon glyphicon-th-list"></i>게시판 목록
		</h2>
		<div class="search">
			<form action="./list" method="post">
				<select name="col" style="width: 10%; display: inline;">
					<!-- 검색할 컬럼 -->
					<option value="id" <c:if test="${col=='id'}">
	selected</c:if>>성명</option>
					<option value="f_title"
						<c:if test="${col=='f_title'}">
	selected</c:if>>제목</option>
					<option value="f_content"
						<c:if test="${col=='f_content'}">
	selected</c:if>>내용</option>
					<option value="total">전체출력</option>
				</select>
				<!-- 검색어 -->
				<input type="text" name="word" value="${word}" style="display: inline; width: 20%">
				<button class="btn btn-Default btn-md" style="width: 70px;height: 40px;">검색</button>
				<button type="button" onclick="location.href='./create'"
					class="btn btn-Default btn-md" style="width: 70px;height: 40px;">등록</button>
			</form>
		</div>
		<TABLE class="table table-condensed">
			<thead>
				<tr>
					<TH width="5%">번호</TH>
					<TH width="10%">성명</TH>
					<TH width="55%">제목</TH>
					<th width="5%">조회수</th>
					<th width="15%">등록날짜</th>
					<th width="10%">파일명</th>

				</tr>
			</tbody>
			<c:forEach var="dto" items="${list}">
				<tbody>
					<tr>
						<td>${dto.f_num}</td>
						<td>${dto.id }</td>
						<td><c:forEach begin="1" end="${dto.f_indent }">
    	&nbsp;&nbsp;
		</c:forEach> <c:if test="${dto.f_indent>0}">
								<img src='${root}/resources/jmh/img/re.png' width="30px" >
							</c:if> <a href="javascript:read('${dto.f_num}')">${dto.f_title}</a> <c:if
								test="${util:newimg(dto.f_wdate)}">
								<img src="${root }/resources/jmh/img/new.jpg">
							</c:if> <c:set var="frcount" value="${util:frcount(dto.f_num,rdao)}" />
							<c:if test="${frcount>0 }">
								<span style="color: green;">(${frcount})</span>
							</c:if></td>
						<td>${dto.f_count }</td>
						<td>${dto.f_wdate}</td>
						<td><c:choose>
								<c:when test="${empty dto.f_filename }">${dto.f_filename}
    	</c:when>

								<c:otherwise>
									<a href="${root }/storage/freeboard/file/${dto.f_filename }"
										download>${dto.f_filename }</a>
									<%--     	<a href="javascript:fileDown('${dto.f_filename}')">${dto.f_filename}</a> --%>
								</c:otherwise>
							</c:choose></td>
					</tr>
			</c:forEach>
			</tbody>
		</TABLE>

		<DIV class='bottom' style="margin-bottom: 50px;">${paging }</DIV>
	</div>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
 function trans(pg_num){
	 $("#"+pg_num).html('<form action="./updateContent" method="post"><input type="hidden" name="pg_num" value="'+pg_num+'"><input type="text" name="pg_content" style="width:30%;display:inline;"><input type="submit" value="수정"></form>');
	 
 }
 
 function pcreate(){
	$("#pcreateFile").click();
	$("#pcreateFile").change(function(){
		$("#pcreateSubmit").click();
	});
	
 }
 
 function pupdate(){
		$("#pupdateFile").click();
		$("#pupdateFile").change(function(){
			$("#pupdateSubmit").click();
		});
		
 }
 
 function pdelete() {
	 flag = confirm("정말로 삭제하시겠습니까?");
	 if(flag) {
		 return true;
	 } else {
		 return false;
	 }
 }
</script>
</head>
<body>
<p>최대 6개의 사진까지 등록이 가능합니다.</p>
<table>
	<tr>
		<th>미리보기</th>
		<th>파일명</th>
		<th>사진설명</th>
		<th>비고</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${empty dto}">
			<tr>
				<td colspan="3">등록된 사진이 없습니다. 등록하세요!</td>
				<td>
				<form action="./create" method="post" enctype="multipart/form-data">
				<input type="hidden" name="s_id" value="${sessionScope.id}">
				<input type="button" onclick="pcreate()" value="등록">
				<input type="file" style="display:none" name="pg_filenameMF" id="pcreateFile">
				<input type="submit" style="display:none" id="pcreateSubmit">				
				</form>	
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<td><img src="${root }/storage/page_image/${dto.pg_filename}" height="100px" width="100px;"></td>
				<td>${dto.pg_filename }  </td>
				<c:choose>
					<c:when test="${empty dto.pg_content }">
						<td>
								<div id="${dto.pg_num }">
									<input type="button" value="수정" onclick="trans('${dto.pg_num}')">
								</div>
						</td>
					</c:when>
					<c:otherwise>
						<td ><div id="${dto.pg_num }">
							${dto.pg_content }
							<input type="button" value="수정" onclick="trans('${dto.pg_num}')">
							</div>
						</td>
					</c:otherwise>
				</c:choose>
				<td>
				<form action="./update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pg_num" value="${dto.pg_num}">
				<input type="hidden" name="oldfile" value="${dto.pg_filename}">
				<input type="button" onclick="pupdate()" value="수정">
				<input type="file" style="display:none" name="pg_filenameMF" id="pupdateFile">
				<input type="submit" style="display:none" id="pupdateSubmit">				
				</form>	
				
				<form action="./delete" method="post" onsubmit="return pdelete()">
				<input type="hidden" name="pg_num" value="${dto.pg_num}">
				<input type="hidden" name="oldfile" value="${dto.pg_filename}">
				<input type="submit" value="삭제">				
				</form>	
				</td>
			</tr>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<c:if test="${fn:length(list)<6}">
		<c:forEach var="emt" begin="0" end="${5-fn:length(list)}">
			<tr style="height: 100px;">
				<td colspan="2">등록된 사진이 없습니다. 등록하세요!</td>
				<td>
				<form action="./create" method="post" enctype="multipart/form-data">
				<input type="hidden" name="s_id" value="${sessionScope.id}">
				<input type="button" onclick="pcreate()" value="등록">
				<input type="file" style="display:none" name="pg_filenameMF" id="pcreateFile">
				<input type="submit" style="display:none" id="pcreateSubmit">				
				</form>	
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</body>
</html>
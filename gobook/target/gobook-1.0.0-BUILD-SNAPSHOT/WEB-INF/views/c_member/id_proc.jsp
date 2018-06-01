<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function use(){
	opener.frm.c_id.value='${param.c_id}';
	self.close();
}
</script>
</head>
<body>

	<DIV class="title">아이디 중복확인</DIV>
	
	<div class="content">
	입력된 아이디 : ${param.c_id}<br><br>
	
	<c:choose>
		<c:when test="${flag }">
			중복되어 사용할 수 없습니다.<br><br>
		</c:when>
		<c:otherwise>
			중복 아님, 사용 가능합니다.<br><br>
			<button type='button' onclick='use()'>사용</button>
		</c:otherwise>
	</c:choose>
	</div>

	<DIV class='bottom'>
		<input type='submit' value='다시 시도' onclick="location.href='./id_form'"> 
		<input type='button' value='닫기' onclick="window.close()">
	</DIV>

</body>
</html>

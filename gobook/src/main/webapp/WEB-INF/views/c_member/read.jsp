<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
/* function clist(){
	var url = "${root}/admin/list";	//관리자인지아닌지 체크하기 위해 
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
} */
function updatePw(){
	var url="./updatePasswd";
	url += "?c_id=${c_id}";
	
	location.href=url;
}
function cupdate(){
	var url = "./update";
	url += "?c_id=${c_id}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
function cdelete(){
	var url = "./delete";
	url += "?c_id=${c_id}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>
</head>

<body>
	<DIV class="title">${dto.c_name}의 회원정보</DIV>

	<TABLE>
		<TR>
			<TH>아이디</TH>
			<TD>
				${dto.c_id}
			</TD>
		</TR>
		<TR>
			<TH>닉네임</TH>
			<TD>
				${dto.c_name}
				<c:if test="not empty ${dto.c_nickname}">
					(${dto.c_nickname})
				</c:if>				
			</TD>
		</TR>
		<TR>
			<TH>전화번호</TH>
			<TD>
				${dto.c_tel}
			</TD>
		</TR>
		<TR>
			<TH>이메일</TH>
			<TD>
				${dto.c_email}
			</TD>
		</TR>
		<TR>
			<TH>생일</TH>
			<TD>
				${dto.c_birth}
			</TD>
		</TR>
		<TR>
			<TH>성별</TH>
			<TD>
				${dto.c_gender}
			</TD>
		</TR>
		<TR>
			<TH rowspan="2">(우편번호)주소</TH>
			<TD>
				(${dto.c_zipcode})${dto.c_address1}
			</TD>
		</TR>
		<tr><td>${dto.c_address2}</td></tr>
		<TR>
			<TH>관심사</TH>
			<TD>			
				<c:forTokens var="c_inter" items="${dto.c_interest}" delims=","> 
					${util:c_interestValue(c_inter)} 			
				</c:forTokens>	
			</TD>
		</TR>
		<TR>
			<TH>가입날짜</TH>
			<TD>
				${dto.c_rdate}
			</TD>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='정보수정' onclick="cupdate()">
		<input type='button' value='회원탈퇴' onclick="cdelete()">	
		<input type='button' value='pw변경' onclick="updatePw()">
		
        <c:if test="${not empty sessionScope.s_id && sessionScope.grade == 'S'}">
        	<input type='button' value='목록' onclick="clist()"> <!-- 관리자만 버튼 보임 -->
        </c:if>	
		
	</DIV>
</body> 
</html>
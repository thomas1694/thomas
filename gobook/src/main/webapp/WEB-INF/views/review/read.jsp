<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%-- <script type="text/javascript" src="<%=root%>/resources/cjs/js/jquery-3.2.1.min.js"></script> --%>
<script type="text/javascript">
function mupdate(re_num){
	var url ="./update";
	url +=  "?re_num="+re_num;
	url += "&oldfile=${dto.re_filename}"; 
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href=url;
	}
	function mdel(re_num){
	var url ="./delete";
	url += "?re_num="+re_num;
	url += "&oldfile=${dto.re_filename}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href=url;
	}
	function mlist(re_num){
		var url = "./list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href=url;
	}
	function uplike(re_num) {
		
		
		$.post("./re_like", {
			num: re_num
		}, function(data, textSt){
			var like = document.getElementById("like").firstChild.nodeValue;
			alert('좋아요 감사합니다.');
			like++;
			$("#like").empty();
			$("#like").append(like);
		});
	}

</script>

<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

hr {
	text-align: center;
	border: 1px solid #AAAAAA;
	width: 50%;
}
  #table1, th, td {
    border: 1px solid #bcbcbc;
  }
  #table1 {
    width: 400px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
  }

</style>
</head>
<body>
 
	<DIV class="title">조회</DIV>

	<TABLE id="table1">
		<TR>
			<TH>제목</TH>
			<TD>${dto.re_title}</TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD>${dto.re_content}</TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD>${dto.re_count }</TD>		
		</TR>
		<TR>
			<TH>평점</TH>
			<TD>${dto.re_rating }</TD>
		</TR>
		<TR>
			<TH>좋아요</TH>
			<TD><span id="like">${dto.re_like }</span></TD>
		</TR>
		<TR>
			<TH>등록날짜</TH>
			<TD>${dto.re_wdate }</TD>
		</TR>
		<TR>
			<TH></TH>
			<TD><c:choose>
					<c:when test="${empty dto.re_filename}">
      		파일없음
      	</c:when>
					<c:otherwise>
						<img src="${root }/storage/review/img/${dto.re_filename}" style="width:300px; height:200px; display:block;" class="w3-hover-opacity" align="middle">
					</c:otherwise>
				</c:choose></TD>
		</TR>
	</TABLE>

						<DIV class='bottomreview' style="text-align: center;">

							<input type='button' value='좋아요' onclick="uplike(${dto.re_num})">
							<input type='button' value='LIST' onclick="mlist(${dto.re_num})">
							<input type='button' value='UPDATE'onclick="mupdate(${dto.re_num})"> 
							<input type='button'value='DELETE' onclick="mdel(${dto.re_num})">
						</DIV>

	<hr>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
.search{
    width : 80%;
    margin: 5px auto;
    text-align : center;
}
  #table1, th, td {
    border: 1px solid #bcbcbc;
  }
  #table1 {
    width: 700px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
  }
</style> 

<script type="text/javascript">
function incheck() {
	var f = document.frm;
	if(f.re_title.value=="") {
		alert("값좀 넣으라고!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		f.re_title.focus();
		return;
	}
	if(f.re_content.value=="") {
		alert("값좀 넣으라고!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		f.re_content.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
<div class="title">수정</div>
<FORM name='frm' 
	method='POST' 
	action='./update'> 
<input type="hidden" name="re_num" value='${dto.re_num}'>  
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name = "oldfile" value="${dto.re_filename }">
<center>
<table id="table1" >
	<tr>
	<th width="50%;">제목</th>
	<td width="50%;"><input type="text" name="re_title" size="3" value="${dto.re_title}"></td>
	</tr>
	<tr>
	<th width="50%;">내용</th>
	<td width="50%;"><textarea rows="3" cols="3" name="re_content">${dto.re_content}</textarea></td>
	</tr>
</table>
<div class="bottom">
	<button type="button" onclick="incheck()">전송</button>
</div>
</form>
</center>
</body>
</html>
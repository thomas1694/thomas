<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function mlist(){
	var url="./list"
		url+="?col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		location.href=url;
}
</script>
<body>


<div class="title"></div>
    
      
      <form name="frm" method="post" action="./delete">
      <input type="hidden" name="res_code" value="${param.res_code}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

예약을 취소하시겠습니까?<br>

<br><br>

<button type="submit">삭제</button>
<button type="button" onclick="mlist()">목록</button>
</form>

</body>
</html>
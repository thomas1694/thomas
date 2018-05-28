<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="title"></div>
    
      
      <form name="frm" method="post" action="${root }/service/delete">
         <input type="hidden" name="sv_num" value="${sv_num}">
      <input type="hidden" name="simg_filename" value="${simg_filename}">

 서비스 등록을 삭제하시겠습니까?<br>

<br><br>

<button type="submit">삭제</button>
<button type="button" onclick="history.back()">뒤로가기</button>
</form>

</body>
</html>
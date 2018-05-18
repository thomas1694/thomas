<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="title"></div>
    
      
      <form name="frm" method="post" action="/service/delete">
         <input type="hidden" name="sv_num" value="${sv_num}">
      <input type="hidden" name="simg_filename" value="${simg_filename}">

 서비스 등록을 삭제하시겠습니까?<br>

<br><br>

<button type="submit">삭제</button>
<button type="button" onclick="mlist()">목록</button>
</form>

</body>
</html>
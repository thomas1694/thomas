<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style type="text/css">
  #gobookcontent .cscenter a{
  color: black;
  }
  #gobookcontent .cscenter a:hover{
  text-decoration: none;
  }
  #gobookcontent .cscenter a:visited{
  color: black;
  }
  
  #gobookcontent .cscenter .jumbotron:hover{
  transform:scale(1.5);
  }
  
  
  </style>
</head>
<body style="margin-top: -30px;">
  <div class="jumbotron" style="margin-bottom: 0px;text-align: center;background-color: #404040; color: white;transform:scale(1.5);">
    <h1 style="font-size: 230%">고북 고객 센터</h1>      
  </div>
	<div class="cscenter">
   <a href="./notice/list"><div class="jumbotron" style="margin-bottom: 0px;text-align: center;background-color: white; border: 1px solid black;margin-top:40px;">
    <h1>공지사항</h1>      
  </div></a>
  <a href="./qna/list">
  <div class="jumbotron" style="margin-bottom: 0px;text-align: center; background-color: white; border: 1px solid black;">
    <h1>Q & A</h1>      
  </div></a>
  <a href="./faq/list">
  <div class="jumbotron" style="margin-bottom: 0px;text-align: center; background: white; border: 1px solid black;">
    <h1>자주 묻는 질문</h1>      
  </div></a>
</div>
</body>
</html>
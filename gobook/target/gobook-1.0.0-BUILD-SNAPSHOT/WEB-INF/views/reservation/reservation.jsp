<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
 <%@ include file = "ssi.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">$.noConflict();</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">$.noConflict();</script>
<title>Insert title here</title>

<script type="text/javascript">
var sv_num,sv_num_upper;
function rselect(sv_num, sv_num_upper){
	var url="./reservation2";
		url+="?sv_num="+sv_num;
		url+="&sv_num_upper="+sv_num_upper;
		location.href=url;	
}

</script>
<style type="text/css">
*{

	font-family:'Nanum BarunpenR';
		
}
a{
color:black;
}
 a:hover{
 color:black;
  text-decoration: none;
  }
  a:visited{
  color: white;
  }
  
  #mw:hover{
  transform:scale(1.1);
  }
</style>
</head>
<body>
<section id="portfolio" style="height: 400px;">
 	<div class="row">
  		<div class="col-sm-4" style="font-size: 30px;margin-top: -100px;margin-left: 15px;"><button type="button" onclick="window.close();" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-arrow-left"></span>예약하기 취소</button></div>
	</div>
 <div class="container" style="width:95%; ">


<!--  <ul class="nav nav-tabs" id="ser1"> -->
<!--     <li class="active"><a data-toggle="tab" href="#service">서비스</a></li> -->
<!--     <li><a data-toggle="tab" href="#service2">상세 서비스</a></li> -->
<!--     <li><a data-toggle="tab" href="#time">시간예약</a></li> -->
<!--     <li><a data-toggle="tab" href="#menu3">Menu3</a></li> -->
<!--   </ul> -->

   <h1><span class="glyphicon glyphicon-book"></span>대분류 선택</h1> 
    
  

	<div class="row" style="margin-top: 30px;">
	<c:forEach var="dto" items="${list }" varStatus="status" begin="0" end="2">
	<a href="javascript:rselect('${dto.sv_num}','${dto.sv_num_upper}');"><div id="mw" class="col-sm-4">
  <table border="1">
  <tr>
  <td ><img src="${root }/storage/service_image/img/${dto.simg_filename}"width='100%'></td>
  </tr>
  <tr><th height="100px" style="text-align: center; font-size: 30px;">${dto.sv_title}</th></tr>
  <tr><th ><div  style="background-color:black;color:white; text-align: center;font-size: 80px;">
	선택 
  </div></th></tr>
  </table>
  </div></a>
 
  </c:forEach>   
	</div>   

   </div>
   
   <div id="bottom">
   
   
   </div>
   
 


</section>

 
</body>
</html>
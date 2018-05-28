<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%
	request.setCharacterEncoding("utf-8");
	Calendar rightNow = Calendar.getInstance();
	Calendar rightNow2 = new GregorianCalendar();
	GregorianCalendar rightNow3 = new GregorianCalendar(); // 직접 그레고리언 캘런더 생성

	System.out.println("오늘 날짜는 " + rightNow.get(Calendar.YEAR) + "년 "
        + (rightNow.get(Calendar.MONTH) - Calendar.JANUARY + 1) + "월 "
        + rightNow.get(Calendar.DATE) + "일 ");

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
<link  href="${root }/resources/pmw/reservation/datepicker.css" rel="stylesheet">
<script src="${root }/resources/pmw/reservation/datepicker.js"></script>
<script src="${root }/resources/pmw/reservation/datepicker.ko-KR.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
var sv_num,sv_num_upper;
function rselect(sv_num){
	var url="./reservation3";
		url+="?sv_num="+sv_num;
		location.href=url;	
}

var $d = jQuery.noConflict(); 
$d(document).change(function($){ 
	
	$d.post("./resdate", {
		sv_num:${param.sv_num },
		resdate:document.getElementById('resdate').value
	}, function(data, textSt){
		$d('#ab').css('display','table-row');
		$d('#cd').css('display','table-row');
		$d('#result').html(data);
	});

});
$d(document).ready(function() {
	$d("#ab").css("display", "none");
});
$d(document).ready(function() {
	$d("#cd").css("display", "none");
});

function lastres(){
	var dt=$d("#resdate").val();
	var dd=$d("#time").val();
	if(confirm(dt+'  '+dd+':00 에 예약 하시겠습니까?')==false){
		return false;
	}
}
function tt(time){
	$d("#time").val(time);
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
  		<div class="col-sm-4" style="font-size: 30px;margin-top: -100px;margin-left: 15px;"><button type="button" onclick="history.back();" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-arrow-left"></span>뒤로 가기</button></div>
	</div>
 <div class="container" style="width:95%; ">


<!--  <ul class="nav nav-tabs" id="ser1"> -->
<!--     <li class="active"><a data-toggle="tab" href="#service">서비스</a></li> -->
<!--     <li><a data-toggle="tab" href="#service2">상세 서비스</a></li> -->
<!--     <li><a data-toggle="tab" href="#time">시간예약</a></li> -->
<!--     <li><a data-toggle="tab" href="#menu3">Menu3</a></li> -->
<!--   </ul> -->

   <h1><span class="glyphicon glyphicon-book"></span>예약 시간 선택</h1> 
<form action="./reservation3" method="post" onsubmit="return lastres()">
<input type="hidden" name="time" id="time" value="">
<input type="hidden" name="sv_num"  value="${param.sv_num }">
<table class="table table-hover"  style="font-size: 30px;margin-left: 60px;margin-top: 50px;">
	<tr style="margin-bottom: 20px;">
		<th>
			예약 날짜
		</th>
		
		<td style="padding-left: 30px;">
			<input type="text" name='date' id='resdate' placeholder="예약하실 날짜를 선택해 주세요!" data-toggle="datepicker" style="font-size: 40px; width: 500px; "></div>
		</td>
	</tr>
	<tr>
		<th style="height: 100px;"></th>
		<th></th>
	</tr>
	<tr id="ab"><th>
		예약 시간
		</th>
		<td>
			<div id="result"></div>
		</td>
	</tr>
	<tr id="cd"><th colspan="2" style="padding-top:100px;padding-left: 450px;">
		예약 하실 시간을 선택해 주세요!.
		</th>
		
	</tr>
</table>
</form>
  







<script type="text/javascript">
 $d('[data-toggle="datepicker"]').datepicker({
	language: 'ko-KR',
	inline:false,
	autoHide:false,
	startDate:'<%=rightNow.get(Calendar.YEAR)%>.<%=(rightNow.get(Calendar.MONTH) - Calendar.JANUARY + 1)%>.<%=rightNow.get(Calendar.DATE)%>',
	autoHide:true
}); 
</script>
   

</section>

 
</body>
</html>
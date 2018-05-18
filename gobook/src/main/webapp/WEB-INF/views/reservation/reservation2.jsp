<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
div#ser {
  top: 50px;
  left: 5px;
  height:800px;
  width:1600px;
  margin-left:300px;
  position:relative;
  float: left;
  display: flex;
}
div#service {
  top: 50px;
  left: 5px;
  height:800px;
  width:1600px;
  position:relative;
  float: left;
  display: flex;
}
ul#ser1 li{
  height:100px;
  width:300px;
  float:left;
  text-align: center;
}
ul#ser1 li a{
 height:100px;
  width:300px;
  float:left;
  text-align: center;
}
#box-left {
  height:200px;
  width:400px;
  top:50px;
  left:0px;
  position:relative;
  float:left;
}
#box-center {
  height:200px;
  width:400px; 
  left:50px; 
  top:50px;
  position:relative;
  text-align: center;
  float:left;
}
#box-right {
  height:200px;
  width:400px;
  left:100px;
  top:50px;
  position:relative;
  text-align: right;
  float:left;
}
#pic2{
  height:100px;
}
#pic3{
  height:100px;
}
    .my_box {
        
          height: 50px;
          width: 150px;
          padding: 2px 2px 2px 2px; /* ì, ì°, ì¢, í */
          text-align: left; /* left, center, right */
          border: #888888 1px solid;
          background-color: #FFFFFF;
          text-align:center;
          /* íëë¦¬ ê°ê°ì ìì ë° ëê»ë¥¼ ì§ì í ë ì¬ì©í©ëë¤
          border-right: #888888 1px solid;
          border-left: #888888 1px solid;
          border-top: #888888 1px solid;
          border-bottom: #888888 1px solid;
          */

          /* ê¸ê¼´ì ë°ë¡ ì§ì í  ì ìë¤.
          font-family: ê¶ì, Gulim, 'Times New Roman';
          */
          color: #0000ff;
          font-size: 10pt; 
          font-weight: normal; /* normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900 */
          font-style: normal; /* normal, italic, oblique */;
    }
</style>
</head>
<script type="text/javascript">
function reservation1(){
	var url="./reservation3";
	url+="?sv_num=${list[0].sv_num}";
	url+="&sv_num_upper=${list[0].sv_num_upper}";
	location.href=url;	
}
function reservation2(){
	var url="./reservation3";
	url+="?sv_num=${list[1].sv_num}";
	url+="&sv_num_upper=${list[1].sv_num_upper}";
	location.href=url;	
}
function reservation3(){
	var url="./reservation3";
	url+="?sv_num=${list[2].sv_num}";
	url+="&sv_num_upper=${list[2].sv_num_upper}";
	location.href=url;	
}
</script>
<body>

     <div class="container" id="ser">

              <div class="w3-container"  id="book">

 <ul class="nav nav-tabs" id="ser1">
    <li><a data-toggle="tab" href="#service">서비스</a></li>
    <li class="active"><a data-toggle="tab" href="#service2">서비스 예약</a></li>
    <li><a data-toggle="tab" href="#time">시간 예약</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu3</a></li>
  </ul>
    
  <div class="tab-content"> 
    <h2></h2> 
    <h2>Detail Service</h2> 
    <form name = "frm" action="" method="post"> 
   <div id="service" class="tab-pane fade in active"> 
   
    <div id="box-left">
  <table border="1" style="width:80%;">
  <tr>
  <td class="td"><img src="./images/경리.jpg"width='100%' height='30%'></td>
  </tr>
  <tr><th height="100px">
  <ul>
   <li><p>${list[0].sv_title}/${list[0].sv_price}</p></li>
   <li><p>${list[0].sv_timeperson}</p></li>
   <li><p>${list[0].sv_content}</p></li>
   </ul>
  </th>
  </tr>
  <tr><th id="pic3"><center><input type="button" name="select" value="선택" class="my_box" onclick="reservation1()"/></center></th></tr>

  </table>
  </div>
  
  <div id="box-center">
  <table border="1" style="width:80%;">
  <tr>
  <td class="td"><img src="./images/경리.jpg"width='100%' height='30%'></td>
  </tr>
  <tr><th id="pic2"><ul>
    <li><p>${list[1].sv_title}/${list[1].sv_price}</p></li>
   <li><p>${list[1].sv_timeperson}</p></li>
   <li><p>${list[1].sv_content}</p></li>
   </ul>
  </th>
  </tr>
  <tr><th id="pic3"><center><input type="button" name="select" value="선택" class="my_box"/></center></th></tr>
  </table>
  </div>
  
  <div id="box-right">
  <table border="1" style="width:80%">
  <tr>
  <td class="td"><img src="./images/경리.jpg"width='100%' height='30%'></td>
  </tr>
  <tr><th height="100px"><ul>
    <li><p>${list[2].sv_title}/${list[2].sv_price}</p></li>
   <li><p>${list[2].sv_timeperson}</p></li>
   <li><p>${list[2].sv_content}</p></li>
   </ul>
  </th>
   </tr>
  <tr><th id="pic3"><center><input type="button" name="select" value="선택" class="my_box"/></center></th></tr>
  </table>
  </div>
   
   </div>
   </form>
   </div>
   </div>
   </div>


</body>
</html>
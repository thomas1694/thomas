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
<link rel="stylesheet" href="style.css" type="text/css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
div#ser {
  top: 50px;
  left: 5px;
  height:800px;
  width:1600px;
  position:relative;
  margin-left:300px;
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
    table#calendar{
          width:1000px;
    }
    div#divcal{
           top:150px;
           left:300px;
           width:1000px;
           float:left;
           position:absolute;
    }
    div#ddd{
           top:50px;
           height:100px;
           width:130px;
            position:relative;
    }
    div#time{
           top:200px;
           height:200px;
           width:1200px;
           float:left;
         position:relative;
    }
    .tab-content{
           top:10px;
           height:100%;
           width:100%;
    }
</style>
</head>
<body>
<form name ="frm" action="./reservation3" method='POST'>
    <input type="hidden" name="sv_num" value="${param.sv_num}">
     <div class="container" id="ser">

      <div class="w3-container"  id="book">

 <ul class="nav nav-tabs" id="ser1">
    <li><a data-toggle="tab" href="#service">서비스</a></li>
    <li><a data-toggle="tab" href="#service2">서비스 예약</a></li>
    <li class="active"><a data-toggle="tab" href="#time">시간 예약</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu3</a></li>
  </ul>
    
  <div class="tab-content"> 
    <h2>Time</h2> 
 <div id="ddd">
<h3>여기에</h3>
<table class="table table-hover">
 <tr><th>정보 들어갑니다</th></tr>
 <tr><th>예약정보 요약</th></tr>
</table>
</div>   

<div class="container" id="divcal">
<a href="#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-inline="true">뒤로</a>
   <center><p>2018년 2월</p></center>
   <a href="#" data-role="button" class="ui-btn-right" data-icon="arrow-r" data-iconpos="right" data-inline="true">앞으로</a>
  <TABLE class="table table-hover" id="calendar">
    <TR>
      <TH>월</TH><TH>화</TH><TH>수</TH><TH>목</TH><TH>금</TH><TH>토</TH><th>일</th>
      </TR>
      <tr>
      <TH>1</TH><TH>2</TH><TH>3</TH><TH>4</TH><TH>5</TH><TH>6</TH><th>7</th>
      </TR>
      <tr>
        <TH>8</TH><TH>9</TH><TH>10</TH><TH>11</TH><TH>12</TH><TH>13</TH><th>14</th>
        </TR>
        <tr>
        <TH>15</TH><TH>16</TH><TH>17</TH><TH>18</TH><TH>19</TH><TH>20</TH><th>21</th>
        </TR>
        <tr>
       <TH>22</TH><TH>23</TH><TH>24</TH><TH>25</TH><TH>26</TH><TH>27</TH><th>28</th>
    </TR>
    </TABLE>
</div>


<div id="time">
<section style="text-align:center">
<h3>시간 예약</h3>
<input type = "text" name="res_code">
<input type = "text" name="res_time">
<input type = "text" name="c_id">
<input type= "submit" value="예약하기">

<div class="row" style="margin-left: 200px; margin-top: 10px;" >
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="09:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="10:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="11:00">
  </div>
  <div class="col-xs-1">
  
    <input type="text" class="form-control" placeholder="12:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="15:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="18:00">
  </div>
</div>
<div class="row1" style="margin-left: 200px; margin-bottom: 5px;" >
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="09:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="10:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="11:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="12:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="15:00">
  </div>
  <div class="col-xs-1">
    <input type="text" class="form-control" placeholder="18:00">
  </div>
</div>
</section>
</div>
 
   </div>
   </div>
   </div>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 체크</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
// 	function fn_reserread(){
// 		var sv_num = "";
// 			var size = document.getElementsByName("RowCheck").length;
// 			 var url = "./{id}/reservation";
// 		    for(var i = 0; i < size; i++){
// 		        if(document.getElementsByName("RowCheck")[i].checked == true){
// 		         sv_num = document.getElementsByName("RowCheck")[i].value;
// 		    		a += sv_num;
// 		    		a = a+ ",";
// 		        }else{
// 		   		 alert("서비스를 선택 해주세요.")
// 				 return;
// 			 }
// 		    }	
// 		    url += "?sv_numlist="+a;
// 		    location.href = url;
// 	}
	function create(){
		var url ="./create";
		location.href = url;
	}
	function Dread(sv_num) {
		var url = "./Dread"
		url += "?sv_num=" + sv_num;
		location.href = url;
	}
	function read(sv_num) {
		var url = "./read"
		url += "?sv_num=" + sv_num;
		location.href = url;
	}
	function sopen(num){
		var a=document.getElementsByClassName(num);
		
		for(var i=0;i<3;i++){
		if(a[i].style.display=='none'||a[i].style.display==''){
	 		a[i].style.display='block';
		}else{
			a[i].style.display='none';
		}
	}
	}
	
</script>

</head>
<body>

		<div class="container ">
				<h2>서비스</h2>

				<table class="table table-hover table-bordered" style="text-align:center;">
						<tr>
							<th style="text-align:center; background-color: rgba(160, 160, 160, 0.075);">서비스를 선택해주세요</th>
						</tr>

					<c:choose>
						<c:when test="${empty list }">
						<tr>
							<td >등록된 서비스가 없습니다 추가해주세요</td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="mlist" items="${list }">
						
					<c:forEach var="dto" items="${mlist}">

						
							
								
								<c:choose>
									<c:when	test="${dto.sv_num_upper==''}">
									<tr>
										<td>
										<span style="padding-left: 70px;">
										<button class="btn btn-Default btn-md" style="width: 900px;height: 40px;" onclick="read('${dto.sv_num}')">${dto.sv_title}</button>
										</span>
										<span style="float: right;">
										<input type="button" class="btn btn-Default" style="width: 70px; height: 40px;" value="펼치기" onclick="sopen('${dto.sv_num}')" style="float: right;">
										</span>
										</td>
									</tr>
									</c:when>
									<c:otherwise>
									<tr>
										<td class="${dto.sv_num_upper }" style="text-align:center;margin:auto;" >
										<span>
										<button class="btn btn-Default btn-md" style="width: 600px;height: 40px;"	onclick="Dread('${dto.sv_num}')">${dto.sv_title}</button>
										<script type="text/javascript">
										var $j232 = jQuery.noConflict();   

										$j232(document).ready(function ($) {
											 $(".${dto.sv_num_upper}").hide();
											});
										</script>
										
										</span>
											</td>
									</tr>
									</c:otherwise>
								</c:choose>
							

					
					</c:forEach>
					</c:forEach>
						</c:otherwise>
					</c:choose>


				</table>
				<div style="text-align: center; margin-bottom: 50px;">
				<input type="button"  class="btn btn-Default btn-md" style="width: 80px;height: 50px;" value="추가" onclick="create()">
				</div>
			</div>




</body>
</html>
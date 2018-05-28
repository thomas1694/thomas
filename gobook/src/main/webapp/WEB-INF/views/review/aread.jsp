<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%-- <script type="text/javascript" src="<%=root%>/resources/cjs/js/jquery-3.2.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function mupdate(re_num){
	var url ="./update";
	url +=  "?re_num="+re_num;
	url += "&oldfile=${dto.re_filename}"; 
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href=url;
	}
	function mdel(re_num){
	var url ="./delete";
	url += "?re_num="+re_num;
	url += "&oldfile=${dto.re_filename}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href=url;
	}
	function mlist(){
		var url = "${root}/review/list";
		location.href=url;
	}
	function uplike(re_num) {
		
		
		$.post("./re_like", {
			num: re_num
		}, function(data, textSt){
			var like = document.getElementById("like").firstChild.nodeValue;
			var flag=data.cflag;
			if(flag){
			alert('좋아요 감사합니다.');
			like++;
			$("#like").empty();
			$("#like").append(like);
			}else{
				alert('이미 좋아요 등록하신 글입니다.');
			}
		});
	}

</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

</head>
<body style="margin-top: -50px;">
 	<div class="container">
  		<h2> <span class="glyphicon glyphicon-apple"></span>조회</h2>
  		<table class="table">

		<TR>
			<TD><strong style="font-size: 20px;">${dto.c_id }</strong><br><div style="font-size: 15px;">
			<div style="float: right;font-size:25px;">(${dto.re_rating })</div>
			<div id="re_rating" style="float: right;"></div>
			<script type="text/javascript">
		var $j232 = jQuery.noConflict();   

		$j232(document).ready(function ($) {
			 
			  $('#re_rating').rateYo({
			    rating: ${dto.re_rating},
			    readOnly:true
			  });
			 
			  
			});
		</script>
		
			&nbsp;&nbsp;<span><span class="glyphicon glyphicon-thumbs-up"></span>
								${dto.re_like }
						</span>
			&nbsp;&nbsp;<span><span class="glyphicon glyphicon-eye-open"></span>
								${dto.re_count }
						</span>			
			<br></b>&nbsp;&nbsp;${dto.re_wdate }
			</div> </TD>
		</TR>
		<tr>
			<TD><c:choose>
					<c:when test="${empty dto.re_filename}">
      				파일없음
      			</c:when>
					<c:otherwise>
						<img src="${root }/storage/review/img/${dto.re_filename}" style="width:1000px;  display:block;" class="w3-hover-opacity" align="middle">
					</c:otherwise>
				</c:choose></TD>
		</TR>
		<tr>
			<td><h3>${dto.re_title }</h3>
			${dto.re_content }</td>
		</tr>
		<tr>
			<td style="vertical-align: middle;">
						<DIV class='bottomreview' style="text-align: center;padding-top: 20px;">
							<c:if test="${sessionScope.id!=null }">
							<input class="btn btn-default"  type='button' value='좋아요' onclick="uplike(${dto.re_num})">
							</c:if>
							<input class="btn btn-default"  type='button' value='LIST' onclick="mlist()">
							<input class="btn btn-default"  type='button' value='GoBook' onclick="location.href='${root}/${dto.s_id }'">
							<c:if test="${sessionScope.id==dto.c_id ||sessionScope.grade=='A'}">
							<input class="btn btn-default"  type='button' value='UPDATE'onclick="mupdate(${dto.re_num})"> 
							<input class="btn btn-default"  type='button'value='DELETE' onclick="mdel(${dto.re_num})">
							</c:if>
						</DIV>
			</td>
		</tr>
	</TABLE>


	</div>
</body>
</html>

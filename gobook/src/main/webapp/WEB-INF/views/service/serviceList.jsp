<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 체크</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="${root }/resources/ltj/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="${root }/resources/ltj/js/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="${root }/resources/ltj/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function fn_reserread(){
		var sv_num = "";
		if(document.frm.RowCheck[i].checked==true){
		var serviceChk = document.getElementsByName("RowCheck");
		serviceChk.action = "reservation/read?sv_num=${sv_num}";
		serviceChk.submit();
		}else{
		 alert("서비스를 선택 해주세요.")
		 return;
	 }
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
</script>
<style type="text/css">
.container123 {
	top: 70px;
	left: 300px;
	position: relative;
	margin-top: -130px;
	margin-bottom:100px;
	margin-right:100px;
	width:50%;
}

</style>
</head>
<body>

	<form name="frm" action="/list" method="post">
		<div class="container123">
			<div id="service">
				<h2>서비스</h2>
				<input type="button" value="추가">

				<table class="table table-striped" width="30%">
							<th></th>
							<th class="hh" width="500">서비스를 선택해주세요</th>
						</tr>
					</thead>


					<c:forEach var="dto" items="${list}">

						<tbody>
							<tr>
								<th class="header" width="1%"><input type="checkbox"
									name="RowCheck" value="${dto.sv_num}"></th>
								<c:choose>
									<c:when
										test="${dto.sv_num_upper==1||dto.sv_num_upper==dto.sv_num}">
										<th width="10%"><a
											href="javascript:read('${dto.sv_num}')">${dto.sv_title}</a><input
											type="button" value="펼치기" style="float: right;"></th>
									</c:when>
									<c:otherwise>
										<th width="10%"><a
											href="javascript:Dread('${dto.sv_num}')">${dto.sv_title}</a><input
											type="button" value="펼치기" style="float: right;"></th>
									</c:otherwise>
								</c:choose>
							</tr>

						</tbody>
					</c:forEach>


				</table>


			</div>

			<input type="button" value="적용" onclick="fn_reserread()">

		</div>
	</form>

</body>
</html>
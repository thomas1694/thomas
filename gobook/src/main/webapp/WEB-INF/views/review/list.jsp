<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/cjs/ssi/ssi.jsp" %>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Gobook Review</title>
<script type="text/javascript">
	function fileDown(re_filename) {
	var url = "{root}/download";
	url += "?re_filename=" + re_filename;
	url += "&dir=/storage/review/img";
	location.href = url;
}
	function read(re_num) {
		var url = "./read";
		url += "?re_num=" + re_num; //자바스크립트변수는 + jsp변수는 식 안에
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
<style type="text/css">

.search{
width: 70%;
margin : 10px auto;
text-align: center;
}
</style>
</head>
<body>

<!-- 제목 -->
<div class="col-sm-8 col-sm-offset-2 section-container-spacer ">
        <div class="text-center">
          <h1 class="h2">Review</h1>
        </div>
</div>
<br>
<br>

<!-- 검색어 -->

<form action="./list" method="get">
<center>
					<select name="col" style="width: 10%; display: inline;">
						<option value="re_title"
							<c:if test="${col == 're_title' }">selected</c:if>>제목</option>
						<option value="re_content"
							<c:if test="${col == 're_content' }">selected</c:if>>내용</option>
						<option value="total">전체출력</option>
					</select> <input type="search" name="word" value="${word}" >
					<button>검색</button>
					<button type="button" onclick="location.href='./create'">등록</button>
				</form>
				</center>


<!-- 본문시작 -->
<br>
	<table class="w3-table" style="width:60%; height:50% ;margin:0 auto;">
		
		<tr>
			<td colspan="3">
		 	</td>
		</tr>
		
	<!-- 게시글 시작 -->	

	<c:choose>
		<c:when test="${empty list }">
		 	<tr>
		 		<td colspan="3">
		 			등록된 게시글이 없습니다.
		 		</td>
		 	</tr>
		</c:when>
	
	
	
	<c:otherwise>
		
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />

		<c:forEach var="dto" items="${list }">
		
		<c:if test="${i%j==0 }">
			<tr>
		</c:if>
		
			<td>
				<div class="w3-card-4" style="width: 310px;">
					<div class="head">
						<!-- 제목, id -->
						<span style="float:left;"><h4><b>${dto.re_title }</b></h4></span>
							<c:if test="${util:newimg(dto.re_wdate)}">
				    			<img src="${root }/storage/review/img/new.gif" width="20px">
				  			</c:if>
						<span style="float:right;">
	          					<span class="glyphicon glyphicon-thumbs-up">
	          					
	          					</span>
	       					 </a>
								추천수(${dto.re_like })
						</span>
					</div>
					
					<div class="file">
					<a href="javascript:read('${dto.re_num}')">
						<img src="${root }/storage/review/img/${dto.re_filename}" style="width:310px; height:150px; display:block;" class="w3-hover-opacity" align="middle">
					</a>
					</div>
				
					      
					      <div align="center" style="width:100%;">
						      ${dto.re_content }
					      </div>
					      
					      <div class="tcontent">
					      
					      <a href="javascript:read('${dto.re_num}')" rel="">by ${dto.s_id}${dto.c_id }님</a></span>
							  <span class="glyphicon glyphicon-pencil"></span>
							</a>
							  &nbsp;
							  <span style="float:right;">${dto.re_wdate }</span>
					 	 </div>
					 </div>
				</div>
			</td>
			
			  <c:if test="${i%j == j-1 }">
                </tr>
              </c:if>
		   	<c:set var="i" value="${i+1 }" />

			</c:forEach>
			
		</c:otherwise>
	</c:choose>
	</table>
	
	<br>
	<DIV class='bottom'>
    	${paging }
    </DIV>
    <br>
	
	


</body>
</html>
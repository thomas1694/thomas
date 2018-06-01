<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "ssi.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<FORM name='frm' 
 method='POST' 
 action='./update'
 enctype="multipart/form-data"
 onsubmit="return inputCheck(this)">
 <input type="hidden" name="sv_num" value="${dto.sv_num}">
  <input type="hidden" name="sv_num_upper" value="${dto.sv_num_upper}">
   <input type="hidden" name="simg_num" value="${dto.serdto.simg_num}">
   
<DIV class="container">
 <h2><c:if test="${dto.sv_num_upper !='' }">상세 </c:if>서비스 수정</h2>
 
  <TABLE>
    <TR>
      <TH>서비스 사진</TH>
      <TD><img src="${root }/storage/service_image/img/${dto.serdto.simg_filename}"></TD>
    </TR>
    <TR>
      <TH><c:if test="${dto.sv_num_upper !='' }">상세 </c:if>서비스명</TH>
      <TD><input type="text" name="sv_title" value="${dto.sv_title}"></TD>
    </TR>
    <c:if test="${dto.sv_num_upper !='' }">
    
    <TR>
      <TH>서비스 내용</TH>
      <TD>
      <input type="text" name="sv_content" value="${dto.sv_content}">
      </TD>
    </TR>
    <TR>
      <TH>서비스가격</TH>
      <TD><input type="text" name="sv_price" value="${dto.sv_price}"></TD>
    </TR>
     <TR>
      <TH>타임당 예약인원수</TH>
      <TD><input type="text" name="sv_timeperson" value="${dto.sv_timeperson}"></TD>
    </TR>
    </c:if>
    <c:if test="${dto.sv_num_upper =='' }">
    
    
      <input type="hidden" name="sv_content" value="${dto.sv_content}">
      
      
      <TD><input type="hidden" name="sv_price" value="${dto.sv_price}"></TD>

      
      <TD><input type="hidden" name="sv_timeperson" value="${dto.sv_timeperson}"></TD>
    
    </c:if>
    
  </TABLE>
  
  </DIV>
  
  <DIV class='bottom' style="text-align: center;">
    <input class="btn btn-Default btn-md" style="width: 70px;height: 40px;" type='submit' value='수정'>
    <input class="btn btn-Default btn-md" style="width: 70px;height: 40px;" type='button' onclick="history.back()" value='취소'>
  </DIV>

  </FORM>

</body>
</html>
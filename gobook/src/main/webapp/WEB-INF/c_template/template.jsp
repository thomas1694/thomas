<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
<link href="${root }/bottom/img/gobook_icon.png" type="image/x-icon" rel="shortcut icon" />
<style type="text/css">
		@font-face{font-family:'Nanum SquareR'; src:url('${root }/font/NanumSquareRoundR.ttf')}
 		@font-face{font-family:'Nanum BarunpenR'; src:url('${root }/font/NanumBarunpenR.ttf')}
 		
		#header{
		font-family:'Nanum SquareR';
		}
		h1,h2,h3,h4,h5{
		font-family:'Nanum SquareR';
		}
		#main{
			font-family:'Nanum BarunpenR';
		}
		#footer{
			font-family:'Nanum BarunpenR';
		}
		</style>
</head>
<body>
<tiles:insertAttribute name="sidebar"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="c_footer"/>
</body>
</html>
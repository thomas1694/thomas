<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<!--------------------
LOGIN FORM
by: Amit Jakhu
www.amitjakhu.com
--------------------->

<!--META-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Form</title>

<!--STYLESHEETS-->
<link href="${root}/resources/ksy/css/style.css" rel="stylesheet" type="text/css" />

<!--SCRIPTS-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
	
	$(".google").click(function(){
        $(".span0").animate({
            left: '150px',
        });
    });
	$(".kakao").click(function(){
        $(".span1").animate({
            left: '150px',
        });
    });
	$(".naver").click(function(){
        $(".span2").animate({
            left: '150px',
        });
    });

});
</script>

</head>
<body>
<div id="mw">
<!--WRAPPER-->
<div id="login_wrapper" class="content-box";>
 
	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->
    
    <div class="sns_button">
		<span class="span0"><a href="#"><img src="../images/google.png" class="google" alt="google" /></a></span>
		<span class="span1"><a href="#"><img src="../images/kakao.png" alt="kakao" class="kakao"/></a></span>
		<span class="span2"><a href="#"><img src="../images/naver.png" alt="naver" class="naver"/></a></span>
	</div>

<!--LOGIN FORM-->
<form name="login-form" class="login-form" action="./login" method="post">

	<!--HEADER-->
    <div class="header">
	    <!--TITLE--><h1>로그인</h1><!--END TITLE-->
	    <!--DESCRIPTION-->
	    <span><a href="#" class="hover" style="text-decoration: none">아이디/비밀번호 찾기</a></span>
	    <!--END DESCRIPTION-->
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">
	<!--USERNAME-->
	<input name="id" type="text" class="input username" onfocus="this.value=''" value='${cc_id_val }'/>
		<c:choose>
			<c:when test="${cc_id == 'Y' }">
				<input type='checkbox' name='cc_id' value='Y' checked='checked'/> ID 저장 
			</c:when>
			<c:otherwise>
				<input type='checkbox' name='cc_id' value='Y' /> ID 저장 
			</c:otherwise>
		</c:choose>
	
	<!--END USERNAME-->
    <!--PASSWORD--><input name="passwd" type="password" class="input password" onfocus="this.value=''" /><!--END PASSWORD-->
    </div>
    <!--END CONTENT-->
    
    <!--FOOTER-->
    <div class="footer">
    <!--LOGIN BUTTON--><input type="submit" name="submit" value="Login" class="button" onclick="location.href='./loginForm.jsp'"/><!--END LOGIN BUTTON-->
    <!--REGISTER BUTTON--><input type="submit" name="register" value="Register" class="register" onclick="location.href='./agreement.html'"/><!--END REGISTER BUTTON-->
    </div>
    <!--END FOOTER-->

</form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>JSP</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"/></script>
<script type="text/javascript" src="${root }/resources/pmw/chat/sockjs-0.3.4.js"/></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {

        $("#sendBtn").click(function() {

            sendMessage();

        });

    });

    var sock;

    //웸소켓을 지정한 url로 연결한다.
	
    sock = new SockJS(location.pathname);

    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

    sock.onmessage = onMessage;


    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;


    /* sock.onopen = function(){

        sock.send($("#message").val());

    }; */

    function sendMessage() {

        /*소켓으로 보내겠다.  */
		
        sock.send(location.pathname.split("/")[2]+';'+'${sessionScope.id}'+';'+$("#message").val());

    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

		
    function onMessage(evt) {

        var data = evt.data;
        var arr=null;
        arr=data.split(':');
        var resdata=null;
        
        if(arr[0]=='${sessionScope.id}'){
        	resdata='<div class="media" style="background-color:#E6E212;margin-left:25%;">';
        	resdata+='<div class="media-body">';
        	resdata+='<h4 class="media-heading">'+arr[0]+'</h4>';
        	resdata+='<p>'+arr[1]+'</p>';
        	resdata+='</div>';
        	resdata+='<div class="media-right">';
        	resdata+='<img src="${root }/resources/pmw/chat/img_avatar1.png" class="media-object" style="width:60px">';
        	resdata+='</div>';
        	resdata+='</div>';
        }else{
        	resdata='<div class="media" style="background-color:#ffffff;margin-right:25%;">';
        	resdata+='<div class="media-left">';
        	resdata+='<img src="${root }/resources/pmw/chat/img_avatar2.png" class="media-object" style="width:60px">';
        	resdata+='</div>';
        	resdata+='<div class="media-body">';
        	resdata+='<h4 class="media-heading">'+arr[0]+'</h4>';
        	resdata+='<p>'+arr[1]+'</p>';
        	resdata+='</div>';
        	resdata+='</div>';
        }
        
        
        $("#data").append(resdata+ "<br/>");

        //sock.close();

    }


    function onClose(evt) {
        $("#data").append("연결 끊김");
    }
	
    function enterkey() {
        if (window.event.keyCode == 13) {
 
        	sendMessage();
        	$('#message').val('');
        }
}


</script>

</head>
 
<body style="margin-left: -300px;  background-color: #9FC9E9;">
	<div style="height: 100%;">
    <div class="container"  id="data" style="bottom:10%;position:absolute; overflow:hidden ;">
    </div>
    <div style="height:10%; width:100%; text-align:center; position: absolute; bottom: 0px;">
    <input type="text" id="message" onkeyup="enterkey()"/>
    <input type="button" class="btn btn-success" id="sendBtn" value="전송"  />
    </div>
	</div>


</body>

</html>

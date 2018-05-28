var id, col, word, nowPage;

	id = '${sessionScope.id}';
	col = '';
	word = '';
	nowPage = '';
	 
	$(document).ready(function() {
		mreadchecktotal();
	});
	
	function mreadchecktotal() {
		$.post("/gobook/message/readchecktotal", {
			id: id
		}, function(data, textSt){
			if(data.readchecktotal>0){
				$("#span_count").empty();
				$("#span_count").css("background-color", "#ff6666");
				$("#span_count").append(data.readchecktotal);
			} else {
				$("#span_count").empty();
				$("#span_count").css("background-color", "");
			}
			
		});
	}
	
	function mdecreaserctotal() {
		var rctotal = document.getElementById("span_count").firstChild.nodeValue;
		rctotal--;
		if(rctotal>0) {
			$("#span_count").empty();
			$("#span_count").append(rctotal);
		} else {
			$("#span_count").empty();
			$("#span_count").css("background-color", "");
		}
	}

	function messageop() {
		if($("#message_div").css("display") == "block") {
			$("#message_div").css("display","none");
		} else if($("#message_div").css("display") == "none") {
			$("#message_div").css("display","block");
			mlist(id, col, word, nowPage);
		}
		
	}
	
	function msearchlist() {
		col = $("#col").val();
		word = $("#word").val();
		nowPage = '';
		mlist(id, col, word, nowPage);
	}
	
	function msearchsendlist() {
		col = $("#scol").val();
		word = $("#sword").val();
		nowPage = '';
		msendlist(id, col, word, nowPage);
	}
	
	function newmlist() {
		col = '';
		word = '';
		nowPage = '';
		mlist(id, col, word, nowPage);
	}
	
	function newmsendlist() {
		col = '';
		word = '';
		nowPage = '';
		msendlist(id, col, word, nowPage);
	}
	
	function tomlist() {
		mlist(id, col, word, nowPage);
	}
	
	function tomsendlist() {
		msendlist(id, col, word, nowPage);
	}

	function mlist(id, col, word, nowPage) {
		$.post("/gobook/message/list", { //파라미터 넣는 거 있지 말자... '있는' 데이터로 ㅠㅠ
			id: id,
			col: col,
			word: word,
			nowPage: nowPage
		}, function(data, textSt){
			listdisplay(data);
		});
	}

	function listdisplay(alist) {
		var dtolist = alist[0];
		var info = alist[1];
		
		//쪽지목록
		$("#message_content").empty();
		$("#message_etc").empty();
		$("#message_paging").empty();
		$("#sendlistbtn").css({"background-color":"", "color":"white"});
		$("#createbtn").css({"background-color":"", "color":"white"});
		$("#listbtn").css({"background-color":"#f4f4f4", "color":"#a5a5a5"});
		$("#message_content").append("<tr><th>번호</th><th>보낸아이디</th><th>내용</th><th>날짜</th></tr>");
		if(dtolist.length==0) {
			$("#message_content").append("<td colspan='4'>받은 쪽지가 없습니다.</td>");
		} else {
			for(var i=0;i<dtolist.length;i++) {
				str ="<tr class='list'";
				if(dtolist[i].m_readcheck=='F') {
					str += " style='font-weight:bold'";
				}
				str += "><td>" + dtolist[i].m_num +
					   "</td><td>" + dtolist[i].m_sendid +
					   "</td><td width='200px' nowrap>" +
					   "<a href='javascript:mread(" + dtolist[i].m_num + ")'>" + dtolist[i].m_content + "</a>" +
					   "</td><td>" + dtolist[i].m_wdate + "</td></tr>"
				$("#message_content").append(str);
			}
		}
		
		
		//페이징
		var paging = info.paging;
		$("#message_paging").append(paging);
		
		//검색
		var search = '';
		search += "<select name='col' id='col' style='width:80px;display:inline-block;text-align:center;margin:10px'>";
		search += "<option value='m_sendid'";
		if(info.col=='m_sendid') search += " selected";
		search += ">아이디</option><option value='m_content'";
		if(info.col=='m_content') search += " selected";
		search += ">내용</option></select>";
		search += "<input type='text' id='word' style='width:200px;display:inline-block;' value='"+ info.word +"'>";
		search += "<button type='button'onclick='msearchlist()' style='display:inline-block;margin:10px;'>검색</button>";
		
		$("#message_etc").append(search);
		
		//col, word, nowPage 정보
		col = info.col;
		word = info.word;
		nowPage = info.nowPage;
	}


	function msendlist(id, col, word, nowPage) {
		$.post("/gobook/message/sendlist", {
			id:id,
			col:col,
			word:word,
			nowPage:nowPage
		}, function(data, textSt){
			sendlistdisplay(data);
		});
	}

	function sendlistdisplay(alist) {
		var dtolist = alist[0];
		var info = alist[1];
		
		//쪽지목록
		$("#message_content").empty();
		$("#message_etc").empty();
		$("#message_paging").empty();
		$("#listbtn").css({"background-color":"", "color":"white"});
		$("#createbtn").css({"background-color":"", "color":"white"});
		$("#sendlistbtn").css({"background-color":"#f4f4f4", "color":"#a5a5a5"});
		$("#message_content").append("<tr><th>번호</th><th>받은아이디</th><th>내용</th><th>날짜</th></tr>");
		if(dtolist.length==0) {
			$("#message_content").append("<td colspan='4'>보낸 쪽지가 없습니다.</td>");
		} else {
			var str;
			for(var i=0;i<dtolist.length;i++) {
				str ="<tr class='list'";
				/*if(dtolist[i].m_readcheck=='F') {
					str += " style='font-weight:bold'";
				}*/
				str += "><td>" + dtolist[i].m_num +
					   "</td><td>" + dtolist[i].m_receiveid +
					   "</td><td width='200px' height='70px' style='display: block;text-overflow: ellipsis; overflow: hidden; white-space: nowrap'>" +
					   "<a href='javascript:mread(" + dtolist[i].m_num + ")'>" + dtolist[i].m_content + "</a>" +
					   "</td><td>" + dtolist[i].m_wdate + "</td></tr>"
				$("#message_content").append(str);
			}
		}
		
		
		//페이징
		var paging = info.paging;
		$("#message_paging").append(paging);
		
		//검색
		var search = '';
		search += "<select name='scol' id='scol' style='width:80px;display:inline-block;text-align:center;margin:10px'>";
		search += "<option value='m_receiveid'";
		if(info.col=='m_receiveid') search += " selected";
		search += ">아이디</option><option value='m_content'";
		if(info.col=='m_content') search += " selected";
		search += ">내용</option></select>";
		search += "<input type='text' id='sword' style='width:200px;display:inline-block;' value='"+ info.word +"'>";
		search += "<button type='button'onclick='msearchsendlist()' style='display:inline-block;margin:10px;'>검색</button>";
		
		$("#message_etc").append(search);
		
		//col, word, nowPage 정보
		col = info.col;
		word = info.word;
		nowPage = info.nowPage;
	}
	

	function mread(num) {
		$.post("/gobook/message/read", {
			num:num,
			col:col,
			word:word,
			nowPage:nowPage
		}, function(data, textSt){
			readdisplay(data);
		});
	}

	function readdisplay(alist) {
		var dto = alist[0];
		var info = alist[1];
		
		//쪽지조회
		$("#message_content").empty();
		$("#message_paging").empty();
		$("#message_etc").empty();
		$("#message_content").append("<tr><th>보낸 아이디</th><td>"+ dto.m_sendid +"</td></tr>");
		$("#message_content").append("<tr><th>받은 아이디</th><td>"+ dto.m_receiveid +"</td></tr>");
		$("#message_content").append("<tr><th>날짜</th><td>"+ dto.m_wdate+"</td></tr>");
		$("#message_content").append("<tr><td colspan='2' style='color:#bbe5ea'>내용</th></tr>");
		$("#message_content").append("<tr><td colspan='2' height='150px'><div style='overflow-y:scroll; height:100%; width:100%;'>"+ dto.m_content.replace(/\r\n/gi, "<br>")+"</div></td></tr>");
		var str = "<br><button onclick='";
		if(id==dto.m_receiveid) {
			str += "tomlist()'>목록</button>";
		} else {
			str += "tomsendlist()'>목록</button>";
		}
		$("#message_etc").append(str);
		$("#message_etc").append("<button onclick='mdelete("+dto.m_num+")'>삭제</button>");
		
		//readcheck update
		if(dto.m_readcheck=='F' && dto.m_receiveid==id) {
			mupreadcheck(dto.m_num);
			mdecreaserctotal();
		}

		//col, word, nowPage 정보
		col = info.col;
		word = info.word;
		nowPage = info.nowPage;
	}
	
	function mupreadcheck(num) {
		$.post("/gobook/message/upreadcheck", {
			num: num
		}, function(data, textSt){
			
		});
	}
	
	function mcreateform() {
		$("#message_content").empty();
		$("#message_etc").empty();
		$("#message_paging").empty();
		$("#listbtn").css({"background-color":"", "color":"white"});
		$("#sendlistbtn").css({"background-color":"", "color":"white"});
		$("#createbtn").css({"background-color":"#f4f4f4", "color":"#a5a5a5"});
		$("#message_content").append("<tr><td style='text-align:left'> 받을 아이디</td><tr><td><input type='text' id='msgid' required></td><tr>");
		$("#message_content").append("<tr><td style='text-align:left'> 내용</td><tr><td><textarea cols='50' rows='7' id='msgcontent' required></textarea></td><tr>");
		$("#message_etc").append("<button type='button' onclick='mcreateproc()'>보내기</button>");		
	}
	
	function mcreateproc() {
		sendid = id;
		receiveid = $("#msgid").val();
		content = $("#msgcontent").val();
		
		if(receiveid==''||content=='') {
			alert("보낼 아이디와 내용을 입력해 주세요.");
			return;
		}
		
		if(receiveid==sendid) {
			alert("자기 자신에게 쪽지를 보낼 수 없습니다.");
			return;
		}


		
		
		$.post("/gobook/message/create", {
			sid: sendid,
			rid: receiveid,
			content: content
		}, function(data, textSt){
			if(textSt=='success'&&data.flag==true) {
				(function(){
					$("#message_content").empty();
					$("#message_etc").empty();
					$("#message_etc").append("<span>쪽지를 보냈습니다.</span><br>");
					$("#message_etc").append("<button type='button' onclick='mcreateform()'>확인</button>");
				})();
			} else {
				(function(){
					$("#message_content").empty();
					$("#message_etc").empty();
					$("#message_etc").append("<span>쪽지를 보내기에 실패했습니다.</span><br>");
					$("#message_etc").append("<button type='button' onclick='mcreateform()'>확인</button>");
				})();
			}
		});
	}
	
	function mdelete(num) {
		if(confirm("정말로 삭제하시겠습니까?")) {
			$.post("/gobook/message/delete", {
				num: num,
				id: id,
				col: col,
				word: word,
				nowPage: nowPage
			}, function(data, textSt){
				if(textSt=='success'&&data.flag==true) {
					(function(){
						$("#message_content").empty();
						$("#message_etc").empty();
						$("#message_etc").append("<span>쪽지를 삭제했습니다.</span><br>");
						if(data.sendidflag) {
							$("#message_etc").append("<button type='button' onclick='tomsendlist()'>확인</button>");
							snowPage = data.nowPage;
						} else {
							$("#message_etc").append("<button type='button' onclick='tomlist()'>확인</button>");
							nowPage = data.nowPage;
						}
						
					})();
				} else {
					(function(){
						$("#message_content").empty();
						$("#message_etc").empty();
						$("#message_etc").append("<span>쪽지를 삭제하기에 실패했습니다.</span><br>");
						$("#message_etc").append("<button type='button' onclick='tomlist()'>확인</button>");
					})();
				}
			});
		} else {
			return;
		}
	}
	
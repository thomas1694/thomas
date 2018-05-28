package spring.utility.gobook;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList=new ArrayList<>();
	private String SID=null;
	private String room=null;

	private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}
	
	/**
	 * 클라이언트 연결 이후에 실행되는 메소드
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map map = session.getAttributes();
		SID=(String)map.get("id");
		room=(String)map.get("chatroom");
		sessionList.add(session);
		logger.info("{} 연결됨", SID);
		System.out.println(SID+" 연결됨");
		TextMessage message=new TextMessage(room+";"+SID+";"+SID+"님이 채팅방에 접속했습니다.");
		handleTextMessage(session,message); 
	}
	
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
	}
	
	/**
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(),message.getPayload());
		System.out.println(SID+"로 부터 "+message.getPayload()+" 받음");
		if(SID==null)SID="비회원";
		String ms[]=message.getPayload().split(";");
		
		for(WebSocketSession sess : sessionList) {
			//C회원이 S회원에게 보낼때
			if(ms[0].equals(sess.getAttributes().get("chatroom"))) {
				
			sess.sendMessage(new TextMessage(ms[1]+":"+ms[2]));
			}
		}
		
	}
	
	@Override
	protected void handlePongMessage(WebSocketSession session, PongMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handlePongMessage(session, message);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}
	
	/**
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		TextMessage message=new TextMessage("접속을 종료했습니다.");
		sessionList.remove(session);
		handleTextMessage(session,message); 
		logger.info("{} 연결 끊김.", session.getId());
		System.out.println("채팅 퇴장자 : "+ session.getId());
		
	}
	

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return super.supportsPartialMessages();
	}
	
	
}

package com.rainbow.um.socket;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component(value="wsChat.do")
public class MySocketHandler extends TextWebSocketHandler{


	Logger logger = LoggerFactory.getLogger(MySocketHandler.class);
	
	private ArrayList<WebSocketSession> list ; //webSocket session

	public MySocketHandler() {
		list = new ArrayList<WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("afterConnectionEstablished()");
		super.afterConnectionEstablished(session);
		list.add(session);	//
		System.out.println("client session cnt : "+list.size()); 
		System.out.println("session connected : "+session.getId());
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("handleTextMessage()");
		String msg = message.getPayload();
		if( msg != null && !msg.equals("") ) {
			for(WebSocketSession s : list) {
					s.sendMessage(new TextMessage(msg));
				}
			}
		}

	@Override
	public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception {
		logger.info("afterConnectionClosed()");
		super.afterConnectionClosed(session, status);
		list.remove(session);

	}
}

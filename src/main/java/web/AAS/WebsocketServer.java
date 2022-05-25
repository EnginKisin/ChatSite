package web.AAS;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import jakarta.websocket.EncodeException;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class WebsocketServer {
	private static final Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String message , Session client) throws IOException , EncodeException{
		
			Iterator<Session> iterator = clients.iterator();
			while(iterator.hasNext()) {
				String test = message;
				iterator.next().getBasicRemote().sendText(test);
			
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}

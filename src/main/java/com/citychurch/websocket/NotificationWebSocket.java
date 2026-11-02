package com.citychurch.websocket;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/notifications")
public class NotificationWebSocket {

    // Store connected clients
    private static final Set<Session> clients =
            new CopyOnWriteArraySet<>();


    // ==========================================
    // WHEN CLIENT CONNECTS
    // ==========================================

    @OnOpen
    public void onOpen(Session session) {

        clients.add(session);

        System.out.println(
                "WebSocket client connected: "
                + session.getId()
        );

        try {

            session.getBasicRemote().sendText(
                    "Connected to City Church Notification System."
            );

        } catch (IOException e) {

            e.printStackTrace();
        }
    }


    // ==========================================
    // RECEIVE MESSAGE
    // ==========================================

    @OnMessage
    public void onMessage(
            String message,
            Session session) {

        System.out.println(
                "Message received: " + message
        );

        broadcastMessage(message);
    }


    // ==========================================
    // WHEN CLIENT DISCONNECTS
    // ==========================================

    @OnClose
    public void onClose(Session session) {

        clients.remove(session);

        System.out.println(
                "WebSocket client disconnected: "
                + session.getId()
        );
    }


    // ==========================================
    // BROADCAST MESSAGE
    // ==========================================

    public static void broadcastMessage(
            String message) {

        for (Session session : clients) {

            if (session.isOpen()) {

                try {

                    session.getBasicRemote()
                            .sendText(message);

                } catch (IOException e) {

                    e.printStackTrace();
                }
            }
        }
    }
}

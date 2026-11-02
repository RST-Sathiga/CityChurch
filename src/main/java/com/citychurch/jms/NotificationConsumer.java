package com.citychurch.jms;

import com.citychurch.websocket.NotificationWebSocket;
import jakarta.annotation.Resource;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.JMSConsumer;
import jakarta.jms.Queue;

public class NotificationConsumer {

    @Resource(lookup = "jms/CityChurchConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/CityChurchNotificationQueue")
    private Queue notificationQueue;

    public void receiveNotification() {
        try (JMSContext context =
                connectionFactory.createContext()) {
            JMSConsumer consumer =
                    context.createConsumer(notificationQueue);

            String message = consumer.receiveBody(
                    String.class,
                    5000
            );
            if (message != null) {

                System.out.println(
                        "Notification received from JMS: "
                        + message
                );
                NotificationWebSocket.broadcastMessage(message);
            }
        }
    }
}
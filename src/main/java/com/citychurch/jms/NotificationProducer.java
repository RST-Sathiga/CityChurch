package com.citychurch.jms;

import jakarta.annotation.Resource;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.Queue;

public class NotificationProducer {

    @Resource(lookup = "jms/CityChurchConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/CityChurchNotificationQueue")
    private Queue notificationQueue;

    public void sendNotification(String message) {

        try (JMSContext context =
                connectionFactory.createContext()) {

            context.createProducer()
                    .send(notificationQueue, message);

            System.out.println(
                    "Notification sent to JMS queue: "
                    + message
            );

        }
    }
}
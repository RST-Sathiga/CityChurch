package com.citychurch.storage;

import com.citychurch.model.Notification;
import java.util.ArrayList;
import java.util.List;

public class NotificationStore {

    private static final List<Notification> notifications = new ArrayList<>();

    private static int nextId = 1;

    // Add a new notification
    public static synchronized void addNotification(
            String title,
            String message,
            String sender) {

        Notification notification = new Notification(
                nextId++,
                title,
                message,
                sender
        );

        notifications.add(notification);
    }

    // Get all notifications
    public static synchronized List<Notification> getNotifications() {
        return new ArrayList<>(notifications);
    }
}
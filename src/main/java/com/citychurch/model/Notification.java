package com.citychurch.model;

import java.time.LocalDateTime;

public class Notification {

    private int id;
    private String title;
    private String message;
    private String sender;
    private LocalDateTime dateTime;

    public Notification(int id, String title, String message, String sender) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.sender = sender;
        this.dateTime = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getMessage() {
        return message;
    }

    public String getSender() {
        return sender;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }
}
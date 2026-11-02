package com.citychurch.storage;

import com.citychurch.model.User;
import java.util.ArrayList;
import java.util.List;

public class UserStore {

    // Stores registered users in memory
    private static final List<User> users = new ArrayList<>();


    // Check whether a username already exists
    public static synchronized boolean usernameExists(String username) {

        if (username == null) {
            return false;
        }

        for (User user : users) {

            if (user.getUsername().equalsIgnoreCase(username)) {
                return true;
            }
        }

        return false;
    }


    // Add a new user
    public static synchronized boolean addUser(User user) {

        if (user == null) {
            return false;
        }

        if (usernameExists(user.getUsername())) {
            return false;
        }

        users.add(user);

        return true;
    }

    public static synchronized User authenticate(
            String username,
            String password) {
        if (username == null || password == null) {
            return null;
        }
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)
                    && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}
package com.citychurch.servlet;

import com.citychurch.model.User;
import com.citychurch.storage.UserStore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        System.out.println("USERNAME: " + username);
        System.out.println("PASSWORD: " + password);
        System.out.println("ROLE: " + role);

        if (username == null || username.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/index.html");
            return;
        }

        if (password == null || password.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/index.html");
            return;
        }

        if (role == null || role.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/index.html");
            return;
        }

        username = username.trim();
        role = role.trim();

        // Create the user
        User user = new User(username, password, role);

        // Add user to UserStore
        boolean added = UserStore.addUser(user);

        if (added) {

            // Registration successful
            response.sendRedirect(
                    request.getContextPath()
                    + "/success.jsp"
            );

        } else {

            // Username already exists
            response.sendRedirect(
                    request.getContextPath()
                    + "/index.html"
            );
        }
    }
}
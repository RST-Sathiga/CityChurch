package com.citychurch.servlet;

import com.citychurch.model.User;
import com.citychurch.storage.NotificationStore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/send-notification")
public class NotificationServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get the existing session
        HttpSession session = request.getSession(false);

        // Check if the user is logged in
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

            return;
        }

        // Get the logged-in user
        User user = (User) session.getAttribute("user");

        // Check that the user is a church leader
        boolean isLeader =
                "LEADER".equals(user.getRole())
                || "CHURCH_LEADER".equals(user.getRole());

        if (!isLeader) {

            response.sendRedirect(
                    request.getContextPath() + "/home.jsp"
            );

            return;
        }

        // Get notification title and message
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        // Remove unnecessary spaces
        if (title != null) {
            title = title.trim();
        }

        if (message != null) {
            message = message.trim();
        }

        // Check that both fields were completed
        if (title == null || title.isEmpty()
                || message == null || message.isEmpty()) {

            request.setAttribute(
                    "error",
                    "Please enter a notification title and message."
            );

            request.getRequestDispatcher(
                    "/send-notification.jsp"
            ).forward(request, response);

            return;
        }

        // Save the notification
        NotificationStore.addNotification(
                title,
                message,
                user.getUsername()
        );

        // Redirect to success page
        response.sendRedirect(
                request.getContextPath()
                + "/notification-success.jsp"
        );
    }
}
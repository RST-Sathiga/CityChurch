package com.citychurch.servlet;

import com.citychurch.model.User;
import com.citychurch.storage.UserStore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null) {
            username = username.trim();
        }
        if (username == null || username.isEmpty()) {

            request.setAttribute(
                    "error",
                    "Please enter your username."
            );
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute(
                    "error",
                    "Please enter your password."
            );
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);

            return;
        }
        User user = UserStore.authenticate(
                username,
                password
        );
        if (user != null) {
            HttpSession session = request.getSession(true);
            
            session.setAttribute("user", user);
            
            session.setAttribute("role", user.getRole());

            response.sendRedirect(
                    request.getContextPath()
                    + "/home.jsp"
            );
        } else {


            // ======================================
            // 2.4 ERROR RESPONSE
            // ======================================

            request.setAttribute(
                    "error",
                    "Invalid username or password."
            );
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }
    }
}
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    boolean isLeader =
        "LEADER".equals(user.getRole())
        || "CHURCH_LEADER".equals(user.getRole());
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>City Church - Home</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7f9;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 100%;
            max-width: 500px;

            background: white;

            border-radius: 12px;

            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);

            overflow: hidden;
        }

        .header {
            background: #19b5d1;
            color: white;
            text-align: center;
            padding: 30px;
        }

        .header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .header p {
            font-size: 16px;
        }

        .content {
            padding: 35px;
        }

        h2 {
            text-align: center;
            color: #19a9c4;
            margin-bottom: 25px;
        }

        .welcome {
            background: #f4f7f9;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 18px;
            margin-bottom: 25px;
            text-align: center;
        }

        .welcome p {
            color: #555;
            margin-bottom: 8px;
        }

        .username,
        .role {
            font-weight: bold;
            color: #19a9c4;
        }

        .notification-box {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background: white;
            min-height: 120px;
            margin-bottom: 20px;
        }

        .notification-title {
            font-weight: bold;
            color: #19a9c4;
            margin-bottom: 15px;
            text-align: center;
        }

        #notificationArea {
            color: #777;
            text-align: center;
        }

        .button {
            display: block;
            width: 100%;
            padding: 14px;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            margin-top: 12px;
        }

        .manage-button {
            background: #1f2937;
        }

        .manage-button:hover {
            background: #374151;
        }

        .send-button {
            background: #19b5d1;
        }

        .send-button:hover {
            background: #139ab3;
        }

        .logout-button {
            background: #777;
        }

        .logout-button:hover {
            background: #555;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="header">

        <h1>City Church</h1>

        <p>Notification System</p>

    </div>

    <div class="content">

        <h2>Home</h2>

        <div class="welcome">

            <p>
                Welcome,
                <span class="username">
                    <%= user.getUsername() %>
                </span>
            </p>

            <p>
                Role:
                <span class="role">
                    <%= user.getRole() %>
                </span>
            </p>

        </div>


        <!-- NOTIFICATIONS -->

        <div class="notification-box">

            <div class="notification-title">
                Notifications
            </div>

            <div id="notificationArea">

                <p id="emptyMessage">
                    No notifications received yet.
                </p>

            </div>

        </div>


        <!-- LEADER FUNCTIONS -->

        <% if (isLeader) { %>

            <!-- MANAGE NOTIFICATIONS -->

            <a
                href="${pageContext.request.contextPath}/notification.jsp"
                class="button manage-button">

                Manage Notifications

            </a>


            <!-- SEND NOTIFICATION -->

            <a
                href="${pageContext.request.contextPath}/send-notification.jsp"
                class="button send-button">

                Send Notification

            </a>

        <% } %>


        <!-- LOGOUT -->

        <a
            href="${pageContext.request.contextPath}/login.jsp"
            class="button logout-button">

            Logout

        </a>

    </div>

</div>

</body>

</html>
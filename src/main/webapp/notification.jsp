<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.model.User"%>

<%
    User user = (User) session.getAttribute("user");

    // User must be logged in
    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }

    // Only Church Leaders can access this page
    if (!"CHURCH_LEADER".equals(user.getRole())) {
        response.sendRedirect(
            request.getContextPath() + "/home.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>City Church - Notifications</title>

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

            box-shadow:
                0 5px 20px rgba(0, 0, 0, 0.15);

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

        .user-info {
            background: #f4f7f9;

            border: 1px solid #e0e0e0;

            border-radius: 8px;

            padding: 15px;

            margin-bottom: 20px;

            text-align: center;

            color: #555;
        }

        .role {
            color: #19a9c4;
            font-weight: bold;
        }

        .notification-area {
            border: 1px solid #ddd;

            border-radius: 8px;

            padding: 20px;

            min-height: 150px;

            background: #fafafa;

            margin-bottom: 20px;
        }

        .empty {
            text-align: center;
            color: #777;
        }

        .notification {
            background: #e8f8fb;

            border-left: 4px solid #19b5d1;

            padding: 12px;

            margin-bottom: 10px;

            border-radius: 5px;

            color: #333;
        }

        .button {
            display: block;

            width: 100%;

            padding: 14px;

            background: #19b5d1;

            color: white;

            border: none;

            border-radius: 25px;

            font-size: 16px;

            font-weight: bold;

            text-align: center;

            text-decoration: none;

            cursor: pointer;
        }

        .button:hover {
            background: #139ab3;
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

        <h2>Notifications</h2>

        <div class="user-info">

            Logged in as:

            <strong>
                <%= user.getUsername() %>
            </strong>

            <br>

            Role:

            <span class="role">
                <%= user.getRole() %>
            </span>

        </div>

        <div
            class="notification-area"
            id="notificationArea">

            <p
                class="empty"
                id="emptyMessage">

                No notifications available.

            </p>

        </div>

        <a
            href="${pageContext.request.contextPath}/home.jsp"
            class="button">

            Back to Home

        </a>

    </div>

</div>

</body>

</html>
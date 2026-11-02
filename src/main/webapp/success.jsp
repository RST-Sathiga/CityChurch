<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.citychurch.model.User"%>

<%
    // Retrieve the authenticated user from the HTTP session
    User user = (User) session.getAttribute("user");

    // If there is no authenticated user, return to the login page
    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
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

    <title>City Church - Login Successful</title>

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

            padding: 25px;
        }

        .header h1 {
            margin-bottom: 8px;
        }

        .content {
            padding: 35px;

            text-align: center;
        }

        h2 {
            color: #19a9c4;

            margin-bottom: 20px;
        }

        .success-icon {
            width: 70px;
            height: 70px;

            margin: 0 auto 20px;

            background: #19b5d1;

            color: white;

            border-radius: 50%;

            display: flex;
            justify-content: center;
            align-items: center;

            font-size: 40px;
            font-weight: bold;
        }

        .success-message {
            background: #d4edda;

            color: #155724;

            border: 1px solid #c3e6cb;

            padding: 15px;

            border-radius: 6px;

            margin-bottom: 25px;
        }

        .user-details {
            background: #f4f7f9;

            border-radius: 8px;

            padding: 20px;

            margin-bottom: 25px;

            text-align: left;
        }

        .user-details p {
            margin-bottom: 10px;

            color: #333;
        }

        .user-details p:last-child {
            margin-bottom: 0;
        }

        .label {
            font-weight: bold;

            color: #19a9c4;
        }

        .button {
            display: inline-block;

            width: 100%;

            padding: 14px;

            background: #19b5d1;

            color: white;

            border: none;

            border-radius: 25px;

            font-size: 17px;

            font-weight: bold;

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

        <div class="success-icon">
            ✓
        </div>


        <h2>
            Login Successful
        </h2>


        <div class="success-message">

            Welcome,
            <strong><%= user.getUsername() %></strong>!

            <br>

            You have successfully logged into the City Church
            Notification System.

        </div>


        <div class="user-details">

            <p>
                <span class="label">
                    Username:
                </span>

                <%= user.getUsername() %>
            </p>


            <p>
                <span class="label">
                    Role:
                </span>

                <%= user.getRole() %>
            </p>

        </div>


        <a
            href="${pageContext.request.contextPath}/index.jsp"
            class="button">

            Continue

        </a>

    </div>

</div>

</body>

</html>
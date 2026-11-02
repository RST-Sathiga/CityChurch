<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>City Church - Login</title>

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
        }

        h2 {
            text-align: center;
            color: #19a9c4;
            margin-bottom: 25px;
        }

        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 20px;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .button {
            width: 100%;
            padding: 14px;
            background: #19b5d1;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .button:hover {
            background: #139ab3;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: #19a9c4;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
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

        <h2>Login</h2>

        <%-- Successful registration message --%>
        <% if (request.getAttribute("success") != null) { %>
            <div class="success">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>

        <%-- Login error message --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="POST">

            <div class="form-group">
                <label for="username">Username</label>

                <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required>
            </div>

            <button type="submit" class="button">
                Login
            </button>

        </form>

        <div class="register-link">
            Don't have an account?

            <a href="${pageContext.request.contextPath}/registration.jsp">
                Register
            </a>
        </div>

    </div>

</div>

</body>
</html>
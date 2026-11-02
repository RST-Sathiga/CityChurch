<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>City Church - Registration</title>

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

        /* =========================
           HEADER
           ========================= */

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

        /* =========================
           CONTENT
           ========================= */

        .content {
            padding: 35px;
        }

        h2 {
            text-align: center;

            color: #19a9c4;

            margin-bottom: 25px;
        }

        /* =========================
           MESSAGES
           ========================= */

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

        /* =========================
           FORM
           ========================= */

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;

            font-weight: bold;

            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;

            padding: 13px;

            border: 1px solid #ccc;

            border-radius: 6px;

            font-size: 15px;

            background: white;
        }

        input:focus,
        select:focus {
            outline: none;

            border-color: #19b5d1;

            box-shadow:
                0 0 0 2px rgba(25, 181, 209, 0.15);
        }

        /* =========================
           REGISTER BUTTON
           ========================= */

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

        /* =========================
           LOGIN LINK
           ========================= */

        .login-link {
            text-align: center;

            margin-top: 20px;

            color: #555;
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

    <!-- HEADER -->

    <div class="header">

        <h1>City Church</h1>

        <p>Notification System</p>

    </div>


    <!-- CONTENT -->

    <div class="content">

        <h2>Create Account</h2>


        <!-- SUCCESS MESSAGE -->

        <% if (request.getAttribute("success") != null) { %>

            <div class="success">

                <%= request.getAttribute("success") %>

            </div>

        <% } %>


        <!-- ERROR MESSAGE -->

        <% if (request.getAttribute("error") != null) { %>

            <div class="error">

                <%= request.getAttribute("error") %>

            </div>

        <% } %>


        <!-- REGISTRATION FORM -->

        <form
            action="${pageContext.request.contextPath}/register"
            method="POST">


            <!-- USERNAME -->

            <div class="form-group">

                <label for="username">
                    Username
                </label>

                <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    required>

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required>

            </div>


            <!-- ROLE -->

            <div class="form-group">

                <label for="role">
                    Role
                </label>

                <select
                    id="role"
                    name="role"
                    required>

                    <option value=""disabled selected>
                        Select Role
                    </option>

                    <option value="MEMBER">
                        Church Member
                    </option>

                    <option value="CHURCH_LEADER">
                        Church Leader
                    </option>

                </select>

            </div>


            <!-- REGISTER -->

            <button
                type="submit"
                class="button">

                Register

            </button>

        </form>


        <!-- LOGIN LINK -->

        <div class="login-link">

            Already have an account?

            <a href="${pageContext.request.contextPath}/login.jsp">
                Login
            </a>

        </div>

    </div>

</div>

</body>

</html>
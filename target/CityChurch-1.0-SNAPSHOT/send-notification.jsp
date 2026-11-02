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

    if (!isLeader) {
        response.sendRedirect(
            request.getContextPath() + "/home.jsp"
        );
        return;
    }  
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Send Notification - City Church</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e4e7eb);
            min-height: 100vh;
        }

        .header {
            background-color: #1f2937;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            margin: 0;
        }

        .header span {
            font-size: 14px;
        }

        .container {
            width: 90%;
            max-width: 650px;
            margin: 50px auto;
        }

        .notification-card {
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.12);
        }

        .notification-card h1 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 10px;
            color: #1f2937;
        }

        .description {
            text-align: center;
            color: #6b7280;
            margin-bottom: 30px;
        }

        .error {
            background-color: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #374151;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 13px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 15px;
            font-family: Arial, sans-serif;
            outline: none;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #1f2937;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        .send-button {
            width: 100%;
            padding: 14px;
            background-color: #1f2937;
            color: white;
            border: none;
            border-radius: 7px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .send-button:hover {
            background-color: #374151;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #1f2937;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .leader-info {
            background-color: #f3f4f6;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 25px;
            color: #4b5563;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <!-- Header -->
    <div class="header">

        <h2>City Church</h2>

        <span>
            Logged in as Leader:
            <strong><%= user.getUsername() %></strong>
        </span>

    </div>

    <!-- Main Content -->
    <div class="container">

        <div class="notification-card">

            <h1>Send Notification</h1>

            <p class="description">
                Send an important message to City Church members.
            </p>

            <!-- Leader information -->
            <div class="leader-info">
                <strong>Leader:</strong>
                <%= user.getUsername() %>
            </div>

            <!-- Display error message if one exists -->
            <% if (request.getAttribute("error") != null) { %>

                <div class="error">
                    <%= request.getAttribute("error") %>
                </div>

            <% } %>

            <!-- Notification Form -->
            <form action="${pageContext.request.contextPath}/send-notification"
                  method="post">

                <!-- Notification Title -->
                <div class="form-group">

                    <label for="title">
                        Notification Title
                    </label>

                    <input type="text"
                           id="title"
                           name="title"
                           placeholder="Enter notification title"
                           maxlength="100"
                           required>

                </div>

                <!-- Notification Message -->
                <div class="form-group">

                    <label for="message">
                        Notification Message
                    </label>

                    <textarea id="message"
                              name="message"
                              placeholder="Enter your message for church members..."
                              maxlength="1000"
                              required></textarea>

                </div>

                <!-- Submit Button -->
                <button type="submit" class="send-button">
                    Send Notification
                </button>

            </form>

            <!-- Back Button -->
            <a class="back-link"
               href="${pageContext.request.contextPath}/home.jsp">
                ? Back to Home
            </a>

        </div>

    </div>

</body>
</html>

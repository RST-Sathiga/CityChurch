<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notification Sent - City Church</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e4e7eb);
            margin: 0;
            padding: 60px;
            text-align: center;
        }

        .success-box {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }

        h1 {
            color: #1f2937;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #1f2937;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .button:hover {
            background-color: #374151;
        }
    </style>
</head>

<body>

<div class="success-box">

    <h1>Notification Sent Successfully!</h1>

    <p>
        Your notification has been sent to the church members.
    </p>

    <a class="button"
       href="${pageContext.request.contextPath}/home.jsp">
        Return to Home
    </a>

</div>

</body>
</html>
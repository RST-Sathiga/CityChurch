<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>City Church - WebSocket Messaging</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;

            background: #f4f7f9;

            min-height: 100vh;

            display: flex;

            justify-content: center;

            align-items: center;

            margin: 0;
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

            padding: 25px;
        }

        .header h1 {

            margin: 0 0 8px 0;
        }

        .content {

            padding: 30px;
        }

        h2 {

            text-align: center;

            color: #19a9c4;

            margin-bottom: 20px;
        }

        #status {

            padding: 12px;

            background: #f4f7f9;

            border-radius: 6px;

            text-align: center;

            margin-bottom: 20px;

            color: #333;
        }

        input {

            width: 100%;

            padding: 13px;

            border: 1px solid #ccc;

            border-radius: 6px;

            font-size: 15px;

            margin-bottom: 15px;
        }

        button {

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

        button:hover {

            background: #139ab3;
        }

        #messages {

            margin-top: 20px;

            background: #f4f7f9;

            padding: 15px;

            border-radius: 6px;

            min-height: 80px;
        }

        .message {

            background: white;

            padding: 10px;

            margin-bottom: 8px;

            border-radius: 5px;

            border-left: 4px solid #19b5d1;
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

        <h2>
            WebSocket Messaging
        </h2>


        <div id="status">
            Connecting...
        </div>


        <input
            type="text"
            id="message"
            placeholder="Enter notification message">


        <button onclick="sendMessage()">

            Send Notification

        </button>


        <div id="messages">

        </div>

    </div>

</div>


<script>

    let socket;


    // Determine WebSocket protocol

    const protocol =
        window.location.protocol === "https:"
        ? "wss:"
        : "ws:";


    // Get project context path

    const contextPath =
        "${pageContext.request.contextPath}";


    // Connect to WebSocket

    socket = new WebSocket(

        protocol
        + "//"
        + window.location.host
        + contextPath
        + "/notifications"

    );


    // ==========================================
    // CONNECTION OPENED
    // ==========================================

    socket.onopen = function() {

        document.getElementById("status").innerText =
            "Connected to City Church WebSocket.";

    };


    // ==========================================
    // MESSAGE RECEIVED
    // ==========================================

    socket.onmessage = function(event) {

        const messages =
            document.getElementById("messages");


        const message =
            document.createElement("div");


        message.className = "message";


        message.innerText =
            event.data;


        messages.appendChild(message);

    };


    // ==========================================
    // CONNECTION CLOSED
    // ==========================================

    socket.onclose = function() {

        document.getElementById("status").innerText =
            "WebSocket connection closed.";

    };


    // ==========================================
    // CONNECTION ERROR
    // ==========================================

    socket.onerror = function() {

        document.getElementById("status").innerText =
            "WebSocket connection error.";

    };


    // ==========================================
    // SEND MESSAGE
    // ==========================================

    function sendMessage() {

        const input =
            document.getElementById("message");


        const message =
            input.value.trim();


        if (
            message !== ""
            && socket.readyState === WebSocket.OPEN
        ) {

            socket.send(message);

            input.value = "";

        }

    }

</script>

</body>

</html>
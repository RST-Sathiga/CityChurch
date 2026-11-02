<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>City Church Notification System</title>

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
            padding: 25px 20px;
        }

        .header h1 {
            font-size: 26px;
            margin-bottom: 8px;
        }

        .header p {
            font-size: 14px;
        }

        .content {
            padding: 35px;
        }

        .content h2 {
            text-align: center;
            color: #19a9c4;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #19b5d1;
            box-shadow: 0 0 5px rgba(25, 181, 209, 0.3);
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
            margin-top: 10px;
        }

        .button:hover {
            background: #139ab3;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
            font-size: 14px;
        }

        .login-link a {
            color: #19a9c4;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background: #f1f1f1;
            color: #777;
            font-size: 12px;
        }

        .required {
            color: red;
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

        <h2>Create Account</h2>

        <!-- Registration Form -->
        <form action="register" method="POST">

            <div class="form-group">
                <label for="username">
                    Username <span class="required">*</span>
                </label>

                <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    required>
            </div>

            <div class="form-group">
                <label for="password">
                    Password <span class="required">*</span>
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required>
            </div>

            <div class="form-group">
                <label for="role">
                    User Role <span class="required">*</span>
                </label>

                <select id="role" name="role" required>
                    <option value="">Select your role</option>
                    <option value="MEMBER">Church Member</option>
                    <option value="LEADER">Church Leader</option>
                </select>
            </div>

            <button type="submit" class="button">
                Register
            </button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.html">Login</a>
        </div>

    </div>

    <div class="footer">
        City Church Notification System
    </div>

</div>

</body>
</html>
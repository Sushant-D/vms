<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
        }
        
        .container {
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            max-width: 600px;
            padding: 30px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #d9534f;
        }
        
        .icon {
            font-size: 60px;
            color: #d9534f;
            margin-bottom: 20px;
        }
        
        .message {
            margin: 20px 0;
            font-size: 18px;
            line-height: 1.5;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #337ab7;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            margin-top: 20px;
        }
        
        .btn:hover {
            background-color: #286090;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">&#x26D4;</div>
        <h1>Access Denied</h1>
        <div class="message">
            Sorry, you do not have permission to access this page. This area is restricted to users with appropriate roles only.
        </div>
        <a href="<%= request.getContextPath() %>/" class="btn">Go to Home</a>
    </div>
</body>
</html>
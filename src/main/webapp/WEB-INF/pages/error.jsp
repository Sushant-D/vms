// Path: src/main/webapp/WEB-INF/pages/error.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .error-icon {
            font-size: 50px;
            color: #dc3545;
            margin-bottom: 20px;
        }
        .error-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        .error-message {
            color: #666;
            margin-bottom: 20px;
        }
        .back-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s;
        }
        .back-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">&#9888;</div>
        <h1 class="error-title">Oops! Something went wrong</h1>
        <p class="error-message">
            We're sorry, but there was an error processing your request.
            <% if(response.getStatus() == 404) { %>
                The page you are looking for might have been removed or is temporarily unavailable.
            <% } else { %>
                Please try again later or contact support if the problem persists.
            <% } %>
        </p>
        <a href="${pageContext.request.contextPath}/" class="back-link">Go to Home</a>
    </div>
    
    <div class="footer">
        Copyright @2025
    </div>
</body>
</html>
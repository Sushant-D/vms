<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.islington.model.User" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            border: 2px solid black;
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            padding: 20px 0;
        }
        
        .navbar {
            background-color: #ddd;
            padding: 15px 0;
            display: flex;
            justify-content: space-around;
        }
        
        .navbar a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }
        
        .stats-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        
        .stat-box {
            border: 1px solid #ccc;
            width: 30%;
            text-align: center;
            padding: 20px 0;
        }
        
        .stat-number {
            font-size: 48px;
            margin: 0;
        }
        
        .stat-label {
            font-size: 20px;
            margin-top: 10px;
        }
        
        .events-section {
            padding: 0 20px 20px 20px;
        }
        
        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .event-card {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .event-details h2 {
            margin-top: 0;
            margin-bottom: 10px;
        }
        
        .event-details p {
            margin: 5px 0;
            font-size: 16px;
        }
        
        .apply-btn {
            background-color: #7b68ee;
            color: white;
            border: none;
            padding: 10px 30px;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>User Dashboard</h1>
        </div>
        
        <div class="navbar">
            <a href="#">Dashboard</a>
            <a href="#">Available Events</a>
            <a href="#">My Applications</a>
            <a href="#">Profile</a>
            <a href="<%= request.getContextPath() %>/logout">Logout</a>
        </div>
        
        <div class="stats-container">
            <div class="stat-box">
                <p class="stat-number">5</p>
                <p class="stat-label">Total Events</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">3</p>
                <p class="stat-label">Applied Events</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">2</p>
                <p class="stat-label">Approved</p>
            </div>
        </div>
        
        <div class="events-section">
            <div class="section-title">Available Events</div>
            
            <div class="event-card">
                <div class="event-details">
                    <h2>Community Cleanup</h2>
                    <p>Date: May 15, 2025 | Location: City Park</p>
                    <p>Volunteers needed: 10</p>
                </div>
                <button class="apply-btn">Apply</button>
            </div>
            
            <div class="event-card">
                <div class="event-details">
                    <h2>Food Drive</h2>
                    <p>Date: June 1, 2025 | Location: Community Center</p>
                    <p>Volunteers needed: 8</p>
                </div>
                <button class="apply-btn">Apply</button>
            </div>
        </div>
    </div>
</body>
</html>

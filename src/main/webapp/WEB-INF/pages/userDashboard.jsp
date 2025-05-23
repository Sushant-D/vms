<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.islington.model.User" %>
<%
    // Check if user is logged in - this is now redundant because of HomeController check,
    // but keeping it for additional security layer
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    
    // Get user from session
    User user = (User) session.getAttribute("user");
    
    // Check if user has volunteer role - this is now redundant because of HomeController check,
    // but keeping it for additional security layer
    if (!"volunteer".equals(user.getUserRole())) {
        response.sendRedirect(request.getContextPath() + "/access-denied.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Volunteer Dashboard</title>
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
        
        .welcome-message {
            padding: 10px 20px;
            background-color: #f0f0f0;
            margin: 0 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Volunteer Dashboard</h1>
        </div>
        
        <div class="welcome-message">
            <p>Welcome, <%= user.getFirstName() %> <%= user.getLastName() %>!</p>
        </div>
        
        <div class="navbar">
            <a href="<%= request.getContextPath() %>/user-dashboard">Dashboard</a>
            <a href="<%= request.getContextPath() %>/apply-volunteer">Available Events</a>
            <a href="#">My Applications</a>
            <a href="#">Profile</a>
            <a href="<%= request.getContextPath() %>/logout">Logout</a>
        </div>
        <div style="background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; padding: 15px 20px; margin: 20px; border-radius: 5px;">
    Your application for <strong>Blood Donation Camp</strong> as a volunteer has been <strong>approved</strong> by Admin. Be prepared for <strong>May 30, 2025</strong>. Congratulations!
</div>
        <div class="stats-container">
            <div class="stat-box">
                <p class="stat-number">1</p>
                <p class="stat-label">Total Events</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">1</p>
                <p class="stat-label">Applied Events</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">1</p>
                <p class="stat-label">Approved</p>
            </div>
        </div>
        

       <div class="events-section">
    <div class="section-title">Available Events (1)</div>
    
    <div class="event-card">
        <div class="event-details">
            <h2>Blood Donation Camp</h2>
            <p>Date: May 30, 2025 | Location: Community Hall</p>
            <p>Volunteers needed: 10</p>
        </div>
        <button class="apply-btn" onclick="location.href='<%= request.getContextPath() %>/apply-volunteer?eventId=1'">Applied</button>
    </div>
</div>
    </div>
</body>
</html>
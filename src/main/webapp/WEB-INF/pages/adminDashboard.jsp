<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
        
        .event-management {
            padding: 0 20px 20px 20px;
        }
        
        .event-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .event-title {
            font-size: 24px;
            font-weight: bold;
        }
        
        .add-event-btn {
            background-color: #ff9840;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
        }
        
        .event-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .event-table th {
            background-color: #ddd;
            padding: 12px;
            text-align: left;
            font-size: 18px;
        }
        
        .event-table td {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 16px;
        }
        
        .action-links a {
            color: #4285f4;
            text-decoration: none;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Admin Dashboard</h1>
        </div>
        
        <div class="navbar">
            <a href="#">Dashboard</a>
            <a href="#">Manage Events</a>
            <a href="#">Manage Volunteers</a>
            <a href="#">Reports</a>
            <a href="<%= request.getContextPath() %>/logout">Logout</a>
        </div>
        
        <div class="stats-container">
            <div class="stat-box">
                <p class="stat-number">12</p>
                <p class="stat-label">Total Events</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">45</p>
                <p class="stat-label">Registered Users</p>
            </div>
            <div class="stat-box">
                <p class="stat-number">32</p>
                <p class="stat-label">Active Volunteers</p>
            </div>
        </div>
        
        <div class="event-management">
            <div class="event-header">
                <div class="event-title">Event Management</div>
                <button class="add-event-btn">+ Add New Event</button>
            </div>
            
            <table class="event-table">
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Volunteers</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Community Cleanup</td>
                        <td>May 15, 2025</td>
                        <td>6/10</td>
                        <td class="action-links">
                            <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Food Drive</td>
                        <td>June 1, 2025</td>
                        <td>3/8</td>
                        <td class="action-links">
                            <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Senior Center Visit</td>
                        <td>June 10, 2025</td>
                        <td>2/5</td>
                        <td class="action-links">
                            <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Tree Planting</td>
                        <td>June 15, 2025</td>
                        <td>0/12</td>
                        <td class="action-links">
                            <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Beach Cleanup</td>
                        <td>July 5, 2025</td>
                        <td>4/15</td>
                        <td class="action-links">
                            <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

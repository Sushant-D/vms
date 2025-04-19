<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Volunteer Position</title>
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
            padding: 20px 40px 40px;
        }
        
        .header {
            text-align: center;
            padding: 10px 0 20px;
        }
        
        .event-info {
            margin-bottom: 30px;
        }
        
        .event-info h2 {
            margin-bottom: 15px;
        }
        
        .event-info p {
            margin: 10px 0;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-size: 18px;
            margin-bottom: 10px;
        }
        
        textarea.form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            height: 150px;
            resize: vertical;
        }
        
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn {
            padding: 15px;
            font-size: 18px;
            cursor: pointer;
            border: 1px solid #ccc;
            width: 48%;
            text-align: center;
        }
        
        .btn-primary {
            background-color: #7b68ee;
            color: white;
            border: none;
        }
        
        .btn-secondary {
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Apply for Volunteer Position</h1>
        </div>
        
        <div class="event-info">
            <h2>Event: Community Cleanup</h2>
            <p>Date: May 15, 2025 | Location: City Park</p>
            <p>Volunteers needed: 10</p>
        </div>
        
        <form action="submitApplication" method="post">
            <input type="hidden" name="eventId" value="1">
            
            <div class="form-group">
                <label for="motivation">Why do you want to volunteer for this event?</label>
                <textarea id="motivation" name="motivation" class="form-control" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="skills">Any special skills or experience?</label>
                <textarea id="skills" name="skills" class="form-control"></textarea>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn btn-primary">Submit Application</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='userDashboard.jsp'">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>

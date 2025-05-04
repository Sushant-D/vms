<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Management</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.header h1 {
    margin: 0;
}

.btn-add {
    background-color: #7b68ee;
    color: white;
    padding: 10px 15px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.message {
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
}

.success-message {
    background-color: #d4edda;
    color: #155724;
}

.error-message {
    background-color: #f8d7da;
    color: #721c24;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tr:hover {
    background-color: #f5f5f5;
}

.actions {
    display: flex;
    gap: 10px;
}

.btn-edit, .btn-delete {
    padding: 5px 10px;
    border-radius: 3px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}

.btn-edit {
    background-color: #17a2b8;
    color: white;
}

.btn-delete {
    background-color: #dc3545;
    color: white;
}

.event-status {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 3px;
    font-size: 14px;
    font-weight: bold;
}

.status-open {
    background-color: #28a745;
    color: white;
}

.status-full {
    background-color: #dc3545;
    color: white;
}

.status-past {
    background-color: #6c757d;
    color: white;
}

.no-events {
    text-align: center;
    font-style: italic;
    margin-top: 50px;
    color: #6c757d;
}
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Event Management</h1>
        <a href="addEvent" class="btn-add">Add New Event</a>
    </div>
    
    <c:if test="${not empty successMessage}">
        <div class="message success-message">${successMessage}</div>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <div class="message error-message">${errorMessage}</div>
    </c:if>
    
    <c:choose>
        <c:when test="${empty events}">
            <div class="no-events">
                <h3>No events found</h3>
                <p>Start by adding a new event using the button above.</p>
            </div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Volunteers</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="event" items="${events}">
                        <tr>
                            <td>${event.eventName}</td>
                            <td><fmt:formatDate value="${event.eventDate}" pattern="MMM dd, yyyy" /></td>
                            <td>${event.location}</td>
                            <td>${event.volunteersAssigned} / ${event.volunteersNeeded}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${event.eventDate.time < currentDate.time}">
                                        <span class="event-status status-past">Past</span>
                                    </c:when>
                                    <c:when test="${event.volunteersAssigned >= event.volunteersNeeded}">
                                        <span class="event-status status-full">Full</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="event-status status-open">Open</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <a href="editEvent?id=${event.eventId}" class="btn-edit">Edit</a>
                                <a href="javascript:confirmDelete(${event.eventId}, '${event.eventName}')" 
                                   class="btn-delete">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<script>
function confirmDelete(eventId, eventName) {
    if (confirm("Are you sure you want to delete the event '" + eventName + "'?")) {
        window.location.href = "deleteEvent?id=" + eventId;
    }
}

// Set current date for comparison
document.addEventListener("DOMContentLoaded", function() {
    // This is needed to properly compare dates for the event status
    <% request.setAttribute("currentDate", new java.util.Date()); %>
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${empty event ? 'Add New Event' : 'Edit Event'}</title>
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
    padding: 20px;
}

.header {
    text-align: center;
    padding: 10px 0 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-size: 18px;
    margin-bottom: 10px;
}

.form-control {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.form-row {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

.form-column {
    flex: 1;
}

textarea.form-control {
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

.error-message {
    color: red;
    margin-bottom: 15px;
}

.success-message {
    color: green;
    margin-bottom: 15px;
}
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>${empty event ? 'Add New Event' : 'Edit Event'}</h1>
    </div>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
    
    <c:if test="${not empty successMessage}">
        <div class="success-message">${successMessage}</div>
    </c:if>

    <form action="saveEvent" method="post">
        <!-- Hidden field for event ID when editing -->
        <c:if test="${not empty event}">
            <input type="hidden" name="eventId" value="${event.eventId}">
        </c:if>
        
        <div class="form-group">
            <label for="eventName">Event Name</label>
            <input type="text" id="eventName" name="eventName" class="form-control" 
                   value="${event.eventName}" required>
        </div>

        <div class="form-row">
            <div class="form-column">
                <div class="form-group">
                    <label for="eventDate">Event Date</label>
                    <input type="date" id="eventDate" name="eventDate" class="form-control" 
                           value="${event.eventDate}" required>
                </div>
            </div>

            <div class="form-column">
                <div class="form-group">
                    <label for="volunteersNeeded">Volunteers Needed</label>
                    <input type="number" id="volunteersNeeded" name="volunteersNeeded" 
                           class="form-control" min="1" value="${event.volunteersNeeded}" required>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" class="form-control" 
                   value="${event.location}" required>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" 
                      required>${event.description}</textarea>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-primary">
                ${empty event ? 'Create Event' : 'Update Event'}
            </button>
            <button type="button" class="btn btn-secondary" 
                    onclick="window.location.href='adminDashboard.jsp'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
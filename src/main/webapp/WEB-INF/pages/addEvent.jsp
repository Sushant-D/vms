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
                <label for="eventName">Event Name <span class="required">*</span></label>
                <input type="text" id="eventName" name="eventName" class="form-control"
                       value="${event.eventName}" required maxlength="100">
            </div>

            <div class="form-row">
                <div class="form-column">
                    <div class="form-group">
                        <label for="eventDate">Event Date <span class="required">*</span></label>
                        <input type="date" id="eventDate" name="eventDate" class="form-control"
                               value="${event.eventDate}" required>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <label for="volunteersNeeded">Volunteers Needed <span class="required">*</span></label>
                        <input type="number" id="volunteersNeeded" name="volunteersNeeded"
                               class="form-control" min="1" value="${event.volunteersNeeded}" required>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="location">Event Location <span class="required">*</span></label>
                <input type="text" id="location" name="location" class="form-control"
                       value="${event.eventLocation}" required maxlength="255">
            </div>

            <div class="form-row">
                <div class="form-column">
                    <div class="form-group">
                        <label for="startTime">Start Time</label>
                        <input type="time" id="startTime" name="startTime" class="form-control"
                               value="${event.startTime}">
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <label for="endTime">End Time</label>
                        <input type="time" id="endTime" name="endTime" class="form-control"
                               value="${event.endTime}">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-column">
                    <div class="form-group">
                        <label for="eventCategory">Event Category</label>
                        <select id="eventCategory" name="eventCategory" class="form-control">
                            <option value="">Select Category</option>
                            <option value="Environment" ${event.eventCategory == 'Environment' ? 'selected' : ''}>Environment</option>
                            <option value="Education" ${event.eventCategory == 'Education' ? 'selected' : ''}>Education</option>
                            <option value="Health" ${event.eventCategory == 'Health' ? 'selected' : ''}>Health</option>
                            <option value="Community" ${event.eventCategory == 'Community' ? 'selected' : ''}>Community</option>
                            <option value="Social Services" ${event.eventCategory == 'Social Services' ? 'selected' : ''}>Social Services</option>
                            <option value="Sports" ${event.eventCategory == 'Sports' ? 'selected' : ''}>Sports</option>
                            <option value="Other" ${event.eventCategory == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <label for="eventStatus">Event Status</label>
                        <select id="eventStatus" name="eventStatus" class="form-control">
                            <option value="upcoming" ${empty event.eventStatus || event.eventStatus == 'upcoming' ? 'selected' : ''}>Upcoming</option>
                            <option value="ongoing" ${event.eventStatus == 'ongoing' ? 'selected' : ''}>Ongoing</option>
                            <option value="completed" ${event.eventStatus == 'completed' ? 'selected' : ''}>Completed</option>
                            <option value="cancelled" ${event.eventStatus == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="description">Event Description <span class="required">*</span></label>
                <textarea id="description" name="description" class="form-control"
                          required maxlength="1000" placeholder="Describe the event, its purpose, and what volunteers will be doing...">${event.eventDescription}</textarea>
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

    <script>
        // Add some client-side validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const eventDate = document.getElementById('eventDate').value;
            const startTime = document.getElementById('startTime').value;
            const endTime = document.getElementById('endTime').value;
            
            // Check if event date is in the future
            if (new Date(eventDate) < new Date().setHours(0,0,0,0)) {
                alert('Event date must be in the future.');
                e.preventDefault();
                return;
            }
            
            // Check if start time is before end time
            if (startTime && endTime && startTime >= endTime) {
                alert('Start time must be before end time.');
                e.preventDefault();
                return;
            }
        });
    </script>
</body>
</html>
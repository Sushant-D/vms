package com.islington.servlet;

import com.islington.dao.EventDAO;
import com.islington.model.Event;
import com.islington.model.User;

import jakarta.servlet.ServletException;	
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

@WebServlet("/saveEvent")
public class SaveEventServlet extends HttpServlet {
    private EventDAO eventDAO;
    
    @Override
    public void init() throws ServletException {
        eventDAO = new EventDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Integer userId = user.getUserId();
        
        try {
            // Get form parameters
            String eventIdParam = request.getParameter("eventId");
            String eventName = request.getParameter("eventName");
            String eventDateStr = request.getParameter("eventDate");
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String volunteersNeededStr = request.getParameter("volunteersNeeded");
            String startTimeStr = request.getParameter("startTime");
            String endTimeStr = request.getParameter("endTime");
            String eventCategory = request.getParameter("eventCategory");
            String eventStatus = request.getParameter("eventStatus");
            
            // Validate required fields
            if (eventName == null || eventName.trim().isEmpty() ||
                eventDateStr == null || eventDateStr.trim().isEmpty() ||
                location == null || location.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                volunteersNeededStr == null || volunteersNeededStr.trim().isEmpty()) {
                
                request.setAttribute("errorMessage", "All required fields must be filled.");
                request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                return;
            }
            
            // Parse and validate data
            LocalDate eventDate = LocalDate.parse(eventDateStr);
            int volunteersNeeded = Integer.parseInt(volunteersNeededStr);
            
            if (volunteersNeeded <= 0) {
                request.setAttribute("errorMessage", "Volunteers needed must be a positive number.");
                request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                return;
            }
            
            // Check if event date is in the future
            if (eventDate.isBefore(LocalDate.now())) {
                request.setAttribute("errorMessage", "Event date must be in the future.");
                request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                return;
            }
            
            // Create Event object
            Event event = new Event();
            event.setEventName(eventName.trim());
            event.setEventDate(eventDate);
            event.setEventLocation(location.trim());
            event.setEventDescription(description.trim());
            event.setVolunteersNeeded(volunteersNeeded);
            
            // Parse optional time fields
            if (startTimeStr != null && !startTimeStr.trim().isEmpty()) {
                try {
                    event.setStartTime(LocalTime.parse(startTimeStr));
                } catch (DateTimeParseException e) {
                    request.setAttribute("errorMessage", "Invalid start time format.");
                    request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                    return;
                }
            }
            
            if (endTimeStr != null && !endTimeStr.trim().isEmpty()) {
                try {
                    event.setEndTime(LocalTime.parse(endTimeStr));
                } catch (DateTimeParseException e) {
                    request.setAttribute("errorMessage", "Invalid end time format.");
                    request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                    return;
                }
            }
            
            // Validate start time is before end time if both are provided
            if (event.getStartTime() != null && event.getEndTime() != null) {
                if (event.getStartTime().isAfter(event.getEndTime())) {
                    request.setAttribute("errorMessage", "Start time must be before end time.");
                    request.getRequestDispatcher("addEvent.jsp").forward(request, response);
                    return;
                }
            }
            
            // Set optional fields
            if (eventCategory != null && !eventCategory.trim().isEmpty()) {
                event.setEventCategory(eventCategory.trim());
            }
            
            if (eventStatus != null && !eventStatus.trim().isEmpty()) {
                event.setEventStatus(eventStatus.trim());
            } else {
                event.setEventStatus("upcoming"); // Default status
            }
            
            boolean success;
            String successMessage;
            
            // Check if this is an update or create operation
            if (eventIdParam != null && !eventIdParam.trim().isEmpty()) {
                // Update existing event
                int eventId = Integer.parseInt(eventIdParam);
                event.setEventId(eventId);
                event.setLastModifiedByUserId(userId);
                
                success = eventDAO.updateEvent(event);
                successMessage = "Event updated successfully!";
            } else {
                // Create new event
                event.setCreatedByUserId(userId);
                try {
                    success = eventDAO.saveEvent(event);
                } catch (Exception daoEx) {
                    daoEx.printStackTrace();
                    throw new ServletException("Database error", daoEx);
                }
                success = eventDAO.saveEvent(event);
                successMessage = "Event created successfully!";
            }
            
            if (success) {
                request.setAttribute("successMessage", successMessage);
                response.sendRedirect("adminDashboard.jsp?success=true");
            } else {
                request.setAttribute("errorMessage", "Failed to save event. Please try again.");
                request.getRequestDispatcher("addEvent.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format for volunteers needed.");
            request.getRequestDispatcher("addEvent.jsp").forward(request, response);
        } catch (DateTimeParseException e) {
            request.setAttribute("errorMessage", "Invalid date format. Please use YYYY-MM-DD format.");
            request.getRequestDispatcher("addEvent.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("addEvent.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to the form
        response.sendRedirect("addEvent.jsp");
    }
}
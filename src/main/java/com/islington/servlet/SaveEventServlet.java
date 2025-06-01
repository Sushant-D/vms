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
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.Arrays;

@WebServlet("/saveEvent")
public class SaveEventServlet extends HttpServlet {
    private EventDAO eventDAO;
    
    @Override
    public void init() throws ServletException {
    	System.out.println("here");
        eventDAO = new EventDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== SaveEvent Servlet Debug ===");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            System.out.println("User not logged in");
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // Debug: Print all parameters
            System.out.println("Form parameters received:");
            request.getParameterMap().forEach((key, values) -> {
                System.out.println("- " + key + ": " + Arrays.toString(values));
            });
            
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
            
            System.out.println("Processing parameters:");
            System.out.println("- eventId: " + eventIdParam);
            System.out.println("- eventName: " + eventName);
            System.out.println("- eventDate: " + eventDateStr);
            System.out.println("- location: " + location);
            System.out.println("- volunteersNeeded: " + volunteersNeededStr);
            System.out.println("- startTime: " + startTimeStr);
            System.out.println("- endTime: " + endTimeStr);
            System.out.println("- eventCategory: " + eventCategory);
            System.out.println("- eventStatus: " + eventStatus);
            
            // Validate required fields
            if (eventName == null || eventName.trim().isEmpty()) {
                System.out.println("Event name is missing");
                response.sendRedirect("addEvent.jsp?error=missing_event_name");
                return;
            }
            
            if (eventDateStr == null || eventDateStr.trim().isEmpty()) {
                System.out.println("Event date is missing");
                response.sendRedirect("addEvent.jsp?error=missing_event_date");
                return;
            }
            
            if (location == null || location.trim().isEmpty()) {
                System.out.println("Event location is missing");
                response.sendRedirect("addEvent.jsp?error=missing_location");
                return;
            }
            
            if (description == null || description.trim().isEmpty()) {
                System.out.println("Event description is missing");
                response.sendRedirect("addEvent.jsp?error=missing_description");
                return;
            }
            
            if (volunteersNeededStr == null || volunteersNeededStr.trim().isEmpty()) {
                System.out.println("Volunteers needed is missing");
                response.sendRedirect("addEvent.jsp?error=missing_volunteers_needed");
                return;
            }
            
            // Create Event object
            Event event = new Event();
            
            try {
                // Set basic fields
                event.setEventName(eventName.trim());
                event.setEventDate(LocalDate.parse(eventDateStr));
                event.setEventLocation(location.trim());
                event.setEventDescription(description.trim());
                event.setVolunteersNeeded(Integer.parseInt(volunteersNeededStr));
                
                // Set optional time fields
                if (startTimeStr != null && !startTimeStr.trim().isEmpty()) {
                    event.setStartTime(LocalTime.parse(startTimeStr));
                    System.out.println("Start time set: " + startTimeStr);
                }
                
                if (endTimeStr != null && !endTimeStr.trim().isEmpty()) {
                    event.setEndTime(LocalTime.parse(endTimeStr));
                    System.out.println("End time set: " + endTimeStr);
                }
                
                // Set category and status
                if (eventCategory != null && !eventCategory.trim().isEmpty()) {
                    event.setEventCategory(eventCategory.trim());
                } else {
                    event.setEventCategory("Other"); // Default category
                }
                
                if (eventStatus != null && !eventStatus.trim().isEmpty()) {
                    event.setEventStatus(eventStatus.trim());
                } else {
                    event.setEventStatus("upcoming"); // Default status
                }
                
                System.out.println("Event object created successfully");
                
            } catch (Exception e) {
                System.out.println("Error creating Event object: " + e.getMessage());
                e.printStackTrace();
                response.sendRedirect("addEvent.jsp?error=invalid_data_format");
                return;
            }
            
            boolean success = false;
            
            // Check if this is an update or create operation
            if (eventIdParam != null && !eventIdParam.trim().isEmpty()) {
                // UPDATE operation
                System.out.println("Performing UPDATE operation");
                try {
                    int eventId = Integer.parseInt(eventIdParam);
                    event.setEventId(eventId);
                    event.setLastModifiedByUserId(user.getUserId());
                    
                    System.out.println("About to call updateEvent with ID: " + eventId);
                    System.out.println("Event details before update:");
                    System.out.println("- Name: " + event.getEventName());
                    System.out.println("- Date: " + event.getEventDate());
                    System.out.println("- Location: " + event.getEventLocation());
                    System.out.println("- Modified by: " + event.getLastModifiedByUserId());
                    
                    success = eventDAO.updateEvent(event);
                    System.out.println("Update result: " + success);
                    
                } catch (NumberFormatException e) {
                    System.out.println("Invalid event ID format: " + eventIdParam);
                    response.sendRedirect("addEvent.jsp?error=invalid_event_id");
                    return;
                }
            } else {
                // CREATE operation
                System.out.println("Performing CREATE operation");
                event.setCreatedByUserId(user.getUserId());
                event.setDateCreated(LocalDateTime.now());
                event.setVolunteersApplied(0);
                event.setVolunteersApproved(0);
                
                System.out.println("About to call saveEvent");
                success = eventDAO.saveEvent(event);
                System.out.println("Create result: " + success);
            }
            
            if (success) {
                System.out.println("Operation successful, redirecting to dashboard");
                response.sendRedirect("admin-dashboard?success=event_saved");
            } else {
                System.out.println("Operation failed, redirecting with error");
                response.sendRedirect("addEvent.jsp?error=save_failed");
            }
            
        } catch (Exception e) {
            System.out.println("Unexpected error in SaveEventServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("addEvent.jsp?error=unexpected_error");
        }
        
        System.out.println("=== End SaveEvent Servlet Debug ===");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // For GET requests, forward to the form page
        request.getRequestDispatcher("addEvent.jsp").forward(request, response);
    }
}
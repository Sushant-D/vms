package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

import com.islington.model.Event;
import com.islington.model.User;
import com.islington.service.EventService;

/**
 * @author Sushant Dhungel
 */
//@WebServlet("/saveEvent")
public class EventController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventService eventService;
    
    public EventController() {
   
        super();
        eventService = new EventService();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	System.out.println("SaveEventServlet doPost called!");
        System.out.println("Request Method: " + request.getMethod());
        // Check if user is logged in and is admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        System.out.println("User: " + user);
        if (!"admin".equals(user.getUserRole())) {
            response.sendRedirect(request.getContextPath() + "/access-denied");
            return;
        }
        
        try {
            // Get form parameters
            String eventIdStr = request.getParameter("eventId");
            String eventName = request.getParameter("eventName");
            String eventDateStr = request.getParameter("eventDate");
            String volunteersNeededStr = request.getParameter("volunteersNeeded");
            String location = request.getParameter("location");
            String startTimeStr = request.getParameter("startTime");
            String endTimeStr = request.getParameter("endTime");
            String eventCategory = request.getParameter("eventCategory");
            String eventStatus = request.getParameter("eventStatus");
            String description = request.getParameter("description");
            
            // Validate required fields
            if (isNullOrEmpty(eventName) || isNullOrEmpty(eventDateStr) || 
                isNullOrEmpty(volunteersNeededStr) || isNullOrEmpty(location) || 
                isNullOrEmpty(description)) {
                
                request.setAttribute("errorMessage", "All required fields must be filled");
                request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
                return;
            }
            
            // Parse and validate data
            LocalDate eventDate;
            int volunteersNeeded;
            LocalTime startTime = null;
            LocalTime endTime = null;
            
            try {
                eventDate = LocalDate.parse(eventDateStr);
                volunteersNeeded = Integer.parseInt(volunteersNeededStr);
                
                if (volunteersNeeded <= 0) {
                    throw new NumberFormatException("Volunteers needed must be positive");
                }
                
                // Parse optional time fields
                if (!isNullOrEmpty(startTimeStr)) {
                    startTime = LocalTime.parse(startTimeStr);
                }
                
                if (!isNullOrEmpty(endTimeStr)) {
                    endTime = LocalTime.parse(endTimeStr);
                }
                
                // Validate that start time is before end time
                if (startTime != null && endTime != null && startTime.isAfter(endTime)) {
                    request.setAttribute("errorMessage", "Start time must be before end time");
                    request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
                    return;
                }
                
                // Validate that event date is not in the past
                if (eventDate.isBefore(LocalDate.now())) {
                    request.setAttribute("errorMessage", "Event date cannot be in the past");
                    request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
                    return;
                }
                
            } catch (DateTimeParseException | NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid date, time, or number format");
                request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
                return;
            }
            
            // Create or update event
            Event event = new Event();
            event.setEventName(eventName.trim());
            event.setEventDate(eventDate);
            event.setEventLocation(location.trim());
            event.setEventDescription(description.trim());
            event.setVolunteersNeeded(volunteersNeeded);
            event.setStartTime(startTime);
            event.setEndTime(endTime);
            event.setEventCategory(isNullOrEmpty(eventCategory) ? null : eventCategory);
            event.setEventStatus(isNullOrEmpty(eventStatus) ? "upcoming" : eventStatus);
            
            boolean success;
            String successMessage;
            
            if (isNullOrEmpty(eventIdStr)) {
                // Creating new event
                event.setCreatedByUserId(user.getUserId());
                success = eventService.createEvent(event);
                successMessage = "Event created successfully!";
            } else {
                // Updating existing event
                try {
                    int eventId = Integer.parseInt(eventIdStr);
                    event.setEventId(eventId);
                    event.setLastModifiedByUserId(user.getUserId());
                    success = eventService.updateEvent(event);
                    successMessage = "Event updated successfully!";
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessage", "Invalid event ID");
                    request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
                    return;
                }
            }
            
            if (success) {
                // Success - redirect to admin dashboard with success message
                session.setAttribute("successMessage", successMessage);
                response.sendRedirect(request.getContextPath() + "/admin-dashboard");
            } else {
                // Failed to save
                request.setAttribute("errorMessage", "Failed to save event. Please try again.");
                request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
            }
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is logged in and is admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        if (!"admin".equals(user.getUserRole())) {
            response.sendRedirect(request.getContextPath() + "/access-denied");
            return;
        }
        
        // Check if we're editing an existing event
        String eventIdStr = request.getParameter("eventId");
        if (!isNullOrEmpty(eventIdStr)) {
            try {
                int eventId = Integer.parseInt(eventIdStr);
                Event event = eventService.getEventById(eventId);
                
                if (event != null) {
                    request.setAttribute("event", event);
                } else {
                    request.setAttribute("errorMessage", "Event not found");
                }
                
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid event ID");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            }
        }
        
        // Forward to the add/edit event page
        request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
    }
    
    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
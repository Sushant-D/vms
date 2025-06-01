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

@WebServlet("/editEvent")
public class EditEventServlet extends HttpServlet {
    private EventDAO eventDAO;
    
    @Override
    public void init() throws ServletException {
        eventDAO = new EventDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("EditEventServlet called!");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // Check if user is logged in
        if (user == null) {
            System.out.println("User not logged in, redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            String eventIdParam = request.getParameter("eventId");
            System.out.println("Event ID parameter: " + eventIdParam);
            
            if (eventIdParam == null || eventIdParam.trim().isEmpty()) {
                System.out.println("Event ID is missing or empty");
                response.sendRedirect("admin-dashboard?error=missing_event_id");
                return;
            }
            
            int eventId = Integer.parseInt(eventIdParam);
            System.out.println("Parsed Event ID: " + eventId);
            
            // Debug: Check if event exists first
            boolean exists = eventDAO.eventExists(eventId);
            System.out.println("Event exists check: " + exists);
            
            // Get the event details from database
            System.out.println("Attempting to get event by ID: " + eventId);
            Event event = eventDAO.getEventById(eventId);
            System.out.println("Retrieved event: " + (event != null ? event.getEventName() : "null"));
            
            if (event == null) {
                System.out.println("Event not found in database for ID: " + eventId);
                response.sendRedirect("admin-dashboard?error=event_not_found");
                return;
            }
            
            // Debug: Print event details
            System.out.println("Event details:");
            System.out.println("- ID: " + event.getEventId());
            System.out.println("- Name: " + event.getEventName());
            System.out.println("- Date: " + event.getEventDate());
            System.out.println("- Location: " + event.getEventLocation());
            
            // Set the event as a request attribute so the JSP can access it
            request.setAttribute("event", event);
            
            // Forward to the add event page (which will show as edit mode)
            System.out.println("Forwarding to addEvent.jsp with event data");
            request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.out.println("Invalid event ID format: " + e.getMessage());
            response.sendRedirect("admin-dashboard?error=invalid_event_id");
        } catch (Exception e) {
            System.out.println("Unexpected error in EditEventServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("admin-dashboard?error=unexpected_error");
        }
    }
}
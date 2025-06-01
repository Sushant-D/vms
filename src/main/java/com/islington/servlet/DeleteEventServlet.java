package com.islington.servlet;

import com.islington.dao.EventDAO;
import com.islington.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteEvent")
public class DeleteEventServlet extends HttpServlet {
    private EventDAO eventDAO;
    
    @Override
    public void init() throws ServletException {
        eventDAO = new EventDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // Check if user is logged in
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            String eventIdParam = request.getParameter("eventId");
            
            if (eventIdParam == null || eventIdParam.trim().isEmpty()) {
                response.sendRedirect("admin-dashboard?error=missing_event_id");
                return;
            }
            
            int eventId = Integer.parseInt(eventIdParam);
            
            // Delete the event
            boolean success = eventDAO.deleteEvent(eventId);
            
            if (success) {
                response.sendRedirect("admin-dashboard?success=event_deleted");
            } else {
                response.sendRedirect("admin-dashboard?error=delete_failed");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("admin-dashboard?error=invalid_event_id");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard?error=unexpected_error");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Also handle POST requests
        doGet(request, response);
    }
}
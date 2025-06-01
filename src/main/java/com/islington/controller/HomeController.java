package com.islington.controller;

import jakarta.servlet.ServletException;	
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.islington.model.User;

/**
 * @author Sushant Dhungel
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login", "/", "/register", "/admin-dashboard", "/user-dashboard", "/add-event", "/apply-volunteer", "/access-denied", "/features", "/contact", "/privacy-policy", "/blogs", "/volunteers", "/pricing", "/nonprofits" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Requested URI: " + request.getRequestURI());
    	System.out.println("Context Path: " + request.getContextPath());
//    	System.out.println("Page: " + uri.substring(contextPath.length()));
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String page = uri.substring(contextPath.length());
        
        // Pages that require authentication and specific role
        if (page.equals("/admin-dashboard")) {
            checkRoleAndForward(request, response, "admin", "/WEB-INF/pages/adminDashboard.jsp");
        } else if (page.equals("/user-dashboard")) {
            checkRoleAndForward(request, response, "volunteer", "/WEB-INF/pages/userDashboard.jsp");
        } else if (page.equals("/add-event")) {
            checkRoleAndForward(request, response, "admin", "/WEB-INF/pages/addEvent.jsp");
        } else if (page.equals("/apply-volunteer")) {
            checkRoleAndForward(request, response, "volunteer", "/WEB-INF/pages/applyVolunteer.jsp");
        } 
        // Public pages
        else if (page.equals("/home") || page.equals("/")) {
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
        }
        else if (page.equals("/pricing")) {
            request.getRequestDispatcher("/WEB-INF/pages/pricing.jsp").forward(request, response);
        }
        else if (page.equals("/nonprofits")) {
            request.getRequestDispatcher("/WEB-INF/pages/nonprofits.jsp").forward(request, response);
        }
        else if (page.equals("/features")) {
            request.getRequestDispatcher("/WEB-INF/pages/features.jsp").forward(request, response);
        }
        else if (page.equals("/volunteers")) {
            request.getRequestDispatcher("/WEB-INF/pages/volunteers.jsp").forward(request, response);
        }
        else if (page.equals("/privacy-policy")) {
            request.getRequestDispatcher("/WEB-INF/pages/privacy-policy.jsp").forward(request, response);
        } 
        else if (page.equals("/blogs")) {
            request.getRequestDispatcher("/WEB-INF/pages/blogs.jsp").forward(request, response);
        } 
        else if (page.equals("/contact")) {
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
        } 
        else if (page.equals("/login")) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        } 
        else if (page.equals("/register")) {
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        } else {
            // Handle unknown pages
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    /**
     * Helper method to check user role and forward to appropriate page
     */
    private void checkRoleAndForward(HttpServletRequest request, HttpServletResponse response, 
                                    String requiredRole, String forwardPath) 
                                    throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Not logged in, redirect to login
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Get user from session
        User user = (User) session.getAttribute("user");
        
        // Check if user has the required role
        if (requiredRole.equals(user.getUserRole())) {
            // User has correct role, forward to the page
            request.getRequestDispatcher(forwardPath).forward(request, response);
        } else {
            // User doesn't have required role, redirect to access denied
//            response.sendRedirect(request.getContextPath() + "/WEB-INF/pages/access-denied.jsp");
            request.getRequestDispatcher("/WEB-INF/pages/access-denied.jsp").forward(request, response);
        }
    }
}
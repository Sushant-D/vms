package com.islington.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.islington.model.User;

@WebFilter(urlPatterns = {"/admin-dashboard/*", "/user-dashboard/*", "/add-event/*", "/apply-volunteer/*"})
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Get the current session
        HttpSession session = httpRequest.getSession(false);
        
        // Check if user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        
        // Get requested URL
        String requestURI = httpRequest.getRequestURI();
        
        if (isLoggedIn) {
            User user = (User) session.getAttribute("user");
            
            // Check if admin is trying to access admin pages
            if (requestURI.contains("/admin-dashboard") && !"admin".equals(user.getUserRole())) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/user-dashboard");
                return;
            }
            
            // Allow the request to proceed
            chain.doFilter(request, response);
        } else {
            // User is not logged in, redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code
    }
}
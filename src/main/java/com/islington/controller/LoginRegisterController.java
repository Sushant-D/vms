package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.islington.model.User;
import com.islington.service.UserService;

/**
 * @author Sushant Dhungel
 */
@WebServlet("/loginRegister")
public class LoginRegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    public LoginRegisterController() {
        super();
        userService = new UserService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect to the appropriate page based on the requested action
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        } else if ("login".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        } else {
            // Default to login page
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        }
    }
    
    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        
        // Validate inputs
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All required fields must be filled");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }
        
        // Validate email format
        if (!userService.isValidEmail(email)) {
            request.setAttribute("errorMessage", "Invalid email format");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }
        
        // Validate password strength
        if (!userService.isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters with at least one letter and one number");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }
        
        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }
        
        // Create user object
        User user = new User(firstName, lastName, email, password, phoneNumber, address);
        
        try {
            // Check if email is already registered
            if (userService.isEmailRegistered(email)) {
                request.setAttribute("errorMessage", "Email is already registered");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }
            
            // Register the user
            boolean registered = userService.registerUser(user);
            
            if (registered) {
                // Registration successful, redirect to login page
                request.setAttribute("successMessage", "Registration successful! Please login.");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                // Registration failed
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
    
    private void loginUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String email = request.getParameter("email");
        System.out.println("DEBUG - Email: " + email);
        
        // Exit here for debugging
//        return;
        String password = request.getParameter("password");
        
        // Validate inputs
        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "Email and password are required");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }
        
        try {
            // Authenticate user
            User user = userService.loginUser(email, password);
            
            if (user != null) {
                // Login successful, create session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                // Redirect based on user role
                if ("admin".equals(user.getUserRole())) {
                    response.sendRedirect(request.getContextPath() + "/admin-dashboard");
                } else if ("volunteer".equals(user.getUserRole())) {
                    response.sendRedirect(request.getContextPath() + "/user-dashboard");
                } else {
                    // For any other role, redirect to home page
                    response.sendRedirect(request.getContextPath() + "/");
                }
            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}
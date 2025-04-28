package com.islington.controller;

import jakarta.servlet.ServletException;	
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Sushant Dhungel
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login", "/", "/register", "/admin-dashboard", "/user-dashboard", "/add-event", "/apply-volunteer" })
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
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String page = uri.substring(contextPath.length());
        
        if (page.equals("/home") || page.equals("/")) {
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
        } else if (page.equals("/login")) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        } else if (page.equals("/register")) {
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        } else if (page.equals("/admin-dashboard")) {
            request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
        } else if (page.equals("/user-dashboard")) {
            request.getRequestDispatcher("/WEB-INF/pages/userDashboard.jsp").forward(request, response);
        } else if (page.equals("/add-event")) {
            request.getRequestDispatcher("/WEB-INF/pages/addEvent.jsp").forward(request, response);
        } else if (page.equals("/apply-volunteer")) {
            request.getRequestDispatcher("/WEB-INF/pages/applyVolunteer.jsp").forward(request, response);
        }  
        
        else {
            // Handle unknown pages
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}

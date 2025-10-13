package com.studentmgmtsys.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {


    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin_password_123";

    private static final String MANAGER_USERNAME = "manager";
    private static final String MANAGER_PASSWORD = "manager_password_456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {

            request.getSession().setAttribute("role", "admin");
            response.sendRedirect("adminDashboard.jsp");

        } else if (MANAGER_USERNAME.equals(username) && MANAGER_PASSWORD.equals(password)) {


            request.getSession().setAttribute("role", "manager");

            response.sendRedirect("managerDashboard.jsp");

        } else {
            // If authentication fails, redirect back to the login page with an error
            response.sendRedirect("index.jsp?error=Invalid credentials");
        }
    }
}
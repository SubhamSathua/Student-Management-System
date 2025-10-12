package com.studentmgmtsys.controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("index.jsp"); // not logged in
            return;
        }

        String role = (String) session.getAttribute("role");

        // Forward to JSP based on role
        switch (role) {
            case "admin":
                request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
                break;
            case "manager":
                request.getRequestDispatcher("managementDashboard.jsp").forward(request, response);
                break;
            case "teacher":
                request.getRequestDispatcher("teacherDashboard.jsp").forward(request, response);
                break;
            case "student":
                request.getRequestDispatcher("studentDashboard.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("login.jsp"); // unknown role
        }
    }
}

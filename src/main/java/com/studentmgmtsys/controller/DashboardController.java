package com.studentmgmtsys.controller;


import javax.servlet.RequestDispatcher;
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
            throws ServletException, java.io.IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        RequestDispatcher rd = null;
        String role = (String) session.getAttribute("role");

        if ("admin".equals(role)) {
            rd = request.getRequestDispatcher("adminDashboard.jsp");
            rd.forward(request, response);
        } else if ("student".equals(role)) {
            rd = request.getRequestDispatcher("studentDashboard.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");

        }
    }
}

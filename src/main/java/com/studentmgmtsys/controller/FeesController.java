package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.FeesDAO;
import com.studentmgmtsys.model.Fees;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/fees")
public class FeesController extends HttpServlet {
    
    // Show fees page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if student is logged in
        HttpSession session = request.getSession(false);
        if (session == null || !"student".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Get user_id from session
        int userId = (int) session.getAttribute("user_id");
        
        FeesDAO dao = new FeesDAO();
        Fees fees = dao.getFeesByUserId(userId);
        
        // Send fees data to JSP
        request.setAttribute("fees", fees);
        
        RequestDispatcher rd = request.getRequestDispatcher("student/fees.jsp");
        rd.forward(request, response);
    }
    
    // Handle payment
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if student is logged in
        HttpSession session = request.getSession(false);
        if (session == null || !"student".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Get form data
        String feeType = request.getParameter("feeType");
        int userId = (int) session.getAttribute("user_id");
        
        if (feeType != null) {
            FeesDAO dao = new FeesDAO();
            // Update specific fee: UPDATE fees SET transport = TRUE WHERE stud_id = userId
            boolean success = dao.updateFee(userId, feeType);
            
            if (success) {
                System.out.println("Payment successful for " + feeType);
            } else {
                System.out.println("Payment failed for " + feeType);
            }
        }
        
        // Redirect back to fees page
        response.sendRedirect(request.getContextPath() + "/fees");
    }
}

package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.ComplainDAO;
import com.studentmgmtsys.model.Complain;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet({"/complaints", "/grievance"})
public class ComplainController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("ComplainController doGet called");
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            System.out.println("No session or role found, redirecting to index");
            response.sendRedirect("index.jsp");
            return;
        }
        
        String servletPath = request.getServletPath();
        String role = (String) session.getAttribute("role");
        
        System.out.println("Servlet Path: " + servletPath + ", Role: " + role);
        
        if ("/complaints".equals(servletPath)) {
            // Handle student complaints
            if (!"student".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            int userId = (int) session.getAttribute("user_id");
            ComplainDAO dao = new ComplainDAO();
            
            System.out.println("Student complaint view - User ID: " + userId);
            
            try {
                List<Complain> complaints = dao.getComplaintsByUserId(userId);
                System.out.println("Found " + complaints.size() + " complaints for user " + userId);
                request.setAttribute("complaints", complaints);
            } catch (Exception e) {
                System.out.println("Error getting student complaints: " + e.getMessage());
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error loading complaints");
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("student/complaints.jsp");
            rd.forward(request, response);
            
        } else if ("/grievance".equals(servletPath)) {
            // Handle admin grievance (all complaints)
            if (!"admin".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            ComplainDAO dao = new ComplainDAO();
            
            System.out.println("Admin grievance view");
            
            try {
                List<Complain> allComplaints = dao.getAllComplaints();
                System.out.println("Found " + allComplaints.size() + " total complaints");
                request.setAttribute("complaints", allComplaints);
            } catch (Exception e) {
                System.out.println("Error getting all complaints: " + e.getMessage());
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error loading complaints");
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("admin/grievance.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        ComplainDAO dao = new ComplainDAO();
        
        if ("addComplaint".equals(action)) {
            // Student adding new complaint
            String role = (String) session.getAttribute("role");
            if (!"student".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            try {
                int userId = (int) session.getAttribute("user_id");
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                
                Complain complain = new Complain();
                complain.setTitle(title);
                complain.setDescription(description);
                complain.setUserId(userId);
                
                boolean success = dao.addComplain(complain);
                if (success) {
                    System.out.println("Complaint added successfully");
                } else {
                    System.out.println("Failed to add complaint");
                }
                
            } catch (Exception e) {
                System.out.println("Error adding complaint: " + e.getMessage());
            }
            
            response.sendRedirect(request.getContextPath() + "/complaints");
            
        } else if ("markComplete".equals(action)) {
            // Admin marking complaint as complete
            String role = (String) session.getAttribute("role");
            System.out.println("markComplete action called by role: " + role);
            
            if (!"admin".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            try {
                String complainIdParam = request.getParameter("complaintId");
                System.out.println("Complaint ID parameter: " + complainIdParam);
                
                int complainId = Integer.parseInt(complainIdParam);
                System.out.println("Attempting to mark complaint " + complainId + " as complete");
                
                boolean success = dao.markAsComplete(complainId);
                
                if (success) {
                    System.out.println("Complaint " + complainId + " marked as complete successfully");
                } else {
                    System.out.println("Failed to mark complaint " + complainId + " as complete");
                }
                
            } catch (Exception e) {
                System.out.println("Error marking complaint complete: " + e.getMessage());
                e.printStackTrace();
            }
            
            response.sendRedirect(request.getContextPath() + "/grievance");
        }
    }
}
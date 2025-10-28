package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.StudentProfileDAO;
import com.studentmgmtsys.model.CompleteStudentProfile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/StudentProfile")
public class StudentProfileController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null || !"student".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        StudentProfileDAO dao = new StudentProfileDAO();
        
        try {
            CompleteStudentProfile profile = dao.getCompleteProfile(userId);
            request.setAttribute("profile", profile);
            
            if (profile == null) {
                request.setAttribute("errorMessage", "Profile not found. Please contact administration.");
            }
            
        } catch (Exception e) {
            System.out.println("Error fetching profile: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading profile data.");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("student/StudentProfile.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null || !"student".equals(session.getAttribute("role"))) {
            response.sendRedirect("index.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        if ("updateProfile".equals(action)) {
            int userId = (int) session.getAttribute("user_id");
            StudentProfileDAO dao = new StudentProfileDAO();
            
            try {
                CompleteStudentProfile profile = new CompleteStudentProfile();
                profile.setUserId(userId);
                profile.setFullName(request.getParameter("fullName"));
                profile.setEmail(request.getParameter("email"));
                profile.setPhone(request.getParameter("phone"));
                profile.setAddress(request.getParameter("address"));
                profile.setDob(request.getParameter("dob"));
                profile.setEducation(request.getParameter("education"));
                profile.setFatherName(request.getParameter("fatherName"));
                profile.setFatherMobile(request.getParameter("fatherMobile"));
                profile.setMotherName(request.getParameter("motherName"));
                profile.setMotherMobile(request.getParameter("motherMobile"));
                
                boolean success = dao.updateProfile(profile);
                
                if (success) {
                    request.setAttribute("successMessage", "Profile updated successfully!");
                } else {
                    request.setAttribute("errorMessage", "Failed to update profile.");
                }
                
            } catch (Exception e) {
                System.out.println("Error updating profile: " + e.getMessage());
                request.setAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            }
        }
        
        // Redirect to GET to show updated data
        doGet(request, response);
    }
}

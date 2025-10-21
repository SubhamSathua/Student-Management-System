package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.StudentProfileDAO;
import com.studentmgmtsys.model.StudentProfile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get userId from session
        int userId = (Integer) session.getAttribute("user_id");

        // Call DAO
        StudentProfileDAO dao = new StudentProfileDAO();
        StudentProfile student = dao.getStudentProfileByUserId(userId);

        // Forward to JSP
        if (student != null) {
            request.setAttribute("student", student);
            request.getRequestDispatcher("student/StudentProfile.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "No profile found for this student.");
            request.getRequestDispatcher("student/StudentProfile.jsp").forward(request, response);
        }
    }
}

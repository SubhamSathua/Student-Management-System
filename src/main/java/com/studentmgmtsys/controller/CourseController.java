package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.CourseDAO;
import com.studentmgmtsys.model.Course;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/CourseServlet", "/courseSetup", "/listAllCourses"})
public class CourseController extends HttpServlet {
    
    // Handle GET requests - show the course setup form or list courses
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        String servletPath = request.getServletPath();
        String role = (String) session.getAttribute("role");
        
        if ("/listAllCourses".equals(servletPath)) {
            // Handle student course listing
            if (!"student".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Get student details from session and database
            Integer userIdObj = (Integer) session.getAttribute("user_id");
            if (userIdObj == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            int userId = userIdObj.intValue();
            CourseDAO dao = new CourseDAO();
            
            try {
                // Get student's semester and branch from database
                System.out.println("Fetching student info for user_id: " + userId);
                String[] studentInfo = dao.getStudentSemesterAndBranch(userId);
                
                if (studentInfo != null) {
                    String branch = studentInfo[0];  // This is actually department
                    String semesterStr = studentInfo[1];
                    System.out.println("Found student: department=" + branch + ", semester=" + semesterStr);
                    
                    // Convert semester string to integer, handling potential parsing errors
                    int semester;
                    try {
                        semester = Integer.parseInt(semesterStr);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid semester format: " + semesterStr);
                        request.setAttribute("errorMessage", "Invalid semester data. Please contact administration.");
                        RequestDispatcher rd = request.getRequestDispatcher("student/listAllCourses.jsp");
                        rd.forward(request, response);
                        return;
                    }
                    
                    // Get courses for student's semester and branch with registration status
                    System.out.println("Looking for courses with registration: semester=" + semester + ", branch=" + branch);
                    List<Course> availableCourses = dao.getCoursesWithRegistration(branch, semester, userId);
                    System.out.println("Found " + (availableCourses != null ? availableCourses.size() : 0) + " courses");
                    
                    request.setAttribute("availableCourses", availableCourses);
                    request.setAttribute("studentBranch", branch);
                    request.setAttribute("studentSemester", semester);
                } else {
                    // No student record found
                    System.out.println("No student record found for user_id: " + userId);
                    request.setAttribute("errorMessage", "Student information not found. Please contact administration to complete your profile setup.");
                }
            } catch (Exception e) {
                System.out.println("Error fetching student courses: " + e.getMessage());
                e.printStackTrace(); // Add stack trace for better debugging
                request.setAttribute("errorMessage", "Error loading courses. Please try again.");
            }
            
            // Forward to student course listing JSP
            RequestDispatcher rd = request.getRequestDispatcher("student/listAllCourses.jsp");
            rd.forward(request, response);
            
        } else {
            // Handle admin course setup (existing functionality)
            if (!"admin".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Forward to admin course setup JSP - session is automatically preserved
            RequestDispatcher rd = request.getRequestDispatcher("admin/courseSetup.jsp");
            rd.forward(request, response);
        }
    }
    
    // Handle POST requests - process form submission (existing code)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String action = request.getParameter("action");
        CourseDAO dao = new CourseDAO();
        
        if ("registerCourse".equals(action)) {
            // Handle course registration
            String role = (String) session.getAttribute("role");
            if (!"student".equals(role)) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            try {
                Integer userIdObj = (Integer) session.getAttribute("user_id");
                if (userIdObj == null) {
                    response.sendRedirect("index.jsp");
                    return;
                }
                int userId = userIdObj.intValue();
                int courseId = Integer.parseInt(request.getParameter("courseId"));
                
                boolean success = dao.registerForCourse(userId, courseId);
                System.out.println("Registration result: " + success);
                
            } catch (Exception e) {
                System.out.println("Registration error: " + e.getMessage());
            }
            
            // Use forward instead of redirect to avoid response committed error
            doGet(request, response);
            return;
            
        } else if ("updateStatus".equals(action)) {
            // Handle status update (inactive/activate button)
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            String newStatus = request.getParameter("newStatus");
            
            try {
                dao.updateCourseStatus(courseId, newStatus);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            
            response.sendRedirect(request.getContextPath() + "/courseSetup");
            
        } else {
            // Handle course creation (existing code)
            Course c = new Course();
            c.setCourseCode(request.getParameter("courseCode"));
            c.setCourseName(request.getParameter("courseName"));
            c.setBranch(request.getParameter("branch"));
            c.setSemester(Integer.parseInt(request.getParameter("semester")));
            c.setCredits(Integer.parseInt(request.getParameter("credits")));
            c.setStatus(request.getParameter("status"));

            dao.addCourse(c);
            
            response.sendRedirect(request.getContextPath() + "/courseSetup");
        }
    }
}

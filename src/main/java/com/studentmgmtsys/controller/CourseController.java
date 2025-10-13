package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.CourseDAO;
import com.studentmgmtsys.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CourseServlet")
public class CourseController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Course c = new Course();
        c.setCourseCode(request.getParameter("courseCode"));
        c.setCourseName(request.getParameter("courseName"));
        c.setBranch(request.getParameter("branch"));
        c.setSemester(Integer.parseInt(request.getParameter("semester")));
        c.setCredits(Integer.parseInt(request.getParameter("credits")));
        c.setStatus(request.getParameter("status"));

        CourseDAO dao = new CourseDAO();
        dao.addCourse(c);

        response.sendRedirect("admin/courseSetup.jsp"); // reload page to show updated courses
    }
}

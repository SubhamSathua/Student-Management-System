package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.StudentDAO;
import com.studentmgmtsys.dao.StudentProfileDAO;
import com.studentmgmtsys.dao.UserDAO;
import com.studentmgmtsys.model.Student;
import com.studentmgmtsys.model.StudentProfile;
import com.studentmgmtsys.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// If you want to wire DAOs later, uncomment these and the code inside TODO
// import com.studentmgmtsys.dao.DBConnection;
// import com.studentmgmtsys.dao.UserDAO;
// import com.studentmgmtsys.dao.StudentDAO;

@WebServlet("/registerStudent")
public class RegisterStudentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        User user = new User();
        Student student = new Student();
        StudentProfile profile = new StudentProfile();

        // collect form data
        String username = request.getParameter("stud_username");
        String password = request.getParameter("stud_password");
        String status = request.getParameter("status");

        String registrationNo = request.getParameter("registrationNo");
        String department = request.getParameter("department");
        int semester = Integer.parseInt(request.getParameter("semester").replace("Sem ", ""));
        int admissionYear = Integer.parseInt(request.getParameter("admissionYear"));

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // set user data
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("student");
        user.setStatus(status);

        // DAO init
        UserDAO userDAO = new UserDAO();
        StudentDAO studentDAO = new StudentDAO();
        StudentProfileDAO profileDAO = new StudentProfileDAO();

        // save user
        int userId = 0;
        try {
            userId = userDAO.registerUser(user);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (userId > 0) {
            // save student
            student.setUserId(userId);
            student.setRegistrationNo(registrationNo);
            student.setDepartment(department);
            student.setSemester(semester);
            student.setAdmissionYear(admissionYear);
            student.setStatus(status);
            try {
                studentDAO.addStudent(student);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            // save profile
            profile.setFullName(fullName);
            profile.setEmail(email);
            profile.setPhone(phone);
            profile.setAddress(request.getParameter("address"));
//            try {
//                profile.setDob(java.sql.Date.valueOf(request.getParameter("dob")));
//            } catch (Exception e) {
//                profile.setDob(null);
//            }

            profile.setDob(request.getParameter("dob"));

            profile.setEducation(request.getParameter("education"));
            profile.setFatherName(request.getParameter("fatherName"));
            profile.setFatherMobile(request.getParameter("fatherMobile"));
            profile.setMotherName(request.getParameter("motherName"));
            profile.setMotherMobile(request.getParameter("motherMobile"));

            try {
                profileDAO.addProfile(profile, userId);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            request.getSession().setAttribute("status", "success");
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
        } else {
            request.getSession().setAttribute("status", "failed");
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
        }
    }
}

package com.studentmgmtsys.controller;

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

@WebServlet(name = "UserController", urlPatterns = {"/user/*"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = normalize(request.getPathInfo());

        switch (path) {
            case "/register":
            case "/register/":
                forward(request, response, "/admin/registerChoice.jsp");
                return;

            case "/register/student":
                forward(request, response, "/admin/registerStudent.jsp");
                return;

            case "/register/teacher":
                forward(request, response, "/admin/registerTeacher.jsp");
                return;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown GET: " + path);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = normalize(request.getPathInfo());

        switch (path) {
            case "/register/student": {
                // Read form fields
                String username       = param(request, "username");
                String password       = param(request, "password");
                String status         = param(request, "status", "active");

                String registrationNo = param(request, "registrationNo");
                String department     = param(request, "department");
                String semester       = param(request, "semester");
                String admissionYear  = param(request, "admissionYear");

                String fullName       = param(request, "fullName");
                String email          = param(request, "email");
                String phone          = param(request, "phone");

                // TODO: Uncomment and adapt when you add DB logic
                /*
                try (java.sql.Connection con = DBConnection.getConnection()) {
                    con.setAutoCommit(false);

                    UserDAO userDAO = new UserDAO(); // or new UserDAO(con) if your DAO accepts Connection
                    int userId = userDAO.insertUser(username, password, "student", status);

                    StudentDAO studentDAO = new StudentDAO(); // or new StudentDAO(con)
                    studentDAO.insertStudent(userId, registrationNo, department, semester, admissionYear, "active");

                    // Optional: student profile insert using fullName/email/phone

                    con.commit();
                    response.sendRedirect(request.getContextPath() + "/admin/registerStudent.jsp?msg=created");
                    return;
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/admin/registerStudent.jsp?msg=error");
                    return;
                }
                */

                // Demo-only redirect (no DB yet)
                response.sendRedirect(request.getContextPath() + "/admin/registerStudent.jsp?msg=created");
                return;
            }

            case "/register/teacher": {
                // Placeholder for teacher registration; add fields and DAO calls later
                response.sendRedirect(request.getContextPath() + "/admin/registerTeacher.jsp?msg=created");
                return;
            }

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown POST: " + path);
        }
    }

    // Helpers
    private static String normalize(String pathInfo) {
        if (pathInfo == null || pathInfo.trim().isEmpty()) return "/";
        return pathInfo.trim();
    }

    private static void forward(HttpServletRequest req, HttpServletResponse resp, String jsp)
            throws ServletException, IOException {
        req.getRequestDispatcher(jsp).forward(req, resp);
    }

    private static String param(HttpServletRequest req, String name) {
        String v = req.getParameter(name);
        return v == null ? "" : v.trim();
    }

    private static String param(HttpServletRequest req, String name, String def) {
        String v = req.getParameter(name);
        return (v == null || v.trim().isEmpty()) ? def : v.trim();
    }
}

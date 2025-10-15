package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.UserDAO;
import com.studentmgmtsys.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");


        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                fullname == null || fullname.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("/registerUser.jsp").forward(request, response);
            return;
        }


        User newUser = new User(username, password, fullname, email, role);


        boolean success = userDAO.registerUser(newUser);

        if (success) {
            request.setAttribute("message", "User registered successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to register user. Try again.");
        }

        request.getRequestDispatcher("/registerUser.jsp").forward(request, response);
    }
}

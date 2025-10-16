package com.studentmgmtsys.controller;

import com.studentmgmtsys.dao.UserDAO;
import com.studentmgmtsys.model.LoggedUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
    public class LoginController extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO userDAO = new UserDAO();
            LoggedUser loggedUser = userDAO.validateUser(username, password);

            String role = loggedUser.getRole();

            if(role != null){
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userId", loggedUser.getUserId());
                session.setAttribute("role", role);
                response.sendRedirect("DashboardServlet");
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
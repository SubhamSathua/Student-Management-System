<%--
  Created by IntelliJ IDEA.
  User: nalini
  Date: 15-10-2025
  Time: 07:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
   <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>


<header>
    <div class="header-left">
        <h1>Add User</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet"><button class="home-btn">Home</button></a>
        </div>
    </div>
</header>


        <%
            String message = (String) request.getAttribute("message");
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (message != null) {
        %>
        <p class="message success"><%= message %></p>
        <% } %>
        <% if (errorMessage != null) { %>
        <p class="message error"><%= errorMessage %></p>
        <% } %>

        <form action="<%= request.getContextPath() %>/register" method="post" class="user-form">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="text-input" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="text-input" required>
            </div>
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" class="text-input" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="text-input" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="student">Student</option>
                    <option value="teacher">Teacher</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <br>
            <button type="submit" class="btn-submit">Register User</button>
        </form>



</body>
</html>

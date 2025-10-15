<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 15-10-2025
  Time: 07:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="src/styles.css">
</head>
<body>

<header>
    <h1>Register New User</h1>
    <form action="LogoutServlet" method="post" style="display:inline;">
        <button type="submit" class="logout-btn">Logg Out</button>
    </form>
</header>

<div class="card-container">
    <div class="card form-card">

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
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="student">Student</option>
                    <option value="teacher">Teacher</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn-primary">Register User</button>
        </form>

        <div class="back-link">
            <a href="<%= request.getContextPath() %>/adminDashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>

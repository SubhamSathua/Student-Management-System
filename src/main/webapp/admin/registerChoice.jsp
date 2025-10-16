<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 17-10-2025
  Time: 12:49 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New User</title>
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

<div class="card-container" style="margin-top:24px;">
    <a href="registerStudent.jsp" style="text-decoration:none;color:inherit;">
        <div class="card">
            <div class="card-icon">🎓</div>
            <div class="card-text">Register Student</div>
        </div>
    </a>

    <a href="registerTeacher.jsp" style="text-decoration:none;color:inherit;">
        <div class="card">
            <div class="card-icon">👩‍🏫</div>
            <div class="card-text">Register Teacher</div>
        </div>
    </a>
</div>

</body>
</html>

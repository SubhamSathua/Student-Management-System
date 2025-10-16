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
    <title>Register-Choice</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>

<header>
    <h1>Register User</h1>
    <a href="../adminDashboard.jsp" class="btn-submit" style="text-decoration:none;padding:8px 12px;">Back</a>
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

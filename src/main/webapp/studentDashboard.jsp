<%--
  Student Dashboard implementing:
  Academics | Exams | Fees | Admit Card | Marks/Report | Complaints | Timetable | Profile | Logout
  Author: nalin
  Date: 13-10-2025
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>

<header>
    <h1>Student Dashboard</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>

<!-- Top-level navigation cards -->
<div class="card-container">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Academics</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Exams</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Admit Card</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Marks / Report</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Complaints</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Timetable</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Profile</div>
    </div>
</div>


</body>
</html>

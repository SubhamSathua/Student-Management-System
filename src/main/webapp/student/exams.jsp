<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Upcoming Examination Schedule</title>
<link rel="stylesheet" href="../assets/css/styles.css"></head>
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
<header>
    <div class="header-left">
        <h1>Upcoming Examination Schedule</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet">
                <button class="home-btn">Home</button>
            </a>
        </div>
    </div>
</header>

<div class="container mt-5">
    <h2 class="mb-4 text-danger">Examination Schedule</h2>

    <table class="table table-hover table-striped">
        <thead class="table-danger">
        <tr><th>Exam Name</th><th>Subject</th><th>Date</th><th>Time</th><th>Max Marks</th></tr>
        </thead>
        <tbody>
        <c:forEach var="exam" items="${exams}">
            <tr>
                <td>${exam.name}</td>
                <td>${exam.subject}</td>
                <td>${exam.date}</td>
                <td>${exam.time}</td>
                <td>${exam.maxMarks}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <p class="mt-4 alert alert-info">
        Note: Download your Admit Card from the 'Admit Card' section before the main exams.
    </p>
</div>

</body>
</html>

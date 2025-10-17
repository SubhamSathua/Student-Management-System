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
    <div >
        <h1>Add User</h1>
    </div>

    <div>
        <div>
            <div>
                <a href="/DashboardServlet">
                    <button>Home</button>
                </a>
            </div>
        </div>
    </div>
    <header>
        <div>
            <h1>Upcoming Examination Schedule</h1>
        </div>

        <div>
            <div>
                <a href="/DashboardServlet">
                    <button>Home</button>
                </a>
            </div>
        </div>
    </header>

    <div>
        <h2>Examination Schedule</h2>

        <table>
            <thead>
            <tr><th>Exam Name</th><th>Subject</th><th>Date</th><th>Time</th><th>Max Marks</th></tr>
            </thead>
            <tbody>
            <tr>
                <td>Dynamic Exam Name</td>
                <td>Dynamic Subject</td>
                <td>Dynamic Date</td>
                <td>Dynamic Time</td>
                <td>Dynamic Marks</td>
            </tr>
            </tbody>
        </table>

        <p>
            Note: Download your Admit Card from the 'Admit Card' section before the main exams.
        </p>
    </div>
</body>
</html>

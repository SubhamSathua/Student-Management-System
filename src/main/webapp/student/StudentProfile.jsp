<%--
  Created by IntelliJ IDEA.
  User: manoj
  Date: 16-10-2025
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.studentmgmtsys.dao.StudentProfileDAO" %>
<%@ page import="com.studentmgmtsys.model.StudentProfile" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
    <title>Student Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            width: 50%;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            width: 30%;
            background: #f0f0f0;
        }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
        .logout form input {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout form input:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

<%




    StudentProfile student = (StudentProfile) request.getAttribute("student");

%>

<div class="profile-container">
    <h1>My Profile</h1>

    <%
        if (student != null) {
    %>
    <table>
        <tr><th>Full Name</th><td><%= student.getFullName() %></td></tr>
        <tr><th>Email</th><td><%= student.getEmail() %></td></tr>
        <tr><th>Phone</th><td><%= student.getPhone() %></td></tr>
        <tr><th>Address</th><td><%= student.getAddress() %></td></tr>
        <tr><th>Date of Birth</th><td><%= student.getDob() %></td></tr>
        <tr><th>Education</th><td><%= student.getEducation() %></td></tr>
    </table>
    <%
    } else {
    %>
    <p>No profile data found.</p>
    <%
        }
    %>

    <div class="logout">
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout" />
        </form>
    </div>
</div>

</body>
</html>

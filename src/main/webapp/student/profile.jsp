<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 23:00
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
<div class="container mt-5">
    <h2 class="mb-4 text-info">Student Profile</h2>

    <c:set var="student" value="${{
            name: '',
            rollNo: '',
            class: '',
            dob: '',
            address: '',
            phone: '',
            email: 'student@example.com'
        }}"/>

    <div class="card shadow-sm">
        <div class="card-header bg-info text-white">
            Personal Information
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6 mb-3"><strong>Name:</strong> ${student.name}</div>
                <div class="col-md-6 mb-3"><strong>Roll Number:</strong> ${student.rollNo}</div>
                <div class="col-md-6 mb-3"><strong>Class/Section:</strong> ${student.class}</div>
                <div class="col-md-6 mb-3"><strong>Date of Birth:</strong> ${student.dob}</div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm mt-4">
        <div class="card-header bg-info text-white">
            Contact Information
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6 mb-3"><strong>Phone:</strong> ${student.phone}</div>
                <div class="col-md-6 mb-3"><strong>Email:</strong> ${student.email}</div>
                <div class="col-12 mb-3"><strong>Address:</strong> ${student.address}</div>
            </div>
            <a href="#" class="btn btn-outline-info btn-sm">Edit Profile</a>
        </div>
    </div>

</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Academics Overview</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-primary">Academics Overview</h2>



    <div class="row mb-5">
        <div class="col-md-6">
            <div class="card bg-light border-primary shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Overall Attendance</h5>
                    <h1 class="display-3 text-primary"></h1>
                    <p class="card-text text-muted">Last Updated: Oct 15, 2025</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card bg-light border-primary shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Current GPA/Percentage</h5>
                    <h1 class="display-3 text-primary"></h1>
                    <p class="card-text text-muted">Based on latest grades.</p>
                </div>
            </div>
        </div>
    </div>

    <h3>Registered Courses</h3>
    <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="marks.jsp" class="btn btn-sm btn-outline-primary">View Marks</a>
            </li>
    </ul>

</div>
</body>
</html>
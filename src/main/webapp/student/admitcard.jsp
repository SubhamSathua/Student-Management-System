<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admit Card</title>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <style>@media print { .btn-print { display: none; } }</style>
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
    <div class="card p-4 border-dark shadow-lg">
        <h2 class="card-title text-center text-dark mb-4">Official Examination Admit Card</h2>

        <div class="row mb-3">
            <div class="col-6"><strong>Student Name:</strong> </div>
            <div class="col-6"><strong>Roll Number:</strong> </div>
        </div>
        <div class="row mb-4">
            <div class="col-6"><strong>Examination:</strong> </div>
            <div class="col-6"><strong>Center Name:</strong> m</div>
        </div>

        <table class="table table-bordered text-center">
            <thead class="bg-light">
            <tr><th>Date</th><th>Subject Name</th><th>Time</th><th>Room No.</th></tr>
            </thead>
            <tbody>
            <tr><td></td><td></td><td></td><td></td></tr>
            <tr><td></td><td></td><td></td><td></td></tr>
            <tr><td></td><td></td><td></td><td> </td></tr>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <p>Signature of HOD: ___________</p>
            <button onclick="window.print()" class="btn btn-primary btn-print mt-3"><i class="bi bi-printer"></i> Print Admit Card</button>
        </div>
    </div>
</div>
</body>
</html>

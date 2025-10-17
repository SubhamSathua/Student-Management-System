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
    <div>
        <div>
            <h1>Add User</h1>
        </div>

        <div>
            <div>
                <a href="/DashboardServlet"><button>Home</button></a>
            </div>
        </div>
    </div>
    <div>
        <div>
            <h2>Official Examination Admit Card</h2>

            <div>
                <div><strong>Student Name:</strong> </div>
                <div><strong>Roll Number:</strong> </div>
            </div>
            <div>
                <div><strong>Examination:</strong> </div>
                <div><strong>Center Name:</strong> m</div>
            </div>

            <table>
                <thead>
                <tr><th>Date</th><th>Subject Name</th><th>Time</th><th>Room No.</th></tr>
                </thead>
                <tbody>
                <tr><td></td><td></td><td></td><td></td></tr>
                <tr><td></td><td></td><td></td><td></td></tr>
                <tr><td></td><td></td><td></td><td> </td></tr>
                </tbody>
            </table>

            <div>
                <p>Signature of HOD: ___________</p>
                <button> Print Admit Card</button>
            </div>
        </div>
    </div>
</body>
</html>

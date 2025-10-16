<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 22:58
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
    <h2 class="mb-4 text-success">Fees and Payments Status</h2>

    <c:set var="totalDue" value="5000.00"/>
    <c:set var="statusClass" value="${totalDue > 0 ? 'alert-danger' : 'alert-success'}"/>
    <c:set var="statusMessage" value="${totalDue > 0 ? 'Outstanding Dues Exist' : 'All Dues Cleared'}"/>

    <div class="alert ${statusClass} fs-4 fw-bold text-center">
        Current Status: ${statusMessage}
    </div>

    <div class="card mb-5">
        <div class="card-header bg-success text-white">
            Outstanding Fees
        </div>
        <div class="card-body">
            <h5 class="card-title">Total Due: ₹ ${totalDue}</h5>
            <p class="card-text">Due Date: 2025-11-30</p>
            <a href="#" class="btn btn-success">Proceed to Online Payment</a>
        </div>
    </div>

    <h3>Payment History</h3>
    <table class="table table-bordered table-striped">
        <thead class="table-light">
        <tr><th>Date Paid</th><th>Fee Item</th><th>Amount Paid</th><th>Transaction ID</th></tr>
        </thead>
        <tbody>
        <tr><td> </td><td></td><td></td><td></td></tr>
        <tr><td></td><td></td><td></td><td></td></tr>
        </tbody>
    </table>
</div>
</body>
</html>

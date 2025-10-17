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
<div>
    <h2>Fees and Payments Status</h2>

    <div>
        Current Status: [Dynamic Status Message]
    </div>

    <div>
        <div>
            Outstanding Fees
        </div>
        <div>
            <h5>Total Due: ₹ [Dynamic Total Due]</h5>
            <p>Due Date: 2025-11-30</p>
            <a href="#">Proceed to Online Payment</a>
        </div>
    </div>

    <h3>Payment History</h3>
    <table>
        <thead>
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

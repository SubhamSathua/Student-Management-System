<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 16-10-2025
  Time: 11:25 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grivance-</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
<header>
    <h1>Grivancee</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>


<%--cards...--%>
<div class="card-container">
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">New Complaints</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">In Progress</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">Resolved</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">Assign Authority</div>
    </div>


    <section style="margin-top: 30px;">
        <h2>Filter Complaints</h2>
        <form style="max-width: 600px;">
            <label>Status</label>
            <select name="status" class="text-input">
                <option value="">All</option>
                <option>New</option>
                <option>In Progress</option>
                <option>Resolved</option>
                <option>Closed</option>
            </select>

            <label>Category</label>
            <select name="category" class="text-input">
                <option value="">All Categories</option>
                <option>Academic</option>
                <option>Hostel</option>
                <option>Transport</option>
                <option>Fee</option>
                <option>Other</option>
            </select>

            <button type="submit" class="btn-submit">Filter</button>
        </form>
    </section>




</div>

</body>
</html>

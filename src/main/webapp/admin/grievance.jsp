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
    <title>Grievance-</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<header>
    <div class="header-left">
        <h1>Grievancce</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet"><button class="home-btn">Home</button></a>
        </div>
    </div>
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

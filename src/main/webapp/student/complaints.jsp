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
    <title>Submit Complaint/Feedback</title>
    <link rel="stylesheet" href="../assets/css/styles.css"></head>
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
    <h2 class="mb-4 text-warning">Submit Complaint or Feedback</h2>
    <p class="text-muted">Use this form to report issues related to classes, facilities, or administration.</p>

    <form action="ComplaintServlet" method="POST" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="subject" class="form-label">Subject</label>
            <select class="form-select" id="subject" name="subject" required>
                <option selected disabled value="">Choose...</option>
                <option>Infrastructure/Facilities</option>
                <option>Teacher/Course Issue</option>
                <option>Administrative Issue (Fees, Records, etc.)</option>
                <option>Other Feedback</option>
            </select>
            <div class="invalid-feedback">Please select a subject.</div>
        </div>
        <div class="mb-3">
            <label for="details" class="form-label">Details</label>
            <textarea class="form-control" id="details" name="details" rows="5" required></textarea>
            <div class="invalid-feedback">Please provide details of your complaint.</div>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="anonymous" name="anonymous">
            <label class="form-check-label" for="anonymous">Submit Anonymously (If allowed by policy)</label>
        </div>

        <button type="submit" class="btn btn-warning">Submit Complaint</button>
    </form>

    <hr class="mt-5">
    <h4>Recent Complaints Status </h4>
    <ul class="list-group">
        <li class="list-group-item d-flex justify-content-between align-items-center">
<%--            Library AC broken (ID: C001)--%>
            <span class="badge bg-danger">Pending</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
<%--            Incorrect attendance for Math (ID: C002)--%>
            <span class="badge bg-success">Resolved</span>
        </li>
    </ul>

</div>
</body>
</html>
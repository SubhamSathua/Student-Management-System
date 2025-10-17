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
<div>
    <h2>Submit Complaint or Feedback</h2>
    <p>Use this form to report issues related to classes, facilities, or administration.</p>

    <form action="" method="POST">
        <div>
            <label for="subject">Subject</label>
            <select id="subject" name="subject">
                <option selected disabled value="">Choose...</option>
                <option>Infrastructure/Facilities</option>
                <option>Teacher/Course Issue</option>
                <option>Administrative Issue (Fees, Records, etc.)</option>
                <option>Other Feedback</option>
            </select>
            <div>Please select a subject.</div>
        </div>
        <div>
            <label for="details">Details</label>
            <textarea id="details" name="details" rows="5"></textarea>
            <div>Please provide details of your complaint.</div>
        </div>
        <div>
            <input type="checkbox" id="anonymous" name="anonymous">
            <label for="anonymous">Submit Anonymously (If allowed by policy)</label>
        </div>

        <button type="submit">Submit Complaint</button>
    </form>

    <hr>
    <h4>Recent Complaints Status </h4>
    <ul>
        <li>
            <span>Pending</span>
        </li>
        <li>
            <span>Resolved</span>
        </li>
    </ul>

</div>
</body>
</html>
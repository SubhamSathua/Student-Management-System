<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 16-10-2025
  Time: 11:05 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reports</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
<header>
    <h1>Reports</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>

<div class="card-container">
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">Student Reports</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">Fee Reports</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">Exam Reports</div>
    </div>
    <div class="card">
        <div class="card-icon">#</div>
        <div class="card-text">System Logs</div>
    </div>
</div>


<section style="margin-top: 30px;">
    <h2>Generate Report</h2>
    <form style="max-width: 600px;">
        <label>Report Type</label>
        <select name="reportType" class="text-input" required>
            <option value="">Select report type</option>
            <option>Student List</option>
            <option>Fee Collection Summary</option>
            <option>Exam Results Summary</option>
            <option>Attendance Report</option>
            <option>System Activity Logs</option>
        </select>

        <label>From Date</label>
        <input name="fromDate" type="date" class="text-input"/>

        <label>To Date</label>
        <input name="toDate" type="date" class="text-input"/>

        <label>Semester (optional)</label>
        <select name="semester" class="text-input">
            <option value="">All Semesters</option>
            <option>Sem 1</option>
            <option>Sem 2</option>
            <option>Sem 3</option>
            <option>Sem 4</option>
            <option>Sem 5</option>
            <option>Sem 6</option>
        </select>

        <button type="submit" class="btn-submit">Generate Report</button>
    </form>
</section>

<section style="margin-top: 40px;">
    <h2>Quick Statistics</h2>
    <div class="card-container">
        <div class="card">
            <div class="card-text">Total Students</div>
            <h2 style="margin: 10px 0; color: #0078d4;">1,245</h2>
        </div>
        <div class="card">
            <div class="card-text">Fees Collected</div>
            <h2 style="margin: 10px 0; color: #28a745;">₹45,67,000</h2>
        </div>
        <div class="card">
            <div class="card-text">Pending Fees</div>
            <h2 style="margin: 10px 0; color: #dc3545;">₹12,34,000</h2>
        </div>
        <div class="card">
            <div class="card-text">Active Teachers</div>
            <h2 style="margin: 10px 0; color: #17a2b8;">87</h2>
        </div>
    </div>
</section>

<section style="margin-top: 40px;">
    <h2>Recent Reports</h2>
    <table>
        <thead>
        <tr>
            <th>Report Name</th>
            <th>Generated Date</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Student List - Sem 3</td>
            <td>2025-10-15</td>
            <td>Student Report</td>
            <td><button class="btn-submit">Download</button></td>
        </tr>
        <tr>
            <td>Fee Collection - Oct 2025</td>
            <td>2025-10-14</td>
            <td>Fee Report</td>
            <td><button class="btn-submit">Download</button></td>
        </tr>
        <tr>
            <td>Exam Results - Mid Term</td>
            <td>2025-10-10</td>
            <td>Exam Report</td>
            <td><button class="btn-submit">Download</button></td>
        </tr>
        </tbody>
    </table>
</section>

</body>
</html>

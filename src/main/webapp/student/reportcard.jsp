<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 16-10-2025
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Report Card</title>
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
    <h2>Term-1 Academic Report Card</h2>

    <div>
        <div>
            <div><strong>Student:</strong> [Dynamic Student Name]</div>
            <div><strong>Class:</strong> Grade 10</div>
        </div>

        <table>
            <thead>
            <tr><th>Subject</th><th>Score (Max 100)</th><th>Grade</th><th>Teacher Remarks</th></tr>
            </thead>
            <tbody>
            <tr>
                <td>[Dynamic Subject]</td>
                <td>[Dynamic Score]</td>
                <td>[Dynamic Grade]</td>
                <td>[Dynamic Remarks]</td>
            </tr>
            </tbody>
        </table>

        <div>
            <strong>Overall Percentage: [Dynamic Percentage]%</strong>
        </div>

        <div>
            <button> Print Report Card</button>
        </div>
    </div>
</div>
</body>
</html>

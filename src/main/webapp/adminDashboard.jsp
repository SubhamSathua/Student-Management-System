<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
<header>
    <h1>Welcome, Admin</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>
<div>
<%
    String status = (String) session.getAttribute("status");
    if ("success".equals(status)) {
        out.println("<span class='success'>Student registered successfully!</span>");
    } else if ("error".equals(status)) {
        out.println("<span class='error'>Registration failed. Please try again.</span>");
    } else {
        out.println("<span></span>");
    }
    session.removeAttribute("status");
%>
</div>
<div class="card-container">
    <a href="admin/registerChoice.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Add/Register User</div>
        </div>
    </a>

<%--    <div class="card">--%>
<%--        <div class="card-icon"></div>--%>
<%--        <div class="card-text">User Management</div>--%>
<%--    </div>--%>
    <a href="admin/courseSetup.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Course Setup</div>
        </div>
    </a>
    <a href="admin/feesControl.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees Control</div>
    </div>
    </a>

    <a href="admin/exam.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Exam</div>
    </div>
    </a>

    <a href="admin/reports.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Reports</div>
    </div>
    </a>

    <a href="admin/grievance.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Grievance</div>
    </div>
    </a>

    <a href="admin/profile.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Profile</div>
        </div>
    </a>

</div>

</body>
</html>

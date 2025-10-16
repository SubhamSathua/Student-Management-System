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


<div class="card-container">
    <a href="<%= request.getContextPath() %>/admin/registerUser.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Add/Register User</div>
        </div>
    </a>

    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">User Management</div>
    </div>
    <a href="<%= request.getContextPath() %>/admin/courseSetup.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Course Setup</div>
        </div>
    </a>
    <a href="<%= request.getContextPath() %>/admin/feesControl.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees Control</div>
    </div>
    </a>

    <a href="<%= request.getContextPath() %>/admin/exam.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Exam</div>
    </div>
    </a>

    <a href="<%= request.getContextPath() %>/admin/reports.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Reports</div>
    </div>
    </a>

    <a href="<%= request.getContextPath() %>/admin/grievance.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Grievance</div>
    </div>
    </a>

    <a href="<%= request.getContextPath() %>/admin/profile.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Profile</div>
        </div>
    </a>

</div>

</body>
</html>

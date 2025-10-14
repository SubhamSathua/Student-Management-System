<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="src/styles.css">
</head>
<body>

<header>
    <h1>Welcome, Admin</h1>
    <form action="LogoutServlet" method="post" style="display:inline;">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>


<div class="card-container">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Add/Register User</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">User Management</div>
    </div>
    <a href="courseSetup.jsp">
        <div class="card">
            <div class="card-icon"></div>
            <div class="card-text">Course Setup</div>
        </div>
    </a>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees Control</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Exam</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Reports</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Grievance</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Profile</div>
    </div>
</div>

</body>
</html>

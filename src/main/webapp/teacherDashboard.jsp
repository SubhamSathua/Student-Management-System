<%--
  Teacher Dashboard (no JS)
  User: manoj
  Date: 13-10-2025
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" href="src/styles.css">
</head>
<body>

<header>
    <h1>Welcome teacher</h1>
    <form action="LogoutServlet" method="post" style="display:inline;">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>

<div class="card-container">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Courses</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Marks</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Profile</div>
    </div>
</div>

</body>
</html>

<!DOCTYPE html>
<%
    // Prevent caching and ensure user is logged in as admin
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in and has admin role
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"admin".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
<!-- Top navigation: Home button, title, Logout button
     Keep class "header" for compatibility with dynamic loader scripts -->
<div class="header">
    <div class="header-left">
        <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
    </div>
    <h1 id="headerTitle">Welcome, Admin</h1>
    <div class="header-right">
        <form action="LogoutServlet" method="post" class="logout-form">
            <button type="submit" class="logout-btn">Log Out</button>
        </form>
    </div>
</div>
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
<div class="card-container" id="dashboardContent">
    <a href="registerStudent">
        <div class="card">
            <div class="card-icon"><img src="assets/icons/user.png" alt=""></div>
            <div class="card-text">Register Student</div>
        </div>
    </a>

    <a href="CourseServlet">
        <div class="card">
            <div class="card-icon"><img src="assets/icons/online-education.png" alt=""></div>
            <div class="card-text">Course Setup</div>
        </div>
    </a>
    <!-- <a href="admin/feesControl.jsp">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees Control</div>
    </div>
    </a> -->
    <a href="grievance">
    <div class="card">
        <div class="card-icon"><img src="assets/icons/complain.png" alt=""></div>
        <div class="card-text">Grievance</div>
    </div>
    </a>


</div>

<script>
    // Prevent browser back button from going to login page
    if (window.history && window.history.pushState) {
        window.history.pushState('forward', null, './DashboardServlet');
        window.addEventListener('popstate', function() {
            window.history.pushState('forward', null, './DashboardServlet');
        });
    }
</script>
</body>
</html>

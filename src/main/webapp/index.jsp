<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Prevent caching to avoid login page showing after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // Check if user is already logged in
    HttpSession userSession = request.getSession(false);
    if (userSession != null && userSession.getAttribute("role") != null) {
        // User is already logged in, redirect to appropriate dashboard
        String role = (String) userSession.getAttribute("role");
        if ("admin".equals(role)) {
            response.sendRedirect("DashboardServlet");
            return;
        } else if ("student".equals(role)) {
            response.sendRedirect("DashboardServlet");
            return;
        } 
    }
%>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>

<div class="login-layout">
    <!-- Left Column - Text Content -->
    <div class="left-column">
        <div class="content-wrapper">
            <div class="brand-logo">
                <h1>Student Management System</h1>
            </div>
            
            <div class="hero-content">
                <h2>Powering student-centric education in university.</h2>
                <p>We help students to manage their academics.</p>
            </div>
            
            <div class="footer-text">
                <p>Student Management System is a simple manage webapp.</p>
                <p class="copyright">2025 © All rights reserved & Privacy Policy</p>
            </div>
        </div>
    </div>
    
    <!-- Right Column - Login Form -->
    <div class="right-column">
        <div class="login-container">
            <div class="university-header">
                <img src="assets/icons/logo.png" alt="University Logo" class="university-logo">
                <div class="university-info">
                    <h3>STARHILL</h3>
                    <h4>UNIVERSITY</h4>
                    <!-- <p class="tagline">Shaping Lives,<br>Empowering Communities...</p> -->
                </div>
            </div>

            <form action="LoginServlet" method="post" class="login-form">
                <div class="form-group">
                    <input type="text" id="username" name="username" placeholder="Login Id" required>
                </div>

                <div class="form-group">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                
            

                <input type="submit" value="LOGIN" class="btn-login">
            </form>

            <% String error = (String) request.getAttribute("error");
                if (error != null) { %>
            <p class="errMsg"><%= error %></p>
            <% } %>
        </div>
    </div>
</div>

<script>
    // Prevent browser back button from showing login page after login
    if (window.history && window.history.pushState) {
        window.history.pushState('forward', null, './');
        window.addEventListener('popstate', function() {
            window.history.pushState('forward', null, './');
        });
    }
</script>

</body>
</html>

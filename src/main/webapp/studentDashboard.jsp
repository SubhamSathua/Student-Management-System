<%-- Student Dashboard implementing: Academics | Exams | Fees | Admit Card | Marks/Report | Complaints | Timetable |
    Profile | Logout Author: nalin Date: 13-10-2025 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Prevent caching and ensure user is logged in as student
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in and has student role
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"student".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>Student Dashboard</title>
            <link rel="stylesheet" href="assets/css/styles.css">
        </head>

        <body>

            <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                </div>
                <h1 id="headerTitle">Welcome, Student</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

            <div class="card-container">

                <a href="listAllCourses">
                    <div class="card">
                        <div class="card-icon"><img src="assets/icons/online-education.png" alt=""></div>
                        <div class="card-text">Register Course</div>
                    </div>
                </a>

                <!-- <a href="student/admitcard.jsp">
                    <div class="card">
                        <div class="card-icon"></div>
                        <div class="card-text">Admit Card</div>
                    </div>
                </a> -->

                <a href="complaints">
                    <div class="card">
                        <div class="card-icon"><img src="assets/icons/complain.png" alt=""></div>
                        <div class="card-text">Complaints</div>
                    </div>
                </a>

                <a href="fees">
                    <div class="card">
                        <div class="card-icon"><img src="assets/icons/receipt.png" alt=""></div>
                        <div class="card-text">Fees</div>
                    </div>
                </a>

                <a href="StudentProfile">
                    <div class="card">
                        <div class="card-icon"><img src="assets/icons/profile.png" alt=""></div>
                        <div class="card-text">Profile</div>
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
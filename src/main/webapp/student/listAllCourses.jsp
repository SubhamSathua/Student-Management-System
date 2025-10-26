<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmtsys.model.Course" %>
<%
    // Prevent caching and ensure user is logged in as student
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in and has student role
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"student".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Available Courses</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <style>
        .course-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .course-header {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }
        .course-table {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .course-table table {
            width: 100%;
            border-collapse: collapse;
        }
        .course-table th {
            background: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        .course-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }
        .course-table tbody tr:hover {
            background: #f8f9fa;
        }
        .course-table tbody tr:last-child td {
            border-bottom: none;
        }
        .no-courses {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        .error-message {
            background: #ffebee;
            border: 1px solid #f44336;
            color: #d32f2f;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .register-btn {
            background: #28a745;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .register-btn:hover {
            background: #218838;
        }
        .registered-text {
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>
    
           <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/online-education.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">course Registration</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<div class="course-container">
    <!-- Error Message Display -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
    <%
        }
    %>

    <div class="course-header">
        <h2>Available Courses</h2>
        <%
            String studentBranch = (String) request.getAttribute("studentBranch");
            Integer studentSemester = (Integer) request.getAttribute("studentSemester");
            if (studentBranch != null && studentSemester != null) {
        %>
            <p>Showing courses for <strong><%= studentBranch %></strong> branch, Semester <strong><%= studentSemester %></strong></p>
        <%
            }
        %>
    </div>

    <%
        List<Course> availableCourses = (List<Course>) request.getAttribute("availableCourses");
        if (availableCourses != null && !availableCourses.isEmpty()) {
    %>
        <div class="course-table">
            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <th>Credits</th>
                        <th>Registration Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Course course : availableCourses) {
                    %>
                    <tr>
                        <td><strong><%= course.getCourseCode() %></strong></td>
                        <td><%= course.getCourseName() %></td>
                        <td><%= course.getBranch() %></td>
                        <td><%= course.getSemester() %></td>
                        <td><%= course.getCredits() %></td>
                        <td>
                            <% if (course.getRegistered() == 1) { %>
                                <span class="registered-text">Registered</span>
                            <% } else { %>
                                <span style="color: #dc3545;">Not Registered</span>
                            <% } %>
                        </td>
                        <td>
                            <% if (course.getRegistered() == 1) { %>
                                <span class="registered-text">✓ Enrolled</span>
                            <% } else { %>
                                <form action="<%= request.getContextPath() %>/listAllCourses" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="registerCourse">
                                    <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">
                                    <button type="submit" class="register-btn">Register</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    <%
        } else {
    %>
        <div class="no-courses">
            <h3>No Courses Available</h3>
            <p>There are no active courses available for your branch and semester at the moment.</p>
            <p>Please contact the administration if you believe this is an error.</p>
        </div>
    <%
        }
    %>
</div>

<script>
    // Update header title when this page loads
    try {
        if (parent && parent.document) {
            const headerTitle = parent.document.getElementById('headerTitle');
            if (headerTitle) {
                headerTitle.textContent = 'Available Courses';
            }
        }
    } catch (e) {
        // Handle cross-origin restrictions
        console.log('Could not update header title');
    }
</script>

</body>
</html>
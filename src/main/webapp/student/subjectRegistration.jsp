<%--
  File: courseRegistration.jsp
  Purpose: Course Registration Form and Listing Page
  User: chandan
  Date: 16-10-2025
  Time: 09:12 pm
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Registration & Management</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<header class="main-header">
    <div class="header-left">
        <a href="main.jsp">Admin/Teacher Portal</a>
        <span>/ Course Management</span>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet"><button class="home-btn">Home</button></a>
        </div>
    </div>
</header>

<main class="content-container">
    <h1>Subject and Course Registration</h1>

    <section class="add-course-section">
        <h2>Add New Course</h2>

        <form action="CourseRegistrationServlet" method="POST" class="course-form">
            <div class="form-grid">
                <div class="form-group">
                    <label for="courseCode">Course Code (e.g., CS101)</label>
                    <input type="text" id="courseCode" name="course_code" required>
                </div>
                <div class="form-group">
                    <label for="courseName">Course Name</label>
                    <input type="text" id="courseName" name="course_name" required>
                </div>
                <div class="form-group">
                    <label for="branch">Branch/Department</label>
                    <input type="text" id="branch" name="branch" required>
                </div>
                <div class="form-group">
                    <label for="semester">Semester</label>
                    <input type="number" id="semester" name="semester" min="1" required>
                </div>
                <div class="form-group">
                    <label for="credits">Credits</label>
                    <input type="number" id="credits" name="credits" min="1" max="6" required>
                </div>
            </div>
            <div class="form-submit">
                <button type="submit" class="register-btn">Register Course</button>
            </div>
        </form>
    </section>

    <hr>

    <section class="available-courses-section">
        <h2>Available Courses (Current Semester)</h2>

        <div class="course-list-table">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Branch</th>
                    <th>Sem</th>
                    <th>Credits</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="8" class="no-courses-message">
                        <span class="info-icon">ℹ️</span>
                        No courses are currently registered. Use the form above to add one.
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</main>
</body>
</html>
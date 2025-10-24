<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 17-10-2025
  Time: 12:49 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>

<header>
    <div class="header-left">
        <h1>Student Registration</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet">
                <button class="home-btn">Home</button>
            </a>
        </div>
    </div>
</header>

<section style="margin-top: 24px;">
    <form action="<%= request.getContextPath() %>/registerStudent" method="post" style="max-width: 720px;">
        <!-- Login account -->
        <h3>Login Account</h3>
        <p>
            <label>Username</label>
            <input name="username" class="text-input" placeholder="e.g., stud23101" required/>
        </p>
        <p>
            <label>Password</label>
            <input name="password" type="password" class="text-input" placeholder="temporary password" required/>
        </p>
        <p>
            <label>Status</label>
            <select name="status" class="text-input" required>
                <option>active</option>
                <option>inactive</option>
            </select>
        </p>

        <h3 style="margin-top:18px;">Student Details</h3>
        <p>
            <label>Registration No</label>
            <input name="registrationNo" class="text-input" placeholder="e.g., 23BCS001" required/>
        </p>
        <p>
            <label>Department</label>
            <input name="department" class="text-input" placeholder="e.g., CSE" required/>
        </p>
        <p>
            <label>Semester</label>
            <select name="semester" class="text-input">
                <option>Sem 1</option>
                <option>Sem 2</option>
                <option>Sem 3</option>
                <option>Sem 4</option>
                <option>Sem 5</option>
                <option>Sem 6</option>
            </select>
        </p>
        <p>
            <label>Admission Year</label>
            <input name="admissionYear" class="text-input" placeholder="e.g., 2025"/>
        </p>

        <h3 style="margin-top:18px;">Profile (Optional)</h3>
        <p>
            <label>Full Name</label>
            <input name="fullName" class="text-input" placeholder="Student full name"/>
        </p>
        <p>
            <label>Email</label>
            <input name="email" type="email" class="text-input" placeholder="student@email.com"/>
        </p>
        <p>
            <label>Phone</label>
            <input name="phone" class="text-input" placeholder="+91-XXXXXXXXXX"/>
        </p>

        <p>
            <button type="submit" class="btn-submit">Create Student</button>
        </p>
    </form>
</section>
</body>
</html>
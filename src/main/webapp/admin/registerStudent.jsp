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
    <title>Title</title>
</head>
<body>

<header>
    <h1>Student Registreation </h1>
    <a href="registerChoice.jsp" class="btn-submit" style="text-decoration:none;padding:8px 12px;">Back</a>
</header>

<section style="margin-top: 24px;">
    <form action="<%= request.getContextPath() %>/user/register/student" method="post" style="max-width: 720px;">
        <!-- Login account -->
        <h3>Login Account</h3>
        <label>Username</label>
        <input name="username" class="text-input" placeholder="e.g., stud23101" required/>
        <label>Password</label>
        <input name="password" type="password" class="text-input" placeholder="temporary password" required/>
        <label>Status</label>
        <select name="status" class="text-input" required>
            <option>active</option>
            <option>inactive</option>
        </select>


        <h3 style="margin-top:18px;">Student Details</h3>
        <label>Registration No</label>
        <input name="registrationNo" class="text-input" placeholder="e.g., 23BCS001" required/>
        <label>Department</label>
        <input name="department" class="text-input" placeholder="e.g., CSE" required/>
        <label>Semester</label>
        <select name="semester" class="text-input">
            <option>Sem 1</option><option>Sem 2</option><option>Sem 3</option>
            <option>Sem 4</option><option>Sem 5</option><option>Sem 6</option>
        </select>
        <label>Admission Year</label>
        <input name="admissionYear" class="text-input" placeholder="e.g., 2025"/>


        <h3 style="margin-top:18px;">Profile (Optional)</h3>
        <label>Full Name</label>
        <input name="fullName" class="text-input" placeholder="Student full name"/>
        <label>Email</label>
        <input name="email" type="email" class="text-input" placeholder="student@email.com"/>
        <label>Phone</label>
        <input name="phone" class="text-input" placeholder="+91-XXXXXXXXXX"/>

        <button type="submit" class="btn-submit" style="margin-top:16px;">Create Student</button>
    </form>
</section>
</body>
</html>

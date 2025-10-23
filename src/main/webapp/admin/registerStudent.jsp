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
    <form action="<%= request.getContextPath() %>/registerStudent" method="post" style="max-width: 720px;" id="regForm" class="form">
        <h3>Student Login Details</h3>
        <label>Username</label>
        <input name="stud_username" class="text-input" placeholder="e.g.CSE23001" required/>

        <label>Password</label>
        <input name="stud_password" type="password" class="text-input" placeholder="Password" required/>

        <label>Status</label>
        <select name="status" class="text-input" required>
            <option>active</option>
            <option>inactive</option>
        </select>

        <h3 style="margin-top:18px;">Student Academic Details</h3>
        <label>Registration No</label>
        <input name="registrationNo" class="text-input" placeholder="e.g., CSE23001" required/>

        <label>Department</label>
        <input name="department" class="text-input" placeholder="e.g. CSE" required/>

        <label>Semester</label>
        <select name="semester" class="text-input">
            <option>Sem 1</option>
            <option>Sem 2</option>
            <option>Sem 3</option>
            <option>Sem 4</option>
            <option>Sem 5</option>
            <option>Sem 6</option>
            <option>Sem 7</option>
            <option>Sem 8</option>
        </select>

        <label>Admission Year</label>
        <input name="admissionYear" class="text-input" placeholder="e.g. 2025" required/>

        <h3 style="margin-top:18px;">Student Profile</h3>
        <label>Full Name</label>
        <input name="fullName" class="text-input" placeholder="Student full name" required/>

        <label>Email</label>
        <input name="email" type="email" class="text-input" placeholder="student@email.com" required/>

        <label>Phone</label>
        <input name="phone" type="tel" class="text-input" pattern="\d{10}" maxlength="10" placeholder="Enter Student's mobile" required/>

<%--        TODO: Implement--%>
        <label>Address</label>
        <input name="address" type="text" class="text-input" placeholder="Enter Student Address" required/>

        <label>Date Of Birth</label>
        <input name="dob" type="date" class="text-input" value="2005-01-01" placeholder="Enter Date of Birth" id="dob" required/>

        <label>Father's Name</label>
        <input name="fatherName" type="text" class="text-input" placeholder="Enter Father's Name" required/>

        <label>Father's Mobile</label>
        <input name="fatherMobile" type="tel" pattern="\d{10}" maxlength="10" class="text-input" placeholder="Enter Father's Mobile Number" required/>

        <label>Mother's Name</label>
        <input name="motherName" type="text" class="text-input" placeholder="Enter Mother's Name" required/>

        <label>Mother's Mobile</label>
        <input name="motherMobile" type="tel" pattern="\d{10}" maxlength="10" class="text-input" placeholder="Enter Mother's Mobile Number" required/>

        <label>Highest Education</label>
        <input name="education" type="text" class="text-input" placeholder="Enter Highest Education" required/>


        <button type="submit" class="btn-submit">Create Student</button>
    </form>
</section>

<script>
    const form = document.getElementById('regForm');
    const dobInput = document.getElementById('dob');

    dobInput.max = new Date().toISOString().split("T")[0];
</script>
</body>
</html>
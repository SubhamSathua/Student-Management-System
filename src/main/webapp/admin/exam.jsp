<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 16-10-2025
  Time: 10:04 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Exams</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<header>
    <div class="header-left">
        <h1>Exam Management</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet"><button class="home-btn">Home</button></a>
        </div>
    </div>
</header>


<div class="card-container">
    <div class="card-icon">📅</div>
    <div class="card-text">Schedule Exam</div>
</div>
<div class="card">
    <div class="card-icon">📝</div>
    <div class="card-text">Upload Results</div>
</div>
<div class="card">
    <div class="card-icon">🎫</div>
    <div class="card-text">Admit Cards</div>
</div>

<div class="card">
    <div class="card-icon">📊</div>
    <div class="card-text">View Results</div>
</div>

<section>
    <h2>S chedule New Exam</h2>
    <form style="max-width: 600px;">
        <label>Course Code</label>
        <input name="courseCode" type="text" class="text-input" placeholder="e.g., CS101" required/>

        <label>Course Name</label>
        <input name="courseName" type="text" class="text-input" placeholder="e.g., Data Structures" required/>


        <label>Exam Date</label>
        <input name="examDate" type="date" class="text-input" required/>

        <label>Start Time</label>
        <input name="startTime" type="time" class="text-input" required/>

        <label>Duration (hours)</label>
        <input name="duration" type="number" class="text-input" placeholder="e.g., 3" required/>


        <label>Semester</label>
        <select name="semester" class="text-input" required>
            <option value="">Select semester</option>
            <option>Sem 1</option>
            <option>Sem 2</option>
            <option>Sem 3</option>
            <option>Sem 4</option>
            <option>Sem 5</option>
            <option>Sem 6</option>
        </select>




        <button type="submit" class="btn-submit">Schedule Exam</button>
    </form>
</section>

</body>
</html>

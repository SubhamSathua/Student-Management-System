<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmtsys.model.Course " %>
<%@ page import="com.studentmgmtsys.dao.CourseDAO " %>
<html>
<head>
    <title>Course Setup</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        form { width: 80%; margin: 20px auto; display: flex; gap: 10px; }
        input, select { padding: 5px; }
        button { padding: 5px 10px; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Course Setup</h2>

    <!-- Add Course Form -->
    <form action="<%=request.getContextPath()%>/CourseServlet" method="post">
        <input type="text" name="courseCode" placeholder="Course Code" required>
        <input type="text" name="courseName" placeholder="Course Name" required>
        <input type="text" name="branch" placeholder="Branch" required>
        <input type="number" name="semester" placeholder="Semester" min="1" required>
        <input type="number" name="credits" placeholder="Credits" min="1" required>
        <select name="status">
            <option value="active">Active</option>
            <option value="inactive">Inactive</option>
        </select>
        <button type="submit">Add Course</button>
    </form>

    <!-- View Courses -->
    <%
        CourseDAO dao = new CourseDAO();
        List<Course> courses = dao.getAllCourses();
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Name</th>
            <th>Branch</th>
            <th>Semester</th>
            <th>Credits</th>
            <th>Status</th>
        </tr>
        <%
            for(Course c : courses){
        %>
        <tr>
            <td><%=c.getCourseId()%></td>
            <td><%=c.getCourseCode()%></td>
            <td><%=c.getCourseName()%></td>
            <td><%=c.getBranch()%></td>
            <td><%=c.getSemester()%></td>
            <td><%=c.getCredits()%></td>
            <td><%=c.getStatus()%></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>

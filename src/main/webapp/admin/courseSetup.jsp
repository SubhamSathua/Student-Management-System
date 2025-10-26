<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmtsys.model.Course " %>
<%@ page import="com.studentmgmtsys.dao.CourseDAO " %>
<html>
<head>
    <title>Course Setup</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        #courseInp { width: 80%; margin: 20px auto; display: flex; gap: 10px; }
        #courseInp input, select { padding: 5px; }
    </style>
</head>

<body>
 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/online-education.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">Course Setup</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>


    <form action="CourseServlet" method="post" id="courseInp">
        <input type="text" name="courseCode" id="courseCodeInput" placeholder="Course Code" required>
        <input type="text" name="courseName" placeholder="Course Name" required>
        <select name="branch" required>
            <option>BCA</option>
            <option>MCA</option>
            <option>BTECH-CS</option>
            <option>BTECH-IT</option>
            <option>BSC-CS</option>
            <option>MSC-CS</option>
            <option>BTECH-ECE</option>
            <option>BTECH-EEE</option>
            <option>BTECH-MECH</option>
            <option>BTECH-CIVIL</option>
        </select>
        <input type="number" name="semester" placeholder="Semester" min="1" max="8" required>
        <input type="number" name="credits" placeholder="Credits" min="1" required>
        <select name="status">
            <option value="active">Active</option>
            <option value="inactive">Inactive</option>
        </select>
        <button type="submit" id="addCourseBtn">Add Course</button>
    </form>
    
    <!-- Duplicate Course Warning -->
    <div id="duplicateWarning" style="display: none; color: #dc3545; text-align: center; margin: 10px; padding: 10px; background: #f8d7da; border: 1px solid #f5c6cb; border-radius: 5px;">
        <strong>Duplicate Course:</strong> Course code already exists! Please use a different course code.
    </div>


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
            <th>Action</th>
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
            <td>
                <% if("active".equals(c.getStatus())) { %>
                    <form action="CourseServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="updateStatus">
                        <input type="hidden" name="courseId" value="<%=c.getCourseId()%>">
                        <input type="hidden" name="newStatus" value="inactive">
                        <button type="submit" style="background:#dc3545; color:white; border:none; padding:4px 8px; border-radius:3px; cursor:pointer;">
                            Inactive
                        </button>
                    </form>
                <% } else { %>
                    <form action="CourseServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="updateStatus">
                        <input type="hidden" name="courseId" value="<%=c.getCourseId()%>">
                        <input type="hidden" name="newStatus" value="active">
                        <button type="submit" style="background:#28a745; color:white; border:none; padding:4px 8px; border-radius:3px; cursor:pointer;">
                            Activate
                        </button>
                    </form>
                <% } %>
            </td>
        </tr>
        <%
            }
        %>
    </table>

<script>
    // Get all existing course codes from the table
    function getExistingCourseCodes() {
        const courseCodes = [];
        const tableRows = document.querySelectorAll('table tr');
        
        // Skip header row (index 0)
        for (let i = 1; i < tableRows.length; i++) {
            const codeCell = tableRows[i].cells[1]; // Course code is in second column
            if (codeCell) {
                courseCodes.push(codeCell.textContent.trim().toLowerCase());
            }
        }
        return courseCodes;
    }

    // Validate course code in real-time
    function validateCourseCode() {
        const courseCodeInput = document.getElementById('courseCodeInput');
        const duplicateWarning = document.getElementById('duplicateWarning');
        const addCourseBtn = document.getElementById('addCourseBtn');
        
        const enteredCode = courseCodeInput.value.trim().toLowerCase();
        const existingCodes = getExistingCourseCodes();
        
        if (enteredCode && existingCodes.includes(enteredCode)) {
            // Show duplicate warning
            duplicateWarning.style.display = 'block';
            addCourseBtn.disabled = true;
            addCourseBtn.style.background = '#6c757d';
            addCourseBtn.style.cursor = 'not-allowed';
            courseCodeInput.style.borderColor = '#dc3545';
            return false;
        } else {
            // Hide warning and enable button
            duplicateWarning.style.display = 'none';
            addCourseBtn.disabled = false;
            addCourseBtn.style.background = '';
            addCourseBtn.style.cursor = 'pointer';
            courseCodeInput.style.borderColor = '';
            return true;
        }
    }

    // Add event listeners
    document.addEventListener('DOMContentLoaded', function() {
        const courseCodeInput = document.getElementById('courseCodeInput');
        const courseForm = document.getElementById('courseInp');
        
        // Check for duplicates on input
        courseCodeInput.addEventListener('input', validateCourseCode);
        courseCodeInput.addEventListener('blur', validateCourseCode);
        
        // Prevent form submission if duplicate
        courseForm.addEventListener('submit', function(event) {
            if (!validateCourseCode()) {
                event.preventDefault();
                alert('Cannot add course: Course code already exists!');
                return false;
            }
        });
    });
</script>

</body>
</html>

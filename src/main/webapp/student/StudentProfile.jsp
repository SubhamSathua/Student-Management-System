
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.studentmgmtsys.model.CompleteStudentProfile" %>
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
    <title>Student Profile</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
        }
        
        .profile-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .profile-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .profile-section h3 {
            border-bottom: 2px solid #eee;
            padding-bottom: 8px;
        }
        
        .profile-table {
            width: 100%;
        }
        
        .profile-table th, .profile-table td {
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .profile-table th {
            font-weight: bold;
            color: #666;
            width: 30%;
        }
    
        .btn-primary {
            background: #333;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-bottom: 20px;
        }
        
        .btn-primary:hover {
            background: #555;
        }
        
        .btn-secondary {
            background: white;
            color: #333;
            border: 2px solid #ddd;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }
        
        .btn-secondary:hover {
            background: #f5f5f5;
        }
        
        .text-input, textarea {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
            font-size: 14px;
            box-sizing: border-box;
        }
        
        .text-input:focus, textarea:focus {
            outline: none;
            border-color: #333;
        }
        
        label {
            display: block;
        }
        
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .form-section {
            display: none;
        }
    </style>
</head>
<body>

 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/profile.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">Student Profile</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<div class="profile-container">
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");
        
        if (successMessage != null) {
    %>
        <div class="success-message"><%= successMessage %></div>
    <%
        }
        
        if (errorMessage != null) {
    %>
        <div class="error-message"><%= errorMessage %></div>
    <%
        }
        
        CompleteStudentProfile profile = (CompleteStudentProfile) request.getAttribute("profile");
        if (profile != null) {
    %>

    <!-- View Mode -->
    <div id="viewMode">
        <div class="profile-section">
            <h3>Login Information</h3>
            <table class="profile-table">
                <tr><th>User ID</th><td><%= profile.getUserId() %></td></tr>
                <tr><th>Username</th><td><%= profile.getUsername() %></td></tr>
                <tr><th>Role</th><td><%= profile.getRole() %></td></tr>
                <tr><th>Status</th><td><%= profile.getLoginStatus() %></td></tr>
            </table>
        </div>

        <div class="profile-section">
            <h3>Academic Information</h3>
            <table class="profile-table">
                <tr><th>Registration No</th><td><%= profile.getRegistrationNo() != null ? profile.getRegistrationNo() : "Not Available" %></td></tr>
                <tr><th>Department</th><td><%= profile.getDepartment() != null ? profile.getDepartment() : "Not Available" %></td></tr>
                <tr><th>Semester</th><td><%= profile.getSemester() != null ? profile.getSemester() : "Not Available" %></td></tr>
                <tr><th>Admission Year</th><td><%= profile.getAdmissionYear() != null ? profile.getAdmissionYear() : "Not Available" %></td></tr>
                <tr><th>Status</th><td><%= profile.getStudentStatus() != null ? profile.getStudentStatus() : "Not Available" %></td></tr>
            </table>
        </div>

        <div class="profile-section">
            <h3>Personal Information</h3>
            <table class="profile-table">
                <tr><th>Full Name</th><td><%= profile.getFullName() != null ? profile.getFullName() : "Not Available" %></td></tr>
                <tr><th>Email</th><td><%= profile.getEmail() != null ? profile.getEmail() : "Not Available" %></td></tr>
                <tr><th>Phone</th><td><%= profile.getPhone() != null ? profile.getPhone() : "Not Available" %></td></tr>
                <tr><th>Address</th><td><%= profile.getAddress() != null ? profile.getAddress() : "Not Available" %></td></tr>
                <tr><th>Date of Birth</th><td><%= profile.getDob() != null ? profile.getDob() : "Not Available" %></td></tr>
                <tr><th>Education</th><td><%= profile.getEducation() != null ? profile.getEducation() : "Not Available" %></td></tr>
            </table>
        </div>

        <div class="profile-section">
            <h3>Family Information</h3>
            <table class="profile-table">
                <tr><th>Father's Name</th><td><%= profile.getFatherName() != null ? profile.getFatherName() : "Not Available" %></td></tr>
                <tr><th>Father's Mobile</th><td><%= profile.getFatherMobile() != null ? profile.getFatherMobile() : "Not Available" %></td></tr>
                <tr><th>Mother's Name</th><td><%= profile.getMotherName() != null ? profile.getMotherName() : "Not Available" %></td></tr>
                <tr><th>Mother's Mobile</th><td><%= profile.getMotherMobile() != null ? profile.getMotherMobile() : "Not Available" %></td></tr>
            </table>
        </div>

        <button type="button" class="btn-primary" onclick="showEditMode()">Edit Profile</button>
    </div>

    <!-- Edit Mode -->
    <div id="editMode" class="form-section">
        <form action="StudentProfile" method="post">
            <input type="hidden" name="action" value="updateProfile">
            
            <div class="profile-section">
                <h3>Personal Information</h3>
                <label>Full Name:</label>
                <input type="text" name="fullName" class="text-input" value="<%= profile.getFullName() != null ? profile.getFullName() : "" %>" required>
                
                <label>Email:</label>
                <input type="email" name="email" class="text-input" value="<%= profile.getEmail() != null ? profile.getEmail() : "" %>" required>
                
                <label>Phone:</label>
                <input type="text" name="phone" class="text-input" value="<%= profile.getPhone() != null ? profile.getPhone() : "" %>" required>
                
                <label>Address:</label>
                <textarea name="address" class="text-input" rows="3" required><%= profile.getAddress() != null ? profile.getAddress() : "" %></textarea>
                
                <label>Date of Birth:</label>
                <input type="date" name="dob" class="text-input" value="<%= profile.getDob() != null ? profile.getDob() : "" %>" required>
                
                <label>Education:</label>
                <input type="text" name="education" class="text-input" value="<%= profile.getEducation() != null ? profile.getEducation() : "" %>" required>
            </div>

            <div class="profile-section">
                <h3>Family Information</h3>
                <label>Father's Name:</label>
                <input type="text" name="fatherName" class="text-input" value="<%= profile.getFatherName() != null ? profile.getFatherName() : "" %>" required>
                
                <label>Father's Mobile:</label>
                <input type="text" name="fatherMobile" class="text-input" value="<%= profile.getFatherMobile() != null ? profile.getFatherMobile() : "" %>" required>
                
                <label>Mother's Name:</label>
                <input type="text" name="motherName" class="text-input" value="<%= profile.getMotherName() != null ? profile.getMotherName() : "" %>" required>
                
                <label>Mother's Mobile:</label>
                <input type="text" name="motherMobile" class="text-input" value="<%= profile.getMotherMobile() != null ? profile.getMotherMobile() : "" %>" required>
            </div>

            <button type="submit" class="btn-primary">Update Profile</button>
            <button type="button" class="btn-secondary" onclick="showViewMode()">Cancel</button>
        </form>
    </div>

    <%
        } else {
    %>
        <div class="profile-section">
            <h3>Profile Not Found</h3>
            <p>Your profile information is not complete. Please contact the administration to set up your profile.</p>
        </div>
    <%
        }
    %>
</div>

<script>
    function showEditMode() {
        document.getElementById('viewMode').style.display = 'none';
        document.getElementById('editMode').style.display = 'block';
    }
    
    function showViewMode() {
        document.getElementById('editMode').style.display = 'none';
        document.getElementById('viewMode').style.display = 'block';
    }
</script>

</body>
</html>

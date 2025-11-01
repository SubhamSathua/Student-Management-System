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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>

 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/user.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">Student Registration</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<!-- Error Message Display -->
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <div style="max-width: 720px; margin: 0 auto;">
        <div class="error" style="margin: 10px 0; padding: 10px; background: #ffebee; border: 1px solid #f44336; color: #d32f2f; border-radius: 4px;">
            <%= errorMessage %>
        </div>
    </div>
<%
    }
%>

<section style="margin-top: 24px;">
    <form action="<%= request.getContextPath() %>/registerStudent" method="post" style="max-width: 720px;" id="regForm" class="form">
        <h3>Student Login Details</h3>
        <label>Username</label>
        <input name="stud_username" class="text-input" placeholder="e.g.CSE23001" 
               value="<%= request.getParameter("stud_username") != null ? request.getParameter("stud_username") : "" %>" required/>

        <label>Password</label>
        <input name="stud_password" type="password" class="text-input" placeholder="Password" required/>

        <label>Status</label>
        <select name="status" class="text-input" required>
            <option value="active" <%= "active".equals(request.getParameter("status")) ? "selected" : "" %>>active</option>
            <option value="inactive" <%= "inactive".equals(request.getParameter("status")) ? "selected" : "" %>>inactive</option>
        </select>

        <h3 style="margin-top:18px;">Student Academic Details</h3>
        <label>Registration No</label>
        <input name="registrationNo" type="number" class="text-input" placeholder="e.g., 2307002" required/>

        <label>Department</label>
        <select name="department" class="text-input" required>
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
        <input name="admissionYear" min="1900" max="2100" step="1" type="number" class="text-input" placeholder="e.g. 2025" required/>

        <h3 style="margin-top:18px;">Student Profile</h3>
        <label>Full Name</label>
        <input name="fullName" class="text-input" placeholder="Student full name" required/>

        <label>Email</label>
        <input name="email" type="email" class="text-input" placeholder="student@email.com" id="email" required/>
        <span id="emailError" style="color:red; font-size:0.8rem; grid-column: 2;"></span>

        <label>Phone</label>
        <input name="phone" type="number" class="text-input mobile" placeholder="Enter Student's mobile" maxlength="10" required/>
        <span class="mobileError" style="color:red; font-size:0.8rem; grid-column: 2;"></span>

<%--        TODO: Implement--%>
        <label>Address</label>
        <input name="address" type="text" class="text-input" placeholder="Enter Student Address" required/>

        <label>Date Of Birth</label>
        <input name="dob" type="date" class="text-input" value="2005-01-01" placeholder="Enter Date of Birth" id="dob" required/>

        <label>Father's Name</label>
        <input name="fatherName" type="text" class="text-input" placeholder="Enter Father's Name" required/>

        <label>Father's Mobile</label>
        <input name="fatherMobile" type="number" class="text-input mobile" placeholder="Enter Father's Mobile Number" maxlength="10" required/>
        <span class="mobileError" style="color:red; font-size:0.8rem; grid-column: 2;"></span>

        <label>Mother's Name</label>
        <input name="motherName" type="text" class="text-input" placeholder="Enter Mother's Name" required/>

        <label>Mother's Mobile</label>
        <input name="motherMobile" type="number" class="text-input mobile" placeholder="Enter Mother's Mobile Number" maxlength="10" required/>
        <span class="mobileError" style="color:red; font-size:0.8rem; grid-column: 2;"></span>

        <label>Highest Education</label>
        <input name="education" type="text" class="text-input" placeholder="Enter Highest Education" required/>


        <button type="submit" class="btn-submit" id="submitBtn">Create Student</button>
    </form>
</section>

<script>
    const form = document.getElementById('regForm');
    const dobInput = document.getElementById('dob');
    const emailInput = document.getElementById('email');
    const emailError = document.getElementById('emailError');
    const submitBtn = document.getElementById('submitBtn');
    const mobileInputs = document.querySelectorAll('.mobile');
    const mobileErrors = document.querySelectorAll('.mobileError');

    // Set max date for DOB
    dobInput.max = new Date().toISOString().split("T")[0];

    // Validate all fields together
    function validateAll() {
        let valid = true;

        // Email validation (show warning only if text is entered)
        const emailValue = emailInput.value.trim();
        if (emailValue !== "" && !emailInput.validity.valid) {
            emailError.textContent = "Please enter a valid email address.";
            valid = false;
        } else {
            emailError.textContent = "";
        }

        // Mobile validation for all mobile inputs
        mobileInputs.forEach((input, index) => {
            let value = input.value.trim();

            // Restrict to 10 digits maximum
            if (value.length > 10) {
                value = value.slice(0, 10);
                input.value = value;
            }

            if (value === "") {
                mobileErrors[index].textContent = "";
                valid = false;
            } else if (!/^[0-9]{10}$/.test(value)) {
                mobileErrors[index].textContent = "Must be exactly 10 digits.";
                valid = false;
            } else if (value.charAt(0) === '0') {
                mobileErrors[index].textContent = "Mobile number cannot start with 0.";
                valid = false;
            } else {
                mobileErrors[index].textContent = "";
            }
        });

        // Enable/disable submit button based on overall validity
        submitBtn.disabled = !valid;
        
        // Change button appearance based on validity
        if (valid) {
            submitBtn.style.opacity = "1";
            submitBtn.style.cursor = "pointer";
        } else {
            submitBtn.style.opacity = "0.6";
            submitBtn.style.cursor = "not-allowed";
        }
    }

    // Live validation on input events
    emailInput.addEventListener('input', validateAll);
    mobileInputs.forEach(input => {
        input.addEventListener('input', validateAll);
        
        // Prevent non-numeric characters for mobile inputs
        input.addEventListener('keypress', function(e) {
            if (!/[0-9]/.test(e.key) && !['Backspace', 'Delete', 'Tab', 'Escape', 'Enter'].includes(e.key)) {
                e.preventDefault();
            }
        });
    });

    // Initial validation check
    validateAll();

    // Prevent form submission if validation fails
    form.addEventListener('submit', function(e) {
        validateAll();
        if (submitBtn.disabled) {
            e.preventDefault();
            alert('Please fix all validation errors before submitting.');
        }
    });
</script>
</body>
</html>
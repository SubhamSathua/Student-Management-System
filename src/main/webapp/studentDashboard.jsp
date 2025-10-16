<%--
  Student Dashboard implementing:
  Academics | Exams | Fees | Admit Card | Marks/Report | Complaints | Timetable | Profile | Logout
  Author: nalin
  Date: 13-10-2025
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>

<header>
    <h1>Student Dashboard</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>

<!-- Top-level navigation cards -->
<div class="card-container">
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Academics</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Exams</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Fees</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Admit Card</div>
    </div>
    <div class="card" >
        <div class="card-icon"></div>
        <div class="card-text">Marks / Report</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Complaints</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Timetable</div>
    </div>
    <div class="card">
        <div class="card-icon"></div>
        <div class="card-text">Profile</div>
    </div>
</div>

<%--<!-- Academics -->--%>
<%--<section id="academics" style="display:none;">--%>
<%--    <h2>Academics</h2>--%>

<%--    <!-- Register for Subjects -->--%>
<%--    <h3>Register for Subjects</h3>--%>
<%--    <form action="RegisterSubjectsServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="semesterReg">Semester</label>--%>
<%--        <select id="semesterReg" name="semester" class="text-input" required>--%>
<%--            <option value="">Select semester</option>--%>
<%--            <option>Sem 1</option>--%>
<%--            <option>Sem 2</option>--%>
<%--            <option>Sem 3</option>--%>
<%--            <option>Sem 4</option>--%>
<%--            <option>Sem 5</option>--%>
<%--            <option>Sem 6</option>--%>
<%--        </select>--%>

<%--        <label for="subjectCodes">Subject Codes (comma separated)</label>--%>
<%--        <input id="subjectCodes" name="subjectCodes" type="text" class="text-input" placeholder="e.g., CS101, MA102" required/>--%>

<%--        <button type="submit" class="btn-submit">Register</button>--%>
<%--    </form>--%>

<%--    <!-- View Subjects by Semester -->--%>
<%--    <h3>View Subjects by Semester</h3>--%>
<%--    <form action="ViewSubjectsServlet" method="get">--%>
<%--        <label for="semesterView">Semester</label>--%>
<%--        <select id="semesterView" name="semester" class="text-input" required>--%>
<%--            <option value="">Select semester</option>--%>
<%--            <option>Sem 1</option><option>Sem 2</option><option>Sem 3</option>--%>
<%--            <option>Sem 4</option><option>Sem 5</option><option>Sem 6</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn-submit">View</button>--%>
<%--    </form>--%>

<%--    <!-- Back Papers -->--%>
<%--    <h3>Back Papers</h3>--%>
<%--    <form action="RegisterBackPaperServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="backPaperCode">Back Paper Subject Code</label>--%>
<%--        <input id="backPaperCode" name="subjectCode" type="text" class="text-input" placeholder="e.g., CS205" required/>--%>
<%--        <button type="submit" class="btn-submit">Apply</button>--%>
<%--    </form>--%>
<%--</section>--%>

<%--<!-- Exams -->--%>
<%--<section id="exams" style="display:none;">--%>
<%--    <h2>Exams</h2>--%>

<%--    <!-- Register for Exam -->--%>
<%--    <h3>Register for Exam</h3>--%>
<%--    <form action="ExamRegistrationServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="examSession">Exam Session</label>--%>
<%--        <select id="examSession" name="session" class="text-input" required>--%>
<%--            <option value="">Select session</option>--%>
<%--            <option>Nov/Dec 2025</option>--%>
<%--            <option>May/Jun 2026</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn-submit">Register</button>--%>
<%--    </form>--%>

<%--    <!-- Pay Exam Fee -->--%>
<%--    <h3>Pay Exam Fee</h3>--%>
<%--    <form action="PayExamFeeServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="examAmount">Amount</label>--%>
<%--        <input id="examAmount" name="amount" type="number" class="text-input" placeholder="e.g., 1500" required/>--%>
<%--        <button type="submit" class="btn-submit">Pay</button>--%>
<%--    </form>--%>

<%--    <!-- Generate Admit Card -->--%>
<%--    <h3>Generate Admit Card</h3>--%>
<%--    <form action="AdmitCardServlet" method="get" target="_blank">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <button type="submit" class="btn-submit">Generate / Download</button>--%>
<%--    </form>--%>
<%--</section>--%>

<%--<!-- Fees -->--%>
<%--<section id="fees" style="display:none;">--%>
<%--    <h2>Fees</h2>--%>

<%--    <!-- Pay Fees -->--%>
<%--    <h3>Pay Fees</h3>--%>
<%--    <form action="PayFeesServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="feeType">Fee Type</label>--%>
<%--        <select id="feeType" name="feeType" class="text-input" required>--%>
<%--            <option value="">Select type</option>--%>
<%--            <option>Hostel</option><option>Transport</option><option>Misc</option><option>Exam</option>--%>
<%--        </select>--%>
<%--        <label for="feeAmount">Amount</label>--%>
<%--        <input id="feeAmount" name="amount" type="number" class="text-input" placeholder="e.g., 5000" required/>--%>
<%--        <button type="submit" class="btn-submit">Pay</button>--%>
<%--    </form>--%>

<%--    <!-- View Fee Receipts -->--%>
<%--    <h3>Fee Receipts</h3>--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Receipt No</th>--%>
<%--            <th>Type</th>--%>
<%--            <th>Amount</th>--%>
<%--            <th>Date</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="r" items="${feeReceipts}">--%>
<%--            <tr>--%>
<%--                <td>${r.number}</td>--%>
<%--                <td>${r.type}</td>--%>
<%--                <td>${r.amount}</td>--%>
<%--                <td>${r.date}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${empty feeReceipts}">--%>
<%--            <tr><td colspan="4">No receipts found.</td></tr>--%>
<%--        </c:if>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</section>--%>

<%--<!-- Admit Card (quick access) -->--%>
<%--<section id="admit" style="display:none;">--%>
<%--    <h2>Admit Card</h2>--%>
<%--    <form action="AdmitCardServlet" method="get" target="_blank">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <button type="submit" class="btn-submit">Generate / Download Admit Card</button>--%>
<%--    </form>--%>
<%--</section>--%>

<%--<!-- Marks / Report Card -->--%>
<%--<section id="marks" style="display:none;">--%>
<%--    <h2>Marks / Report Card</h2>--%>

<%--    <form action="ViewMarksServlet" method="get">--%>
<%--        <label for="marksSem">Semester</label>--%>
<%--        <select id="marksSem" name="semester" class="text-input" required>--%>
<%--            <option value="">Select semester</option>--%>
<%--            <option>Sem 1</option><option>Sem 2</option><option>Sem 3</option>--%>
<%--            <option>Sem 4</option><option>Sem 5</option><option>Sem 6</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn-submit">View Marks</button>--%>
<%--    </form>--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Subject</th>--%>
<%--            <th>Internal</th>--%>
<%--            <th>External</th>--%>
<%--            <th>Total</th>--%>
<%--            <th>Grade</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="m" items="${marks}">--%>
<%--            <tr>--%>
<%--                <td>${m.subject}</td>--%>
<%--                <td>${m.internal}</td>--%>
<%--                <td>${m.external}</td>--%>
<%--                <td>${m.total}</td>--%>
<%--                <td>${m.grade}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${empty marks}">--%>
<%--            <tr><td colspan="5">No marks to display.</td></tr>--%>
<%--        </c:if>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--    <form action="ReportCardServlet" method="get" target="_blank">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <button type="submit" class="btn-submit">Download Report Card</button>--%>
<%--    </form>--%>
<%--</section>--%>

<%--<!-- Complaints / Grievance -->--%>
<%--<section id="complaints" style="display:none;">--%>
<%--    <h2>Complaints / Grievance</h2>--%>

<%--    <!-- Submit Grievance -->--%>
<%--    <h3>Submit Grievance</h3>--%>
<%--    <form action="SubmitGrievanceServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>
<%--        <label for="category">Category</label>--%>
<%--        <select id="category" name="category" class="text-input" required>--%>
<%--            <option value="">Select category</option>--%>
<%--            <option>Academic</option><option>Hostel</option><option>Transport</option><option>Other</option>--%>
<%--        </select>--%>
<%--        <label for="details">Details</label>--%>
<%--        <input id="details" name="details" type="text" class="text-input" placeholder="Describe the issue..." required/>--%>
<%--        <button type="submit" class="btn-submit">Submit</button>--%>
<%--    </form>--%>

<%--    <!-- Track Complaint Status -->--%>
<%--    <h3>Track Status</h3>--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Ticket</th>--%>
<%--            <th>Category</th>--%>
<%--            <th>Status</th>--%>
<%--            <th>Updated</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="g" items="${grievances}">--%>
<%--            <tr>--%>
<%--                <td>${g.ticket}</td>--%>
<%--                <td>${g.category}</td>--%>
<%--                <td>${g.status}</td>--%>
<%--                <td>${g.updatedAt}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${empty grievances}">--%>
<%--            <tr><td colspan="4">No grievances found.</td></tr>--%>
<%--        </c:if>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</section>--%>

<!-- Timetable -->
<%--<section id="timetable" style="display:none;">--%>
<%--    <h2>Timetable & Holidays</h2>--%>

<%--    <form action="ViewTimetableServlet" method="get">--%>
<%--        <label for="ttSem">Semester</label>--%>
<%--        <select id="ttSem" name="semester" class="text-input" required>--%>
<%--            <option value="">Select semester</option>--%>
<%--            <option>Sem 1</option><option>Sem 2</option><option>Sem 3</option>--%>
<%--            <option>Sem 4</option><option>Sem 5</option><option>Sem 6</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn-submit">View Timetable</button>--%>
<%--    </form>--%>

<%--    <h3>Holiday List</h3>--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Date</th>--%>
<%--            <th>Occasion</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="h" items="${holidays}">--%>
<%--            <tr>--%>
<%--                <td>${h.date}</td>--%>
<%--                <td>${h.title}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${empty holidays}">--%>
<%--            <tr><td colspan="2">No holidays available.</td></tr>--%>
<%--        </c:if>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</section>--%>

<%--<!-- Profile -->--%>
<%--<section id="profile" style="display:none;">--%>
<%--    <h2>View / Edit Profile</h2>--%>
<%--    <form action="UpdateStudentProfileServlet" method="post">--%>
<%--        <input type="hidden" name="studentId" value="<%= studentId != null ? studentId : "" %>"/>--%>

<%--        <label for="fullName">Full Name</label>--%>
<%--        <input id="fullName" name="fullName" type="text" class="text-input"--%>
<%--               value="<%= session.getAttribute(\"name\") != null ? session.getAttribute(\"name\") : \"\" %>" required/>--%>

<%--        <label for="email">Email</label>--%>
<%--        <input id="email" name="email" type="email" class="text-input"--%>
<%--               value="<%= session.getAttribute(\"email\") != null ? session.getAttribute(\"email\") : \"\" %>" required/>--%>

<%--        <label for="phone">Phone</label>--%>
<%--        <input id="phone" name="phone" type="text" class="text-input"--%>
<%--               value="<%= session.getAttribute(\"phone\") != null ? session.getAttribute(\"phone\") : \"\" %>"/>--%>

<%--        <button type="submit" class="btn-submit">Save Changes</button>--%>
<%--    </form>--%>
<%--</section>--%>

<script>
    function showSection(sectionId) {
        const ids = ['academics','exams','fees','admit','marks','complaints','timetable','profile'];
        ids.forEach(id => {
            const el = document.getElementById(id);
            if (el) el.style.display = 'none';
        });
        const show = document.getElementById(sectionId);
        if (show) show.style.display = 'block';
    }
    // default view
    document.addEventListener('DOMContentLoaded', () => showSection('academics'));
</script>

</body>
</html>

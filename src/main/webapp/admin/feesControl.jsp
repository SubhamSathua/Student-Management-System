<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Fees Control</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>

<header>
    <h1>Fees Control</h1>
    <form action="../LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
</header>



<div class="card-container">
    <div class="card">
        <div class="card-icon">➕</div>
        <div class="card-text">Add Fee Structure</div>
    </div>
    <div class="card">
        <div class="card-icon">💳</div>
        <div class="card-text">View All Fees</div>
    </div>
    <div class="card">
        <div class="card-icon">📋️</div>
        <div class="card-text">Record Payment</div>
    </div>
</div>


<section style="margin-top: 30px;">
    <h2>Set Fee Structure</h2>
    <form style="max-width: 600px;" action="AddFeeServlet" method="post">
        <label>Fee Type</label>
        <select name="feeType" class="text-input" required>
            <option value="">Select fee type</option>
            <option>Hostel</option>
            <option>Transport</option>
            <option>Tuition</option>
            <option>Exam</option>
            <option>Miscellaneous</option>
        </select>

        <label>Amount</label>
        <input name="amount" type="number" class="text-input" placeholder="e.g., 15000" required/>

        <label>Semester</label>
        <select name="semester" class="text-input">
            <option value="">Select semester</option>
            <option>Sem 1</option>
            <option>Sem 2</option>
            <option>Sem 3</option>
            <option>Sem 4</option>
            <option>Sem 5</option>
            <option>Sem 6</option>
        </select>

        <label>Academic Year</label>
        <input name="academicYear" type="text" class="text-input" placeholder="e.g., 2025-26"/>

        <button type="submit" class="btn-submit">Add Fee Structure</button>
    </form>
</section>


<section style="margin-top: 40px;">
    <h2>Current Fee Structure</h2>
    <table>
        <thead>
        <tr>
            <th>Fee Type</th>
            <th>Amount</th>
            <th>Semester</th>
            <th>Academic Year</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</section>


<section style="margin-top: 40px;">
    <h2>Record Payment</h2>
    <form style="max-width: 600px;" action="RecordPaymentServlet" method="post">
        <label>Student ID / Roll No</label>
        <input name="studentId" type="text" class="text-input" placeholder="Enter student ID" required/>

        <label>Fee Type</label>
        <select name="feeType" class="text-input" required>
            <option value="">Select fee type</option>
            <option>Hostel</option>
            <option>Transport</option>
            <option>Tuition</option>
            <option>Exam</option>
            <option>Miscellaneous</option>
        </select>

        <label>Amount Paid</label>
        <input name="amountPaid" type="number" class="text-input" placeholder="e.g., 15000" required/>

        <label>Payment Date</label>
        <input name="paymentDate" type="date" class="text-input" required/>

        <label>Payment Method</label>
        <select name="paymentMethod" class="text-input" required>
            <option value="">Select method</option>
            <option>Cash</option>
            <option>Online</option>
            <option>Cheque</option>
            <option>DD</option>
        </select>

        <button type="submit" class="btn-submit">Record Payment</button>
    </form>
</section>

<!-- Payment History Table -->
<section style="margin-top: 40px;">
    <h2>Recent Payments</h2>
    <table>
        <thead>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Fee Type</th>
            <th>Amount</th>
            <th>Payment Date</th>
            <th>Method</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dynamic payment data will appear here -->
        <%-- Example for dynamic load:
        <c:forEach var="payment" items="${paymentList}">
            <tr>
                <td>${payment.studentId}</td>
                <td>${payment.studentName}</td>
                <td>${payment.feeType}</td>
                <td>₹${payment.amount}</td>
                <td>${payment.paymentDate}</td>
                <td>${payment.method}</td>
                <td>${payment.status}</td>
            </tr>
        </c:forEach>
        --%>
        </tbody>
    </table>
</section>

</body>
</html>

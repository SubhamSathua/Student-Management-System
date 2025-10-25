<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.studentmgmtsys.model.Fees" %>
<%
    // Check if user is logged in as student
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"student".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<html>
<head>
    <title>My Fees</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            margin: 0;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .page-header {
            background: #0d1117;
            color: white;
            padding: 25px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        
        .content-area {
            padding: 25px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }
        
        th {
            background: #f8f9fa;
            font-weight: 600;
        }
        
        .paid {
            color: #28a745;
            background: #d4edda;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
        }
        
        .not-paid {
            color: #dc3545;
            background: #f8d7da;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
        }
        
        .payment-form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        
        select, input {
            width: 100%;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .pay-btn {
            background: #0d1117;
            color: white;
            border: 1px solid #0d1117;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .pay-btn:hover {
            background: #21262d;
            border-color: #21262d;
        }
        
        .pay-btn:disabled {
            background: #6c757d;
            border-color: #6c757d;
            cursor: not-allowed;
        }
        
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
        }
        
        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 25px;
            border-radius: 8px;
            text-align: center;
            min-width: 300px;
        }
        
        .amount {
            font-size: 24px;
            font-weight: bold;
            margin: 15px 0;
        }
        
        .confirm-btn, .cancel-btn {
            border: 1px solid;
            padding: 12px 20px;
            border-radius: 6px;
            margin: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .confirm-btn {
            background: #0d1117;
            color: white;
            border-color: #0d1117;
        }
        
        .confirm-btn:hover {
            background: #21262d;
            border-color: #21262d;
        }
        
        .cancel-btn {
            background: white;
            color: #0d1117;
            border-color: #d0d7de;
        }
        
        .cancel-btn:hover {
            background: #f6f8fa;
            border-color: #0d1117;
        }
    </style>
</head>
<body>

 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/receipt.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">Fees Management</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<div class="container">
    <div class="page-header">
        <h2>💳 My Fees</h2>
    </div>
    
    <div class="content-area">

<%
    Fees fees = (Fees) request.getAttribute("fees");
    if (fees == null) {
%>
    <div style="color: #dc3545; background: #f8d7da; padding: 15px; border-radius: 8px; text-align: center;">
        <strong>Error loading fees.</strong> Please try again.
    </div>
<%
    } else {
%>

<!-- Modern Fees Table -->
<table>
    <thead>
        <tr>
            <th>Fee Type</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>Transport Fee</strong></td>
            <td class="amount-display">₹5,000</td>
            <td><span class="<%= fees.isTransport() ? "paid" : "not-paid" %>">
                <%= fees.isTransport() ? "PAID" : "PENDING" %>
            </span></td>
        </tr>
        <tr>
            <td><strong>Semester Fee</strong></td>
            <td class="amount-display">₹15,000</td>
            <td><span class="<%= fees.isSemister() ? "paid" : "not-paid" %>">
                <%= fees.isSemister() ? "PAID" : "PENDING" %>
            </span></td>
        </tr>
        <tr>
            <td><strong>Hostel Fee</strong></td>
            <td class="amount-display">₹8,000</td>
            <td><span class="<%= fees.isHostel() ? "paid" : "not-paid" %>">
                <%= fees.isHostel() ? "PAID" : "PENDING" %>
            </span></td>
        </tr>
        <tr>
            <td><strong>Miscellaneous Fee</strong></td>
            <td class="amount-display">₹2,000</td>
            <td><span class="<%= fees.isMisc() ? "paid" : "not-paid" %>">
                <%= fees.isMisc() ? "PAID" : "PENDING" %>
            </span></td>
        </tr>
    </tbody>
</table>

<!-- Modern Payment Form -->
<div class="payment-form">
    <h3>Make Payment</h3>
    
    <div class="form-group">
        <label for="feeSelect">Select Fee to Pay:</label>
        <select id="feeSelect" onchange="updateAmount()">
            <option value="">-- Choose Fee Type --</option>
            <% if (!fees.isTransport()) { %>
                <option value="transport">Transport Fee - ₹5,000</option>
            <% } %>
            <% if (!fees.isSemister()) { %>
                <option value="semister">Semester Fee - ₹15,000</option>
            <% } %>
            <% if (!fees.isHostel()) { %>
                <option value="hostel">Hostel Fee - ₹8,000</option>
            <% } %>
            <% if (!fees.isMisc()) { %>
                <option value="misc">Miscellaneous Fee - ₹2,000</option>
            <% } %>
        </select>
    </div>
    
    <div class="form-group">
        <label for="amountInput">Amount to Pay:</label>
        <input type="text" id="amountInput" readonly placeholder="Select fee type first">
    </div>
    
    <button class="pay-btn" onclick="showPopup()" id="payButton" disabled>
        Pay Now
    </button>
</div>

    </div>
</div>

<%
    }
%>

<!-- Modern Payment Popup -->
<div id="paymentPopup" class="popup">
    <div class="popup-content">
        <h3>Secure Payment</h3>
        <p id="feeTypeName">Fee Payment</p>
        <div class="amount" id="popupAmount">₹0</div>
        <p style="color: #6c757d;">Click <strong>Pay Now</strong> to complete your payment securely</p>
        
        <form action="<%= request.getContextPath() %>/fees" method="post" style="display: inline;">
            <input type="hidden" name="feeType" id="hiddenFeeType">
            <button type="submit" class="confirm-btn">Pay Now</button>
            <button type="button" class="cancel-btn" onclick="closePopup()">Cancel</button>
        </form>
    </div>
</div>

<script>
    // Predefined amounts and names
    const feeAmounts = {
        'transport': '5,000',
        'semister': '15,000',
        'hostel': '8,000',
        'misc': '2,000'
    };
    
    const feeNames = {
        'transport': 'Transport Fee',
        'semister': 'Semester Fee', 
        'hostel': 'Hostel Fee',
        'misc': 'Miscellaneous Fee'
    };
    
    // Update amount and enable/disable pay button
    function updateAmount() {
        const select = document.getElementById('feeSelect');
        const amountInput = document.getElementById('amountInput');
        const payButton = document.getElementById('payButton');
        
        if (select.value) {
            amountInput.value = '₹' + feeAmounts[select.value];
            payButton.disabled = false;
            payButton.textContent = 'Pay Now';
        } else {
            amountInput.value = '';
            payButton.disabled = true;
            payButton.textContent = 'Pay Now';
        }
    }
    
    // Show modern popup
    function showPopup() {
        const select = document.getElementById('feeSelect');
        
        if (!select.value) {
            alert('Please select a fee type first!');
            return;
        }
        
        // Set popup content
        document.getElementById('feeTypeName').textContent = feeNames[select.value];
        document.getElementById('popupAmount').textContent = '₹' + feeAmounts[select.value];
        document.getElementById('hiddenFeeType').value = select.value;
        
        // Show popup
        document.getElementById('paymentPopup').style.display = 'block';
    }
    
    // Close popup
    function closePopup() {
        document.getElementById('paymentPopup').style.display = 'none';
    }
    
    // Close popup when clicking outside
    window.onclick = function(event) {
        const popup = document.getElementById('paymentPopup');
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    }
</script>

</body>
</html>

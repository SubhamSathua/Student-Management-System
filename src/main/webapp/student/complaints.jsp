<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmtsys.model.Complain" %>
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
    <title>My Complaints</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-section, .list-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .form-section h3, .list-section h3 {
            color: #333;
            margin: 0 0 15px 0;
            border-bottom: 2px solid #eee;
            padding-bottom: 8px;
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
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        
        .btn-primary {
            background: #333;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        
        .btn-primary:hover {
            background: #555;
        }
        
        .complaint-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .complaint-table th, .complaint-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .complaint-table th {
            background: #f5f5f5;
            font-weight: bold;
            color: #333;
        }
        
        .status-pending {
            color: #e67e22;
            font-weight: bold;
        }
        
        .status-complete {
            color: #27ae60;
            font-weight: bold;
        }
        
        .no-complaints {
            text-align: center;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>

 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/complain.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">My Complaints</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<div class="container">
    <!-- Add New Complaint Form -->
    <div class="form-section">
        <h3>Submit New Complaint</h3>
        <form action="<%= request.getContextPath() %>/complaints" method="post">
            <input type="hidden" name="action" value="addComplaint">
            
            <label>Title:</label>
            <input type="text" name="title" class="text-input" placeholder="Enter complaint title" required>
            
            <label>Description:</label>
            <textarea name="description" class="text-input" rows="4" placeholder="Describe your complaint in detail" required></textarea>
            
            <button type="submit" class="btn-primary">Submit Complaint</button>
        </form>
    </div>

    <!-- My Complaints List -->
    <div class="list-section">
        <h3>My Previous Complaints</h3>
        <%
            List<Complain> complaints = (List<Complain>) request.getAttribute("complaints");
            if (complaints != null && !complaints.isEmpty()) {
        %>
            <table class="complaint-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Complain complaint : complaints) {
                    %>
                    <tr>
                        <td><%= complaint.getId() %></td>
                        <td><strong><%= complaint.getTitle() %></strong></td>
                        <td><%= complaint.getDescription() %></td>
                        <td>
                            <% if ("pending".equals(complaint.getStatus())) { %>
                                <span class="status-pending">PENDING</span>
                            <% } else { %>
                                <span class="status-complete">COMPLETE</span>
                            <% } %>
                        </td>
                        <td><%= complaint.getCreatedDate() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <div class="no-complaints">
                <p>You have not submitted any complaints yet.</p>
                <p>Use the form above to submit your first complaint.</p>
            </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
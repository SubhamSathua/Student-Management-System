<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmgmtsys.model.Complain" %>
<%
    // Check if user is logged in as admin
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"admin".equals(userSession.getAttribute("role"))) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Grievance Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .list-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .list-section h3 {
            color: #333;
            margin: 0 0 15px 0;
            border-bottom: 2px solid #eee;
            padding-bottom: 8px;
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
        
        .btn-complete {
            background: #27ae60;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }
        
        .btn-complete:hover {
            background: #229954;
        }
        
        .btn-complete:disabled {
            background: #bdc3c7;
            cursor: not-allowed;
        }
        
        .no-complaints {
            text-align: center;
            color: #666;
            padding: 20px;
        }
        
        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            flex: 1;
            text-align: center;
        }
        
        .stat-number {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        
        .stat-label {
            color: #666;
            margin-top: 5px;
        }
    </style>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>

 <div class="header">
                <div class="header-left">
                    <a href="DashboardServlet" class="home-btn"><img id="homeIcon" src="assets/icons/home.png" width="20px"></a>
                    <img src="assets/icons/univ.png" height="45px">
                </div>
                <img src="assets/icons/complain.png" class="titleHeadIcon" width="20px">
                <h1 id="headerTitle">Complain Management</h1>
                <div class="header-right">
                    <form action="LogoutServlet" method="post" class="logout-form">
                        <button type="submit" class="logout-btn">Log Out</button>
                    </form>
                </div>
            </div>

<div class="container">
    <!-- Statistics -->
    <div class="stats">
        <%
            List<Complain> allComplaints = (List<Complain>) request.getAttribute("complaints");
            int totalComplaints = 0;
            int pendingComplaints = 0;
            int completeComplaints = 0;
            
            if (allComplaints != null) {
                totalComplaints = allComplaints.size();
                for (Complain c : allComplaints) {
                    if ("pending".equals(c.getStatus())) {
                        pendingComplaints++;
                    } else {
                        completeComplaints++;
                    }
                }
            }
        %>
        <div class="stat-card">
            <div class="stat-number"><%= totalComplaints %></div>
            <div class="stat-label">Total Complaints</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><%= pendingComplaints %></div>
            <div class="stat-label">Pending</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><%= completeComplaints %></div>
            <div class="stat-label">Completed</div>
        </div>
    </div>

    <!-- All Complaints List -->
    <div class="list-section">
        <h3>All Student Complaints</h3>
        <%
            if (allComplaints != null && !allComplaints.isEmpty()) {
        %>
            <table class="complaint-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Complain complaint : allComplaints) {
                    %>
                    <tr>
                        <td><%= complaint.getId() %></td>
                        <td><%= complaint.getUserId() %></td>
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
                        <td>
                            <% if ("pending".equals(complaint.getStatus())) { %>
                                <form action="<%= request.getContextPath() %>/grievance" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="markComplete">
                                    <input type="hidden" name="complaintId" value="<%= complaint.getId() %>">
                                    <button type="submit" class="btn-complete">Mark Complete</button>
                                </form>
                            <% } else { %>
                                <button class="btn-complete" disabled>Already Complete</button>
                            <% } %>
                        </td>
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
                <p>No complaints have been submitted yet.</p>
            </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: nalin
  Date: 16-10-2025
  Time: 11:49 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
<header>
    <div class="header-left">
        <h1>Profile</h1>
    </div>

    <div class="header-right">
        <div class="button-group">
            <a href="<%= request.getContextPath() %>/DashboardServlet"><button class="home-btn">Home</button></a>
        </div>
    </div>
</header>

<section>
    <h2>Full Name</h2>
    <input name="fullname" type="text" class="text-input" value="Admin Name" readonly/>

    <label>Email</label>
    <input name="email" type="email" class="text-input" value="admin@example.com" readonly/>

    <label>Phone</label>
    <input name="phone" type="text" class="text-input" value="#" readonly/>

    <label>Role</label>
    <input name="role" type="text" class="text-input" value="Admin" disabled/>

</section>
</body>
</html>

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
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
<header>
    <h1> Adminn Profile</h1>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Log Out</button>
    </form>
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

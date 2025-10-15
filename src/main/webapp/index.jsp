<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="src/styles.css">
    <link rel="stylesheet" href="src/login.css">
</head>
<body>
<header>
    <div class="header-left">
        <h1>Student Management System</h1>
    </div>
</header>


<div class="login-card">
    <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Student Management System</p>
        </div>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <input type="submit" value="Login" class="btn-submit">
        </form>

        <% String error = (String) request.getAttribute("error");
            if (error != null) { %>
        <p style="color:red;"><%= error %>
        </p>
        <% } %>

        <div class="login-footer">
            <p>Secure access for students and staff</p>
        </div>
    </div>
</div>


<%--<form action="LoginServlet" method="post">--%>
<%--    Username: <input type="text" class="log-username" name="username" placeholder="Enter your text..." required> <br>--%>
<%--    Password: <input type="password" name="log-password" placeholder="Enter your password..." required /><br/>--%>
<%--    <input type="submit" value="Login" class="btn-submit"/>--%>
<%--</form>--%>


</body>
</html>

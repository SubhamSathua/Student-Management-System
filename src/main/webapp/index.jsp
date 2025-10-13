<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="src/styles.css">
</head>
<body>
<header>
    <h1>Student Management System</h1>
</header>

<form action="LoginServlet" method="post">
    Username: <input type="text" class="text-input" name="username" placeholder="Enter your text..." required> <br>
    Password: <input type="password" name="password" class="text-input" placeholder="Enter your password..." required /><br/>
    <input type="submit" value="Login" class="btn-submit"/>
</form>

<% String error = (String) request.getAttribute("error");
    if(error != null){ %>
<p style="color:red;"><%= error %></p>
<% } %>
</body>
</html>

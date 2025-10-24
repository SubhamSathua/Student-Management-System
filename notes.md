```java
// 1️⃣ Insert user normally
String sql = "INSERT INTO login(username, password, role, status) VALUES (?, ?, ?, ?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, user.getUsername());
ps.setString(2, user.getPassword());
ps.setString(3, user.getRole());
ps.setString(4, user.getStatus());
ps.executeUpdate();

// 2️⃣ Manually get last inserted id (MySQL-specific)
ResultSet rs = ps.executeQuery("SELECT LAST_INSERT_ID()");
if (rs.next()) {
userId = rs.getInt(1);
}
```
```java
// TODO: Statement.RETURN_GENERATED_KEYS
```


---
```jsp
<%
    String status = (String) session.getAttribute("status");
    String alert = "";

    if ("success".equals(status)) {
        alert = "<div class='alert alert-success'>Student registered successfully!</div>";
    } else if ("error".equals(status)) {
        alert = "<div class='alert alert-danger'>Registration failed. Please try again.</div>";
    }

    session.removeAttribute("status");
%>
<%= alert %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">```
```
- Client side login verification
- Handle exception in registration like dupe
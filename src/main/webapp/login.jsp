
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("patientId") != null) {
        response.sendRedirect("patientDashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Login</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f6fc;
    margin: 0;
    padding: 30px;
}
.container {
    max-width: 400px;
    margin: 60px auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 8px #ddd;
}
h2 {
    color: #087f8c;
    text-align: center;
}
label {
    display: block;
    margin-top: 15px;
}
input {
    width: 100%;
    box-sizing: border-box;
    padding: 10px;
    margin-top: 6px;
}
button {
    width: 100%;
    padding: 12px;
    margin-top: 20px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
.error {
    color: red;
    text-align: center;
}
.register {
    text-align: center;
    margin-top: 18px;
}
</style>
</head>
<body>

<div class="container">
    <h2>Patient Login</h2>

    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <p class="error">Invalid email or password.</p>
    <% } %>

    <form action="login" method="post">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <div class="register">
        Don't have an account?
        <a href="register.jsp">Register here</a>
    </div>
</div>

</body>
</html>

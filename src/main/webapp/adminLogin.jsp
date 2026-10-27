
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    if (Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        response.sendRedirect("adminDashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #e6f7fa, #f2f6fc);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.container {
    width: 100%;
    max-width: 400px;
    background: white;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0, 80, 100, 0.12);
}

.icon {
    text-align: center;
    font-size: 42px;
}

h2 {
    text-align: center;
    color: #087f8c;
    margin-bottom: 8px;
}

.subtitle {
    text-align: center;
    color: #6b7280;
    font-size: 14px;
    margin-bottom: 25px;
}

label {
    display: block;
    margin: 16px 0 7px;
    font-weight: bold;
    color: #374151;
}

input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccd6df;
    border-radius: 7px;
    outline: none;
}

input:focus {
    border-color: #087f8c;
}

button {
    width: 100%;
    padding: 13px;
    margin-top: 24px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    background: #066873;
}

.error {
    text-align: center;
    color: #c62828;
    background: #fff0f0;
    padding: 10px;
    border-radius: 6px;
    font-size: 14px;
}

.back {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #087f8c;
    text-decoration: none;
}
</style>
</head>

<body>
<div class="container">

    <div class="icon">🔐</div>
    <h2>Admin Login</h2>
    <p class="subtitle">Hospital Management System</p>

    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <p class="error">Invalid username or password.</p>
    <% } %>

    <form action="adminLogin" method="post">

        <label for="username">Username</label>
        <input type="text" id="username" name="username"
               placeholder="Enter admin username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
               placeholder="Enter password" required>

        <button type="submit">Login as Admin</button>

    </form>

    <a class="back" href="login.jsp">Back to Patient Login</a>

</div>
</body>
</html>

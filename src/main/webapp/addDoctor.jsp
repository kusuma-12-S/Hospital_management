
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    if (!Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor | Hospital Management</title>

<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f2f6fc;
    margin: 0;
    padding: 30px;
}

.container {
    max-width: 460px;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
}

h2 {
    color: #087f8c;
    text-align: center;
    margin-bottom: 25px;
}

label {
    display: block;
    margin-top: 18px;
    color: #374151;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 12px;
    margin-top: 7px;
    border: 1px solid #ccd6df;
    border-radius: 7px;
    font-size: 15px;
}

input:focus {
    outline: none;
    border-color: #087f8c;
}

button {
    width: 100%;
    padding: 13px;
    margin-top: 25px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #066873;
}

.message {
    text-align: center;
    color: #16753b;
    background: #eaf8ef;
    padding: 12px;
    border-radius: 6px;
}

.error {
    text-align: center;
    color: #b42318;
    background: #fff0f0;
    padding: 12px;
    border-radius: 6px;
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

    <h2>Add New Doctor</h2>

    <% if ("true".equals(request.getParameter("success"))) { %>
        <p class="message">Doctor added successfully!</p>
    <% } %>

    <% if ("empty".equals(request.getParameter("error"))) { %>
        <p class="error">Please fill in all fields.</p>
    <% } else if ("failed".equals(request.getParameter("error"))) { %>
        <p class="error">Unable to add doctor. Please try again.</p>
    <% } else if ("duplicate".equals(request.getParameter("error"))) { %>
        <p class="error">This doctor could not be added because of a database constraint.</p>
    <% } %>

    <form action="addDoctor" method="post">

        <label for="doctorName">Doctor Name</label>
        <input type="text" id="doctorName" name="doctorName"
               placeholder="Enter doctor name" required maxlength="45">

        <label for="specialization">Specialization</label>
        <input type="text" id="specialization" name="specialization"
               placeholder="Enter specialization" required maxlength="100">

        <button type="submit">Add Doctor</button>

    </form>

    <a class="back" href="adminDashboard.jsp">Back to Admin Dashboard</a>

</div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.hospital.model.patient" %>

<%
    Integer patientId = (Integer) session.getAttribute("patientId");

    if (patientId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    patient p = (patient) request.getAttribute("patient");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Profile</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f6fc;
    margin: 0;
    padding: 30px;
}
.container {
    max-width: 500px;
    margin: 30px auto;
    background: white;
    padding: 28px;
    border-radius: 12px;
    box-shadow: 0 2px 10px #ddd;
}
h2 {
    text-align: center;
    color: #087f8c;
}
label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
    color: #374151;
}
input {
    width: 100%;
    box-sizing: border-box;
    padding: 11px;
    margin-top: 6px;
    border: 1px solid #ccd6df;
    border-radius: 6px;
}
button, .back {
    display: block;
    width: 100%;
    box-sizing: border-box;
    text-align: center;
    padding: 12px;
    margin-top: 20px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    cursor: pointer;
}
.message {
    text-align: center;
    color: green;
}
.error {
    text-align: center;
    color: red;
}
</style>
</head>

<body>
<div class="container">

    <h2>My Patient Profile</h2>

    <% if ("true".equals(request.getParameter("success"))) { %>
        <p class="message">Profile updated successfully!</p>
    <% } %>

    <% if ("empty".equals(request.getParameter("error"))) { %>
        <p class="error">Please fill in all fields.</p>
    <% } else if ("failed".equals(request.getParameter("error"))) { %>
        <p class="error">Unable to update profile.</p>
    <% } %>

    <% if (p != null) { %>

    <form action="updateProfile" method="post">

        <label>Patient ID</label>
        <input type="text" value="<%= p.getPatientId() %>" readonly>

        <label>Full Name</label>
        <input type="text" name="name"
               value="<%= p.getPatientName() %>" required>

        <label>Email</label>
        <input type="email" name="email"
               value="<%= p.getPatientEmail() %>" required>

        <label>Phone</label>
        <input type="tel" name="phone"
               value="<%= p.getPhoneNo() %>" required>

        <button type="submit">Update Profile</button>

    </form>

    <% } else { %>
        <p class="error">Patient details could not be loaded. Please reopen your profile.</p>
    <% } %>

    <a class="back" href="patientDashboard.jsp">Back to Dashboard</a>

</div>
</body>
</html>

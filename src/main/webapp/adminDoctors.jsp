
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Doctor" %>

<%
    if (!Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Doctor> doctors =
        (List<Doctor>) request.getAttribute("doctors");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Doctors</title>

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
    max-width: 950px;
    margin: 25px auto;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 3px 12px #ddd;
    overflow-x: auto;
}

h2 {
    text-align: center;
    color: #087f8c;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 25px;
}

th, td {
    border: 1px solid #ddd;
    padding: 13px;
    text-align: center;
}

th {
    background: #087f8c;
    color: white;
}

tr:nth-child(even) {
    background: #f7fafa;
}

.button {
    display: inline-block;
    background: #087f8c;
    color: white;
    padding: 10px 15px;
    margin-top: 18px;
    text-decoration: none;
    border-radius: 6px;
}

.empty {
    text-align: center;
    padding: 20px;
}
</style>
</head>

<body>

<div class="container">

    <h2>Doctor Management</h2>

    <% if (doctors != null && !doctors.isEmpty()) { %>

    <table>
        <tr>
            <th>Doctor ID</th>
            <th>Doctor Name</th>
            <th>Specialization</th>
            <th>Action</th>
        </tr>

        <% for (Doctor d : doctors) { %>
        <tr>
            <td><%= d.getDoctorId() %></td>
            <td><%= d.getDoctorName() %></td>
            <td><%= d.getSpecialization() %></td>
            <td>
    <a href="editDoctor.jsp?id=<%= d.getDoctorId() %>">
        Edit
    </a>
</td>
        </tr>
        <% } %>
    </table>

    <% } else { %>
        <div class="empty">
            <h3>No doctors found.</h3>
        </div>
    <% } %>

    <a class="button" href="addDoctor.jsp">Add Doctor</a>
    <a class="button" href="adminDashboard.jsp">Back to Dashboard</a>
    

</div>

</body>
</html>

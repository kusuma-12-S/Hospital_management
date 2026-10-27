
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    if (!Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<String[]> appointments =
        (List<String[]>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Appointments</title>

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
    max-width: 1200px;
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
    padding: 12px;
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
    margin-top: 20px;
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

    <h2>All Patient Appointments</h2>

    <% if (appointments != null && !appointments.isEmpty()) { %>

    <table>
        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Specialization</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>

        <% for (String[] a : appointments) { %>
        <tr>
            <td><%= a[0] %></td>
            <td><%= a[1] %></td>
            <td><%= a[2] %></td>
            <td><%= a[3] %></td>
            <td><%= a[4] %></td>
            <td><%= a[5] %></td>
            <td><%= a[6] %></td>
        </tr>
        <% } %>
    </table>

    <% } else { %>

    <div class="empty">
        <h3>No appointments found.</h3>
    </div>

    <% } %>

    <a class="button" href="adminDashboard.jsp">
        Back to Dashboard
    </a>

</div>
</body>
</html>

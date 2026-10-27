
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>

<%
    Integer patientId = (Integer) session.getAttribute("patientId");

    if (patientId == null) {
        response.sendRedirect("register.jsp");
        return;
    }

    List<String[]> appointments =
        (List<String[]>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f6fc;
            margin: 0;
            padding: 30px;
        }

        h2 {
            color: #087f8c;
            text-align: center;
        }

        .container {
            max-width: 1100px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        .back {
            display: inline-block;
            margin-top: 20px;
            background: #087f8c;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        .empty {
            text-align: center;
            padding: 20px;
        }
    </style>
</head>

<body>

    <h2>My Appointments</h2>

    <div class="container">

        <% if (appointments != null && !appointments.isEmpty()) { %>

            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Doctor Name</th>
                    <th>Specialization</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                
<% for (String[] a : appointments) { %>
    <tr>
        <td><%= a[0] %></td>
        <td><%= a[1] %></td>
        <td><%= a[2] %></td>
        <td><%= a[3] %></td>
        <td><%= a[4] %></td>
        <td><%= a[5] %></td>

        <td>
            <% if ("Booked".equalsIgnoreCase(a[5])) { %>
                <form action="cancelAppointment" method="post"
                      onsubmit="return confirm('Are you sure you want to cancel this appointment?');">

                    <input type="hidden" name="appointmentId"
                           value="<%= a[0] %>">

                    <button type="submit">Cancel</button>
                </form>
            <% } else { %>
                -
            <% } %>
        </td>
    </tr>
<% } %>

            </table>

        <% } else { %>

            <div class="empty">
                <h3>No appointments found.</h3>
                <p>You have not booked any appointments yet.</p>
            </div>

        <% } %>

        <a class="back" href="patientDashboard.jsp">Back to Dashboard</a>

    </div>

</body>
</html>

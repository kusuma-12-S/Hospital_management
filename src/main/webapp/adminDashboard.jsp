
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
<title>Admin Dashboard</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f2f6fc;
    color: #263238;
}

.header {
    background: #087f8c;
    color: white;
    padding: 22px 35px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;
}

.header h2 {
    margin: 0;
}

.logout {
    color: white;
    text-decoration: none;
    border: 1px solid white;
    padding: 9px 15px;
    border-radius: 6px;
}

.container {
    max-width: 1050px;
    margin: 35px auto;
    padding: 20px;
}

.welcome {
    margin-bottom: 25px;
}

.welcome h2 {
    color: #087f8c;
}

.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 22px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 3px 12px #ddd;
}

.card h3 {
    color: #087f8c;
    margin-top: 0;
}

.card p {
    color: #64748b;
    line-height: 1.5;
}

.card a {
    display: inline-block;
    margin-top: 12px;
    padding: 10px 15px;
    background: #087f8c;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

.card a:hover {
    background: #066873;
}
</style>
</head>

<body>

<div class="header">
    <h2>🏥 Hospital Admin Panel</h2>
    <a class="logout" href="adminLogout">Logout</a>
</div>

<div class="container">

    <div class="welcome">
        <h2>Welcome, <%= session.getAttribute("adminUsername") %>!</h2>
        <p>Manage hospital doctors and appointments from your dashboard.</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>Doctor Management</h3>
            <p>Add and manage doctor information.</p>
            <a href="addDoctor.jsp">Add Doctor</a>
        </div>

        <div class="card">
            <h3>View Doctors</h3>
            <p>View the doctors registered in the system.</p>
            <a href="adminDoctors">View Doctors</a>
        </div>

        <div class="card">
            <h3>Appointments</h3>
            <p>Review patient appointments and their status.</p>
            <a href="adminAppointments">View Appointments</a>
        </div>

    </div>

</div>

</body>
</html>

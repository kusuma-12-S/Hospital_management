
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    Integer patientId = (Integer) session.getAttribute("patientId");
    String patientName = (String) session.getAttribute("patientName");

    // Check whether the patient has a session
    if (patientId == null) {
        response.sendRedirect("register.jsp");
        return;
    }
%>
<%
String success = request.getParameter("success");

if ("true".equals(success)) {
%>
<script>
    alert("Registration Successful!");
</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f6fc;
        }

        .navbar {
            background-color: #087f8c;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
            margin-bottom: 25px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ddd;
            text-align: center;
        }

        .card h3 {
            color: #087f8c;
        }

        .card a {
            display: inline-block;
            background-color: #087f8c;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .card a:hover {
            background-color: #05636d;
        }

        .logout {
            color: white;
            text-decoration: none;
            border: 1px solid white;
            padding: 8px 14px;
            border-radius: 5px;
        }

        .logout:hover {
            background-color: white;
            color: #087f8c;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>

<body>

    <div class="navbar">
        <h2>Hospital Management System</h2>
        <a class="logout" href="logout">Logout</a>
    </div>

    <div class="container">

        <div class="welcome">
            <h2>Welcome, <%= patientName != null ? patientName : "Patient" %>!</h2>
            <p>Manage your appointments and patient information here.</p>
            <p><strong>Patient ID:</strong> <%= patientId %></p>
        </div>

        <div class="cards">

            <div class="card">
                <h3>Book Appointment</h3>
                <p>Schedule an appointment with a doctor.</p>
                <a href="doctors">Book Now</a>
            </div>

            <div class="card">
                <h3>My Appointments</h3>
                <p>View your scheduled appointments.</p>
                <a href="myAppointments">View Appointments</a>
            </div>

            <div class="card">
                <h3>My Profile</h3>
                <p>View your patient information.</p>
                <a href="patientProfile">View Profile</a>
            </div>

        </div>

    </div>

    <footer>
        Hospital Management System &copy; 2026
    </footer>

</body>
</html>

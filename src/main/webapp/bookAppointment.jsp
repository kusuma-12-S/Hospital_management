
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    Integer patientId = (Integer) session.getAttribute("patientId");

    if (patientId == null) {
        response.sendRedirect("register.jsp");
        return;
    }
%>

<%
String success = request.getParameter("success");
String error = request.getParameter("error");

if ("true".equals(success)) {
%>
    <script>
        alert("Appointment booked successfully!");
    </script>
<%
} else if ("unavailable".equals(error)) {
%>
    <script>
        alert("This doctor is already booked for that date and time. Please choose another slot.");
    </script>
<%
} else if ("invalid".equals(error)) {
%>
    <script>
        alert("Please enter a valid doctor ID.");
    </script>
<%
} else if ("failed".equals(error)) {
%>
    <script>
        alert("Appointment booking failed. Please try again.");
    </script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f6fc;
            margin: 0;
            padding: 40px 20px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px #ddd;
        }

        h2 {
            text-align: center;
            color: #087f8c;
        }

        label {
            display: block;
            margin-top: 18px;
        }

        select, input {
            width: 100%;
            padding: 10px;
            margin-top: 7px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            border: none;
            border-radius: 5px;
            background: #087f8c;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Book Appointment</h2>

    <form action="bookAppointment" method="post">

       
<label for="doctorId">Select Doctor</label>

<select id="doctorId" name="doctorId" required>
    <option value="">-- Select Doctor --</option>

    <%
    java.util.List<com.hospital.model.Doctor> doctors =
        (java.util.List<com.hospital.model.Doctor>)
        request.getAttribute("doctors");

    if (doctors != null) {
        for (com.hospital.model.Doctor d : doctors) {
    %>

    <option value="<%= d.getDoctorId() %>">
        <%= d.getDoctorName() %> - <%= d.getSpecialization() %>
    </option>

    <%
        }
    }
    %>
</select>


        <label for="appointmentDate">Appointment Date</label>
        <input type="date" id="appointmentDate"
               name="appointmentDate" required>

        <label for="appointmentTime">Appointment Time</label>
        <input type="time" id="appointmentTime"
               name="appointmentTime" required>

        <button type="submit">Book Appointment</button>
    </form>
</div>

</body>
</html>

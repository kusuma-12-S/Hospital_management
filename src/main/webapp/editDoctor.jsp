
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    if (!Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String id = request.getParameter("id");

    if (id == null || !id.matches("\\d+")) {
        response.sendRedirect("adminDoctors?error=invalid");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f6fc;
    padding: 30px;
}

.container {
    max-width: 450px;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 3px 12px #ddd;
}

h2 {
    text-align: center;
    color: #087f8c;
}

label {
    display: block;
    margin-top: 15px;
}

input {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    box-sizing: border-box;
}

button {
    width: 100%;
    margin-top: 22px;
    padding: 12px;
    background: #087f8c;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
</style>
</head>

<body>
<div class="container">
    <h2>Edit Doctor</h2>

    <form action="updateDoctor" method="post">
        <input type="hidden" name="doctorId"
               value="<%= id %>">

        <label>Doctor Name</label>
        <input type="text" name="doctorName"
               placeholder="Enter doctor name" required>

        <label>Specialization</label>
        <input type="text" name="specialization"
               placeholder="Enter specialization" required>

        <button type="submit">Update Doctor</button>
    </form>
</div>
</body>
</html>

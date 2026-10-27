
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration | Hospital Management</title>

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
    padding: 25px;
}

.container {
    width: 100%;
    max-width: 460px;
    background: #ffffff;
    padding: 35px;
    border-radius: 16px;
    box-shadow: 0 8px 30px rgba(0, 80, 100, 0.12);
}

.logo {
    text-align: center;
    font-size: 42px;
    margin-bottom: 8px;
}

h2 {
    text-align: center;
    color: #087f8c;
    margin: 0 0 8px;
}

.subtitle {
    text-align: center;
    color: #6b7280;
    font-size: 14px;
    margin-bottom: 28px;
}

label {
    display: block;
    margin: 16px 0 7px;
    color: #374151;
    font-size: 14px;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="password"] {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #d1dce5;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
}

input:focus {
    border-color: #087f8c;
    box-shadow: 0 0 0 3px rgba(8, 127, 140, 0.12);
}

button {
    width: 100%;
    padding: 13px;
    margin-top: 25px;
    background: #087f8c;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.2s;
}

button:hover {
    background: #066873;
}

.login-link {
    text-align: center;
    margin-top: 22px;
    color: #6b7280;
    font-size: 14px;
}

.login-link a {
    color: #087f8c;
    font-weight: bold;
    text-decoration: none;
}

.login-link a:hover {
    text-decoration: underline;
}

.error {
    background: #fff0f0;
    color: #c62828;
    border: 1px solid #ffcaca;
    border-radius: 8px;
    padding: 11px;
    text-align: center;
    font-size: 14px;
    margin-bottom: 18px;
}
</style>
</head>

<body>

<div class="container">

    <div class="logo">🏥</div>
    <h2>Create Patient Account</h2>
    <p class="subtitle">Register to manage your hospital appointments</p>

    <% if ("true".equals(request.getParameter("fail"))) { %>
        <div class="error">Registration failed. Please try again.</div>
    <% } %>

    
<form action="register" method="post">

    <label for="name">Full Name</label>
    <input type="text"
           id="name"
           name="name"
           placeholder="Enter your full name"
           pattern="[A-Za-z ]{2,50}"
           title="Name must contain 2-50 letters and spaces"
           required>

    <label for="email">Email Address</label>
    <input type="email"
           id="email"
           name="email"
           placeholder="Enter your email"
           required>

    <label for="phone">Phone Number</label>
    <input type="tel"
           id="phone"
           name="phone"
           placeholder="Enter 10-digit phone number"
           pattern="[0-9]{10}"
           maxlength="10"
           title="Enter exactly 10 digits"
           required>

    <label for="pass">Password</label>
    <input type="password"
           id="pass"
           name="pass"
           placeholder="Create a password"
           minlength="8"
           required>

    <label for="conPass">Confirm Password</label>
    <input type="password"
           id="conPass"
           name="conPass"
           placeholder="Re-enter your password"
           minlength="8"
           required>

    <button type="submit">Create Account</button>

</form>


    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login here</a>
    </div>

</div>

<script>
const password = document.getElementById("pass");
const confirmPassword = document.getElementById("conPass");

function validatePassword() {
    if (confirmPassword.value !== password.value) {
        confirmPassword.setCustomValidity("Passwords do not match");
    } else {
        confirmPassword.setCustomValidity("");
    }
}

password.addEventListener("input", validatePassword);
confirmPassword.addEventListener("input", validatePassword);
</script>

</body>
</html>

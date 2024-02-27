<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quangz | Register</title>

    <%@include file="shared/stylesheet.jsp" %>
</head>
<body>
<%@include file="shared/preload.jsp" %>

<%@include file="shared/header.jsp" %>

<div style="color: white;" class="page-heading">
    <div style="margin: auto; text-align: left; display: inline-block">
        <h2 style="color: white; margin-bottom: 20px; text-align: center">Register</h2>
        <form action="admin/game/insert" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
            <label for="username" style="margin-right: 5px">Username </label>
            <input type="text" id="username" name="username" style="float: right;" required><br><br>
            
            <label for="email" style="margin-right: 5px">Email </label>
            <input type="text" id="email" name="email" style="float: right;" required><br><br>
            
            <label for="password" style="margin-right: 5px">Password </label>
            <input type="password" id="password" name="password" style="float: right;" required><br><br>
            
            <label for="password_confirm" style="margin-right: 5px">Password confirm</label>
            <input type="password" id="password_confirm" name="password_confirm" style="float: right;" required><br><br>

            <input type="submit" value="Register" style="display: block; margin: 0 auto; border-radius: 6px">
        </form>
        <br>
        <a href="/Ass1/login.jsp" style="color: yellow">You have an account? Log in now!</a>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>

</div>

<%@include file="shared/footer.jsp" %>

<%@include file="shared/script_import.jsp" %>

<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var password_confirm = document.getElementById("password_confirm").value;

        if (username === "" || email === "" || password === "" || password_confirm === "") {
            alert("Please fill in all fields.");
            return false;
        }

        if (password !== password_confirm) {
            alert("Password and password confirmation do not match.");
            return false;
        }

        // Add additional validation logic here if needed

        return true;
    }
</script>
</body>
</html>
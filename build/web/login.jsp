<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quangz | Login</title>

    <%@include file="shared/stylesheet.jsp" %>
</head>
<body>
<%@include file="shared/preload.jsp" %>

<%@include file="shared/header.jsp" %>

<div style="color: white;" class="page-heading">
    <div style="margin: auto; text-align: left; display: inline-block">
        <h2 style="color: white; margin-bottom: 20px; text-align: center">Login</h2>
        <form action="admin/game/insert" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
            <label for="username" style="margin-right: 5px">Username </label>
            <input type="text" id="username" name="username" style="float: right;" required><br><br>
            
            <label for="password" style="margin-right: 5px">Password </label>
            <input type="password" id="password" name="password" style="float: right;" required><br><br>

            <input type="submit" value="Login" style="display: block; margin: 0 auto; border-radius: 6px">
        </form>
        <br>
        <a href="/Ass1/register.jsp" style="color: yellow">Don't have an account? Create one!</a>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>

</div>

<%@include file="shared/footer.jsp" %>

<%@include file="shared/script_import.jsp" %>

<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        if (username === "" || password === "") {
            alert("Please enter both username and password.");
            return false;
        }

        // Add additional validation logic here if needed

        return true;
    }
</script>
</body>
</html>
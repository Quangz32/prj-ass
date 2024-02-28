<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserDAO uDAO = new UserDAO();
    ArrayList<User> userList = uDAO.getAll();
%>

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
                <form action="register" method="post" onsubmit="return validateForm()">
                    <label for="name" style="margin-right: 5px">Username </label>
                    <input type="text" id="name" name="name" style="float: right;" required><br><br>

                    <label for="email" style="margin-right: 5px">Email </label>
                    <input type="text" id="email" name="email" style="float: right;" required><br><br>
                    <span id="email_used_error" style="color: orange;"></span><br><br>

                    <label for="password" style="margin-right: 5px">Password </label>
                    <input type="password" id="password" name="password" style="float: right;" required><br><br>

                    <label for="password_confirm" style="margin-right: 5px">Password confirm</label>
                    <input type="password" id="password_confirm" name="password_confirm" style="float: right;" required><br>
                    <span id="password_error" style="color: orange;"></span><br><br>

                    <input type="submit" value="Register" style="display: block; margin: 0 auto; border-radius: 6px">
                </form>
                <br>
                <a href="/Ass1/login" style="color: yellow">You have an account? Log in now!</a>
            </div>
            <br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

        <script>
            function validateForm() {

                //get the emailList in javaScript
                let emailList = [
            <% for (User user : userList) { %>
                    "<%= user.getEmail() %>",
            <% } %>
                ];

                console.log(emailList);

                let username = document.getElementById("name").value;
                let email = document.getElementById("email").value;
                let password = document.getElementById("password").value;
                let password_confirm = document.getElementById("password_confirm").value;
                let password_error = document.getElementById("password_error");
                let email_used_error = document.getElementById("email_used_error");

                if (username === "" || email === "" || password === "" || password_confirm === "") {
                    password_error.textContent = "Please fill in all fields.";
                    return false;
                }

                if (password !== password_confirm) {
                    password_error.textContent = "Password and password confirmation do not match.";
                    return false;
                }

                if (emailList.includes(email)) {
                    email_used_error.textContent = "Email used.";
                    return false;
                }

                email_used_error.textContent = "";  //delete error message
                password_error.textContent = "";

                //

                return true;
            }

        </script>
    </body>
</html>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  
    boolean fail_before = (request.getAttribute("login_failed") != null) ? true : false;
%>

<%
    Cookie[] cookies = request.getCookies();
    String last_email = null;
    String last_password = null;

    if (cookies
        != null) {
       for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                last_email = cookie.getValue();
                break;
            }
            
        }
        
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("password")) {
                last_password = cookie.getValue();
                break;
            }
            
        } 
    }
    
%>

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
                <form action="/Ass1/login" method="POST">
                    <label for="email" style="margin-right: 5px">Email </label>
                    <input value="<%= last_email %>" type="email" id="email" name="email" style="float: right; color: black;" required><br><br>

                    <label for="password" style="margin-right: 5px">Password </label>
                    <input value="<%= last_password %>" type="password" id="password" name="password" style="float: right;" required><br><br>

                    <span id="login_error" style="color: orange;">
                        <%= (fail_before) ? "Wrong email or password": ""  %>
                    </span><br>

                    <input type="submit" value="Login" style="display: block; margin: 0 auto; border-radius: 6px">
                </form>
                <br>
                <a href="/Ass1/register" style="color: yellow">Don't have an account? Create one!</a>
            </div>
            <br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br>

        </div>



        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
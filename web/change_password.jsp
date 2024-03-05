<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Quangz | Change Password</title>

        <%@include file="shared/stylesheet.jsp" %>



    </head>

    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading text-white">
            <div class="m-auto text-start d-inline-block">
                <h2 class="text-white mb-4 text-center"> Change your password </h2>
                <form action="/Ass1/change_password" method="post" onsubmit="return validateForm();">

                    <label for="password" class="me-3">Old password</label>
                    <input type="password" id="password" name="old_password" class="float-end" required><br><br>

                    <label for="password" class="me-3">New password</label>
                    <input type="password" id="new_password" name="new_password" class="float-end" required><br><br>

                    <label for="password" class="me-3">Confirm new password</label>
                    <input type="password" id="confirm_new_password" class="float-end" required><br><br>

                    <span id="error_mess" style="color: #ffca2c">
                        <c:out value="${message}"/>
                    </span><br>

                    <input type="submit" value="Change!" class="d-block rounded-3" style="margin: 0 auto">
                </form>
                <br>
            </div>
            <br><br><br><br><br><br><br><br><br><br>
        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

        <script>
            function validateForm() {

                let newPassword = document.getElementById("new_password");
                let confirmNewPassword = document.getElementById("confirm_new_password");

                let error_label = document.getElementById("error_mess");

                if (newPassword.value !== confirmNewPassword.value) {
                    //alert("New password and confirm new password do not match!");
                    error_label.innerHTML = "New passwords do not match!";
                    newPassword.value = "";
                    confirmNewPassword.value = "";
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
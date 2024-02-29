<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //The current_user already include in include file="shared/header.jsp" : line 23
    //User current_user = (User) request.getSession().getAttribute("current_user");
    
%>

<html>
    <head>
        <title>Quangz | Cart</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">The best cart ever!</h2>
            </div>

            <form>

                <div style="width: 60%; margin: 0 auto">

                    <% 
                        CartItemDAO ciDAO = new CartItemDAO();
                        ArrayList<CartItem> cart_items = ciDAO.getByUserId(current_user.getId());
                    
                        for (CartItem cart_item : cart_items) {
                    %>

                    <%@include file="shared/cart_item.jsp" %>

                    <% 
                        } 
                    %>


                </div>

            </form>
            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>
        function toggleContent(cart_item_id) {
            let intro_open = document.getElementById("intro-open-" + cart_item_id);
            let intro_close = document.getElementById("intro-close-" + cart_item_id);


            if (intro_open.style.display == "none") {
                intro_open.style.display = "inline-block";
                intro_close.style.display = "none";
            } else {
                intro_open.style.display = "none";
                intro_close.style.display = "inline-block";
            }
        }

        function showTotal(checkbox, gameId) {
            var total = document.getElementById("total-" + gameId);

            if (checkbox.checked) {
                total.classList.remove("d-none");
            } else {
                total.classList.add("d-none");
            }
        }
    </script>
</html>
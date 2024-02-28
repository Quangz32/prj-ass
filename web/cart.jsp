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
                <!--                        <h2 style="color: white; margin-bottom: 20px; text-align: center">This is your cart</h2>-->
                <h2 class="mb-xxl-5">This is your cart</h2>
            </div>
            <div style="width: 50%; margin: 0 auto">

                <% 
                    CartItemDAO ciDAO = new CartItemDAO();
                    ArrayList<CartItem> cart_items = ciDAO.getByUserId(current_user.getId());
                    
                    for (CartItem cart_item : cart_items) {
                %>

                <%//= cart_item.getQuantity()%>

                <%@include file="shared/cart_item.jsp" %>

                <% 
                    } 
                %>


            </div>


            <br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br>




        </div>-->



        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
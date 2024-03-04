<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //User current_user = (User) request.getSession().getAttribute("current_user");  
    ArrayList<CartItem> cart_items = (ArrayList<CartItem>) request.getAttribute("cart_items");
%>

<html>
    <head>
        <title>Quangz | Cart</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading ">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">Let's confirm your order!</h2>
            </div>
            <div style="width: 60%; margin: 0 auto" class="">
                <form action="order" method="post">
                    <table class="row table table-bordered text-white">
                        <tr>
                            <th class="col-lg-1"></th>
                            <th class="col-lg-3">Image</th>
                            <th class="col-lg-3">Name</th>
                            <th class="col-lg-2">Price</th>
                            <th class="col-lg-1">Quantity</th>
                            <th class="col-lg-2">Total</th>
                        </tr>

                        
                        <c:set var="i" value="1"/>
                        <c:set var="sum_total" value="0"/>
                            
                        <c:forEach var="item" items="${cart_items}">
                            <input class="d-none" type="text" name="card_items" value="${item.id}">
                            <tr>
                                <td class="col-lg-1">${i}</td>
                                <td class="col-lg-3">
                                    <img src="${item.getGame().getImagePath()}" alt="alt"/>
                                </td>
                                <td class="col-lg-3">${item.getGame().name}</td>
                                <td class="col-lg-2">${item.getGame().discountPrice}</td>
                                <td class="col-lg-1">${item.quantity}</td>
                                <td class="col-lg-2">$${item.getGame().discountPrice * item.quantity}</td>
                                <c:set var="sum_total" value="${sum_total + item.getGame().discountPrice * item.quantity}" />
                            </tr>

                            <c:set var="i" value="${i+1}"/>
                        </c:forEach>
                            
                         <tr>
                                <td class="col-lg-1">#</td>
                                <td class="col-lg-3">
                                    
                                </td>
                                <td class="col-lg-3"></td>
                                <td class="col-lg-2"></td>
                                <td class="col-lg-1">Total: </td>
                                <td class="col-lg-2">$${sum_total }</td>
                            </tr>   

                    </table>
                            
                            <input class="mt-3" type="submit" value="I want to buy them!">

                </form>
            </div>


            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>



    </script>
</html>
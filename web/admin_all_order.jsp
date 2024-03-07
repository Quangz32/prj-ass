<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Quangz | All Order</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading ">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">Below are what you have bought!</h2>
            </div>
            <div style="width: 60%; margin: 0 auto" class="">
                <c:forEach var="order" items="${orders}">
                    <div class="order-container mb-5">
                        <label class="fs-5">Order ID: ${order.getId()} | Time: ${order.getOrderDate()} </label>
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
                            <c:set var="order_total" value="0"/>

                            <c:forEach var="order_item" items="${order.getOrderItems()}">
                                <c:set var="item" value="${order_item.getCartItem()}"> </c:set>
                                <input class="d-none" type="text" name="card_items" value="${item.id}">
                                <tr>
                                    <td class="col-lg-1">${i}</td>
                                    <td class="col-lg-3">
                                        <img src="${item.getGame().getImagePath()}" alt="alt"/>
                                    </td>
                                    <td class="col-lg-3">${item.getGame().name}</td>
                                    <td class="col-lg-2">${order_item.getPrice()}</td>
                                    <td class="col-lg-1">${item.quantity}</td>
                                    <td class="col-lg-2">$${item.getGame().discountPrice * item.quantity}</td>
                                    <c:set var="order_total" value="${order_total + item.getGame().discountPrice * item.quantity}" />
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
                                <td class="col-lg-2">$${order_total }</td>
                            </tr>   

                        </table>
                    </div>


                </c:forEach>

            </div>


            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>



    </script>
</html>
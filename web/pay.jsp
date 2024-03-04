<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Quangz | Payment</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">Make your payment!</h2>
            </div>
            <div style="width: 60%; margin: 0 auto">
                <div class="row">
                    <div class="col-lg-6">
                        <img src="assets/images/qr-techcombank.jpg"/>
                    </div>
                    <div class="col-lg-6">
                        <form action="order" method="post">
                            <label> You are paying $${order_total} for</label>

                            <table class="row table table-bordered text-white">
                                <tr>
                                    <th class="col-lg-4">Image</th>
                                    <th class="col-lg-3">Name</th>
                                    <th class="col-lg-2">Price</th>
                                    <th class="col-lg-1">Quantity</th>
                                    <th class="col-lg-2">Total</th>
                                </tr>

                                <c:forEach var="item" items="${cart_items}">
                                    <input class="d-none" type="text" name="card_items" value="${item.id}">
                                    <tr>
                                        <td class="col-lg-4">
                                            <img src="${item.getGame().getImagePath()}" alt="alt"/>
                                        </td>
                                        <td class="col-lg-3">${item.getGame().name}</td>
                                        <td class="col-lg-2">${item.getGame().discountPrice}</td>
                                        <td class="col-lg-1">${item.quantity}</td>
                                        <td class="col-lg-2">$${item.getGame().discountPrice * item.quantity}</td>
                                    </tr>

                                </c:forEach>

                            </table>
                            
                            <input class="mt-3" type="submit" value="I have made the payment!">
                        </form>

                    </div>

                </div>
                <!--                <form action="pay" method="post">
                                    
                
                                    <hr class="border-5" style="">
                
                                    <div class="row mt-5">
                                        <div class="col-lg-2">
                                            <input type="checkbox" class="big-checkbox-3" id="check-all" onchange="checkAll(this)">
                                            <span for="check-all" class="ms-3">All</span>
                                        </div>
                
                                        <div class="col-lg-3"></div>
                                        <div class="col-lg-7">
                                            <input type="submit" value="Next">
                
                                        </div>
                
                                    </div>
                                </form>-->
            </div>

            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
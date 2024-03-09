<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Quangz | Games</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading ">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">Games in this shop!</h2>
            </div>
            <div style="width: 40%; margin: 0 auto" class="">
                <table class="row table table-bordered text-white">
                    <tr>
                        <th class="col-lg-1">Id</th>
                        <th class="col-lg-3">Image</th>
                        <th class="col-lg-2">Name</th>
                        <th class="col-lg-2">Listed Price</th>
                        <th class="col-lg-2">Discount Price</th>
                        <th class="col-lg-2">Option</th>
                    </tr>


                    <c:forEach var="game" items="${games}">
                        <tr>
                            <td class="col-lg-1">${game.getId()}</td>
                            <td class="col-lg-4">
                                <img src="${game.getImagePath()}" class="rounded-3"/>
                            </td>
                            <td class="col-lg-3">${game.getName()}</td>
                            <td class="col-lg-2">${game.getListedPrice()}</td>
                            <td class="col-lg-2">${game.getDiscountPrice()}</td>
                            <td class="col-lg-2">
                                <a href="/Ass1/product/${game.getId()}" style="color: yellow">View</a>
                                <a>Edit</a>
                                <a href="/Ass1/game/delete?gameid=${game.getId()}" style="color: yellow"
                                   onclick="return confirm('Are you sure you want to delete this game?');">
                                    Delete
                                </a>

                            </td>
                        </tr>

                    </c:forEach>


                </table>

            </div>


            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>



    </script>
</html>
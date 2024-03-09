<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%
    CategoryDAO cateDAO = new CategoryDAO();
    ArrayList<Category> categories = cateDAO.getAll();

    GameDAO gameDAO = new GameDAO();
    ArrayList<Game> games = gameDAO.getAll();
    
    pageContext.setAttribute("categories", categories);
    pageContext.setAttribute("games", games);
    
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Lugx Gaming - Shop Page</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>

    <body>

        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3>Our Shop</h3>
                        <span class="breadcrumb"><a href="/Ass1/dashboard">Home</a> > Our Shop</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="section trending">
            <div class="container">
                <ul class="trending-filter">
                    <li>
                        <a class="is_active" href="/Ass1/shop" data-filter="*">Show All</a>
                    </li>

                    <c:forEach var="category" items="${categories}">
                        <li>
                            <a href="#!" data-filter=".<c:out value="${category.getName()}" />"><c:out value="${category.getName()}" /></a>
                        </li>
                    </c:forEach>

                </ul>
                <div class="row trending-box">
                    <c:if test="${ empty searchKeyword}">
                        <c:set var="searchKeyword" value=""/>
                    </c:if>

                    <c:forEach var="game" items="${games}">
                        <c:if test="${ game.getName().toUpperCase().contains(searchKeyword.toUpperCase())}">
                            <%@include file="shared/game_card.jsp" %>
                        </c:if>
                    </c:forEach>
                </div>

                <!--                <div class="row">
                                    <div class="col-lg-12">
                                        <ul class="pagination">
                                            <li><a href="#"> &lt; </a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a class="is_active" href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#"> &gt; </a></li>
                                        </ul>
                                    </div>
                                </div>-->
            </div>
        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
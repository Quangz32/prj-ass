<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Quangz Gaming - Product Detail</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>

    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3><c:out value="${game.getName()}"/></h3>
                        <span class="breadcrumb"><a href="#">Home</a>  >  <a href="#">Shop</a> > <c:out value="${game.getName()}"/></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-product section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left-image">
                            <img src="<c:out value="${game.getImagePath()}"/>" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-6 align-self-center">
                        <h4> <c:out value="${game.getName()}"/> </h4>
                        <span class="price"><em>$<c:out value="${game.getListedPrice()}"/></em> $<c:out value="${game.getDiscountPrice()}"/></span>
                        <p><c:out value="${game.getDetail().getIntroduction()}"/></p>

                        <form action="/Ass1/game/add_to_cart" method="post">
                            <input type="qty" name="quantity" class="form-control" id="1" aria-describedby="quantity" value="1">
                            <input type="number" name="game_id" value="<c:out value="${game.getId()}"/>" hidden>
                            <button type="submit"><i class="fa fa-shopping-bag"></i> ADD TO CART</button>
                        </form>

                        <ul>
                            <li><span>Game ID:</span><c:out value="${game.getId()}"/></li>
                            <li><span>Genre:</span>
                                <c:set var="categories" value="${game.getCategories()}"/>
                                <c:set var="first" value="${true}"/>
                                <c:forEach var="category" items="${categories}">
                                    <c:if test="${!first}">
                                        <c:out value=","/>
                                    </c:if>
                                    <c:set var="first" value="${false}"/>
                                    <c:out value="${category.getName()}"/>
                                </c:forEach>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="sep"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="tabs-content">
                            <div class="row">
                                <div class="nav-wrapper ">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="description-tab" data-bs-toggle="tab" data-bs-target="#description" type="button" role="tab" aria-controls="description" aria-selected="true">Description</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">Feedback (<c:out value="${feedbacks.size()}"/>)</button>
                                        </li>
                                    </ul>
                                </div>              
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                        <p><c:out value="${game.getDetail().getDescription()}" /></p>
                                    </div>
                                    <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                        <c:forEach var="feedback" items="${feedbacks}">
                                            <div id="feedback"> 
                                                <label class="d-inline-block"><c:out value="${feedback.getUserName()}"/>:</label>
                                                <p class="d-inline-block"><c:out value="${feedback.getContent()}"/></p>
                                                <hr>
                                            </div>
                                        </c:forEach>

                                        <form action="/Ass1/feedback" method="post">
                                            <input type="text" name="feedback_content" class="rounded-3">
                                            <input class="d-none" name="game_id" value="<c:out value="${game.getId()}"/>">
                                            <input type="submit" value="post" class="rounded-3">
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section categories related-games">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h6>Action</h6>
                            <h2>Related Games</h2>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="main-button">
                            <a href="shop.html">View All</a>
                        </div>
                    </div>

                    <%
                        Game game_to_show = (Game) request.getAttribute("game"); 
                        
                        QueryDAO qDAO = new QueryDAO();
                        ArrayList<Game> related_games = qDAO.getRelatedGames(game_to_show.getId());
                        
                        pageContext.setAttribute("related_games",related_games);
                    %>

                    <c:forEach var="game" items="${related_games}">
                        <div class="col-lg col-sm-6 col-xs-12">
                            <div class="item">
                                <div class="thumb">
                                    <a href="/Ass1/product/<c:out value="${game.getId()}"/>">
                                        <img height="220px" src="<c:out value="${game.getImagePath()}"/>" >
                                    </a>
                                </div>

                                <h4>$<c:out value="${game.getDiscountPrice()}"/></h4>


                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
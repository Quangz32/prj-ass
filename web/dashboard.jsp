<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Lugx Gaming Shop HTML5 Template</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>

    <body>

        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="main-banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-center">
                        <div class="caption header-text">
                            <h6>Welcome to Quangz.fun</h6>
                            <h2 style="font-size: 40px">BEST GAMING SITE EVER!</h2>
                            <p>Discover gaming excellence at Quangz.fun! With a vast collection of exciting titles, from the latest releases to beloved classics, we're the ultimate destination for gamers. Join us now and embark on an unforgettable gaming journey!</p>
                            <div class="search-input">
                                <form id="search" action="/Ass1/shop">
                                    <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                                    <button role="button">Search Now</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-2">
                        <div class="right-image">
                            <img src="/Ass1/assets/images/banner-image.jpg" alt="">
                            <span class="price">$22</span>
                            <span class="offer">-40%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="features">
            <div class="container">
                <div class="row">
                    <%
                        String sa[] = {"Fast Buying","User Friendly","Fast Refund","Easy2Use"};
                        pageContext.setAttribute("s", sa);
                    %>

                    <c:set var="sa" value="${s}" />

                    <c:set var="i" value="1"/>
                    <c:forEach var="s" items="${sa}">
                        <div class="col-lg-3 col-md-6">
                            <a>
                                <div class="item">
                                    <div class="image">
                                        <img src="assets/images/featured-0<c:out value="${i}"/>.png" alt="" style="max-width: 44px;">
                                    </div>
                                    <h4><c:out value="${s}"/></h4>
                                </div>
                            </a>
                        </div>
                        <c:set var="i" value="${i+1}"/>
                    </c:forEach>
                </div>

            </div>
        </div>

        <div class="section trending">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h6>Trending</h6>
                            <h2>Trending Games</h2>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="main-button">
                            <a href="shop.html">View All</a>
                        </div>
                    </div>

                    <%
                        QueryDAO qDAO = new QueryDAO();
                        ArrayList<Game> hot_games = qDAO.getHotGames();
                        
                        pageContext.setAttribute("hot_games",hot_games);
                    %>

                    <c:forEach var="game" items="${hot_games}">
                        <div class="col-lg-3 col-md-6">
                            <div class="item">
                                <div class="thumb">
                                    <a href="/Ass1/product/<c:out value="${game.getId()}"/>">
                                        <img height="250px" src="<c:out value="${game.getImagePath()}"/>" alt="">
                                    </a>
                                    <span class="price">
                                        <em>$<c:out value="${game.getListedPrice()}"/></em>
                                        $<c:out value="${game.getDiscountPrice()}"/>
                                    </span>
                                </div>
                                <div class="down-content">
                                    <span class="category"><c:out value="${game.getCategoriesString()}"/></span>
                                    <h4><c:out value="${game.getName()}"/></h4>
                                    <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <!--        <div class="section most-played">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h6>TOP GAMES</h6>
                                    <h2>Most Played</h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-button">
                                    <a href="shop.html">View All</a>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-01.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-02.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-03.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-04.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-05.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="product-details.html"><img src="assets/images/top-game-06.jpg" alt=""></a>
                                    </div>
                                    <div class="down-content">
                                        <span class="category">Adventure</span>
                                        <h4>Assasin Creed</h4>
                                        <a href="product-details.html">Explore</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->


        <div class="section cta">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="shop">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-heading">
                                        <h6>Our Shop</h6>
                                        <h2>Go Pre-Order Buy & Get Best <em>Prices</em> For You!</h2>
                                    </div>
                                    <p>Lorem ipsum dolor consectetur adipiscing, sed do eiusmod tempor incididunt.</p>
                                    <div class="main-button">
                                        <a href="shop.html">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-2 align-self-end">
                        <div class="subscribe">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-heading">
                                        <h6>NEWSLETTER</h6>
                                        <h2>Get Up To $100 Off Just Buy <em>Subscribe</em> Newsletter!</h2>
                                    </div>
                                    <div class="search-input">
                                        <form id="subscribe" action="#">
                                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Your email...">
                                            <button type="submit">Subscribe Now</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>   

    </body>
</html>
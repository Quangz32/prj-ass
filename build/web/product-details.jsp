<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%
    Game game = (Game) request.getAttribute("game_to_show");  
%>

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
                        <h3><%= game.getName() %></h3>
                        <span class="breadcrumb"><a href="#">Home</a>  >  <a href="#">Shop</a>  > <%= game.getName() %></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-product section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left-image">
                            <!--                                <img src="/Ass1/assets/images/single-game.jpg" alt="">-->
                            <img src="<%= game.getImagePath() %>" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-6 align-self-center">
                        <h4> <%= game.getName() %> </h4>
                        <span class="price"><em>$<%= game.getListedPrice() %></em> $<%= game.getDiscountPrice() %></span>
                        <p><%= game.getDetail().getIntroduction() %></p>

                        <form id="qty" action="/Ass1/game/add_to_cart" method="post">
                            <input type="qty" name="quantity" class="form-control" id="1" aria-describedby="quantity" value="1">
                            <input type="number" name="game_id" value="<%= game.getId() %>" hidden>
                            <button type="submit"><i class="fa fa-shopping-bag"></i> ADD TO CART</button>
                        </form>

                        <ul>
                            <li><span>Game ID:</span><%= game.getId() %></li>
                            <li><span>Genre:</span> 
                                <!--                                <a href="#">Action</a>, <a href="#">Team</a>, <a href="#">Single</a>-->
                                <%
                                    ArrayList<Category> categories = game.getCategories();
                                    boolean first = true;
                                    for (Category category : categories) {
                                        if (!first) {
                                %>,<%
                                    }
                                    first = false;
                                %>
                                <a href="#"><%= category.getName() %></a>
                                <%
                                }
                                %>

                            </li>
                            <!--                            <li><span>Multi-tags:</span> <a href="#">War</a>, <a href="#">Battle</a>, <a href="#">Royal</a></li>-->
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
                                            <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">Reviews (3)</button>
                                        </li>
                                    </ul>
                                </div>              
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                        <p><%= game.getDetail().getDescription() %></p>
                                    </div>
                                    <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                        <p>Coloring book air plant shabby chic, crucifix normcore raclette cred swag artisan activated charcoal. PBR&B fanny pack pok pok gentrify truffaut kitsch helvetica jean shorts edison bulb poutine next level humblebrag la croix adaptogen. <br><br>Hashtag poke literally locavore, beard marfa kogi bruh artisan succulents seitan tonx waistcoat chambray taxidermy. Same cred meggings 3 wolf moon lomo irony cray hell of bitters asymmetrical gluten-free art party raw denim chillwave tousled try-hard succulents street art.</p>
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
                    <div class="col-lg col-sm-6 col-xs-12">
                        <div class="item">
                            <h4>Action</h4>
                            <div class="thumb">
                                <a href="product-details.html"><img src="assets/images/categories-01.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg col-sm-6 col-xs-12">
                        <div class="item">
                            <h4>Action</h4>
                            <div class="thumb">
                                <a href="product-details.html"><img src="assets/images/categories-05.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg col-sm-6 col-xs-12">
                        <div class="item">
                            <h4>Action</h4>
                            <div class="thumb">
                                <a href="product-details.html"><img src="assets/images/categories-03.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg col-sm-6 col-xs-12">
                        <div class="item">
                            <h4>Action</h4>
                            <div class="thumb">
                                <a href="product-details.html"><img src="assets/images/categories-04.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg col-sm-6 col-xs-12">
                        <div class="item">
                            <h4>Action</h4>
                            <div class="thumb">
                                <a href="product-details.html"><img src="assets/images/categories-05.jpg" alt=""></a>
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
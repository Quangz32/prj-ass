<%
    System.out.println(game);
%>

<div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6">
    <div class="item">
        <div class="thumb">
            <a href="product-details.html"><img src="<%= game.getImageURL()%>" alt=""></a>
            <span class="price"><em>$<%= game.getListedPrice()%></em>$<%= game.getDiscountPrice()%></span>
        </div>
        <div class="down-content">
            <span class="category">Action</span>
            <h4><%= game.getName() %></h4>
            <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
        </div>
    </div>
</div>
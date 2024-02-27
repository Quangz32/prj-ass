<%
    //Get categories of a game: String("A B C")
    String categories_string = "";
    ArrayList<Category> categories_of_game = game.getCategories();
    
    for (Category category : categories_of_game){
        categories_string += category.getName() + " ";
    }
%>

<div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items <%=categories_string%>">
    <div class="item">
        <div class="thumb">
            <span style="display: none"> <%= game.getId() %></span>
            <a href="/Ass1/product/<%= game.getId() %>">    
                <img src="<%= game.getImagePath() %>" alt="" style="height: 200px ">
            </a>
            <span class="price"><em>$<%= game.getListedPrice()%></em>$<%= game.getDiscountPrice()%></span>
        </div>
        <div class="down-content">
            <span class="category">Action</span>
            <h4><%= game.getName() %></h4>
            <a href="product-details.html"><i class="fa fa-shopping-bag"></i></a>
        </div>
    </div>
</div>

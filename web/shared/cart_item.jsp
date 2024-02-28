<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>


<%
    //This page need a parameter: CartItem cart_item
    
    //CartItemDAO ciDAO = new CartItemDAO();
    //CartItem card_item = ciDAO.getByUserIdAndGameId(4,2);
    
    //CartItem card_item = request.getAttribute("card_item");
    
    GameDAO gDAO = new GameDAO();
    
    int game_id = cart_item.getGameId();
    
    Game game = gDAO.getById(game_id);
%>


<div class="row mb-xxl-5">
    <div class="col-lg-4">
        <img src="<%= game.getImagePath() %>" style="">
    </div>

    <div class="col-lg-8">
        <h3><%=game.getName()%></h3>
        <p><%=game.getDetail().getIntroduction()%></p>
        <span class="price"><em  style="text-decoration: line-through">$<%= game.getListedPrice()%></em> $<%= game.getDiscountPrice()%></span>

    </div>


</div>


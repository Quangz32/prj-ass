<%
    GameDAO gDAO = new GameDAO();
    int game_id = cart_item.getGameId();
    Game game = gDAO.getById(game_id);
    
    String game_intro = game.getDetail().getIntroduction();
    int shorten_intro_length = (game_intro.length() < 55) ? game_intro.length() : 55;
%>


<div class="row" style="margin-bottom: 30px;">

    <div class="col-lg-1 d-flex justify-content-center align-items-center">
        <input type="checkbox" name="cart-items" value="<%= cart_item.getId() %>" 
                class="big-checkbox-3">        
    </div>

    <div class="col-lg-4">
        <a href="/Ass1/product/<%= game.getId() %>">
           <img src="<%= game.getImagePath() %>" style="">
        </a>
    </div>

    <div class="col-lg-6">

        <h4 class="mt-3"><%=game.getName()%></h4>

        <div id="<%= "intro-close-" + game.getId() %>" >
            <p id="intro-part"><%= game_intro.substring(0, shorten_intro_length) + "..."%>

                <a class="text-white qz-cursor-pointer" onclick="toggleContent(<%= game.getId() %>)">Read more</a>
            </p>
        </div>
        <div id="<%= "intro-open-" + game.getId() %>" style="display: none">
            <p id="intro-full"><%= game_intro %>
                <a class="text-white qz-cursor-pointer" onclick="toggleContent(<%= game.getId() %>)">Read less</a>
            </p>
        </div>

        <span class="d-block fs-2" style="font-size: 1.5rem">
            <em  class="text-decoration-line-through">$<%= game.getListedPrice()%></em>
            $<%= game.getDiscountPrice() %>
        </span><br>

        <span style="font-size: 1.2rem; color: yellow">
            Quantity: <%= cart_item.getQuantity() %>
        </span>

    </div>

    <div id="total-<%= cart_item.getId() %>" class="d-none col-lg-1 d-flex justify-content-center align-items-center hiding">
        <span class="ms-3 fs-2">
            $<%= cart_item.getQuantity() * game.getDiscountPrice() %>
        </span>
    </div>
</div>
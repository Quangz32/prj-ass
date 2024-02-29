<%
    GameDAO gDAO = new GameDAO();
    int game_id = cart_item.getGameId();
    Game game = gDAO.getById(game_id);
    
    String game_intro = game.getDetail().getIntroduction();
    int shorten_intro_length = (game_intro.length() < 55) ? game_intro.length() : 55;
%>


<div class="row" style="margin-bottom: 30px">

    <div class="col-lg-1 d-flex justify-content-center align-items-center">
        <input type="checkbox" onclick="showTotal(this, <%= game.getId() %>)" style="transform: scale(3);">        
        <label for="cart_checkbox" style="width: 100px"></label>
    </div>

    <div class="col-lg-4">
        <img src="<%= game.getImagePath() %>" style="">
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

        <span style="font-size: 1.5rem">
            <em  style="text-decoration: line-through">$<%= game.getListedPrice()%></em>
            $<%= game.getDiscountPrice()%>
        </span><br>

        <span style="font-size: 1.2rem; color: yellow">
            Quantity: <%= cart_item.getQuantity() %>
        </span>



    </div>

    <div id="total-<%= game.getId() %>" class="d-none col-lg-1 d-flex justify-content-center align-items-center hiding">
        <span style="font-size: 1.5rem" class="ms-3">
            $<%= cart_item.getQuantity() * game.getDiscountPrice() %>
        </span>
    </div>
</div>
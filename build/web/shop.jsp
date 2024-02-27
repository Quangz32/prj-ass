<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

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
                        <span class="breadcrumb"><a href="#">Home</a> > Our Shop</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="section trending">
            <div class="container">
                <ul class="trending-filter">
                    <li>
                        <a class="is_active" href="#!" data-filter="*">Show All</a>
                    </li>

                    
                    <%
                        //Create sorting
                        CategoryDAO cateDAO = new CategoryDAO();
                        ArrayList<Category> categories = cateDAO.getAll();
                        
                    for (Category category : categories){
                    %>
                        <li>
                            <a href="#!" data-filter=".<%= category.getName() %>"><%= category.getName() %></a>
                        </li>

                    <% } %>
                </ul>
                <div class="row trending-box">
                    <%
                        GameDAO gameDAO = new GameDAO();
                        
                        ArrayList<Game> gameList = new ArrayList<>();
                        gameList = gameDAO.getAll();
                        
                        for (Game game : gameList){
                    %>   

                    <%@include file="shared/game_card.jsp" %>

                    <%
                        }
                    %>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <li><a href="#"> &lt; </a></li>
                            <li><a href="#">1</a></li>
                            <li><a class="is_active" href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#"> &gt; </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>
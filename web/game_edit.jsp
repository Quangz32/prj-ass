<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a Game</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div style="color: white;" class="page-heading">
            <div style="margin: auto; text-align: left; display: inline-block">
                <h2 style="color: white; margin-bottom: 20px; text-align: center">Edit the game</h2>
                <form action="/Ass1/game/edit" method="POST" enctype="multipart/form-data">
                    <input type="text" name="gameid" value="${game.getId()}" hidden>
                    
                    <label for="gameName">Game Name:</label>
                    <input type="text" id="gameName" name="gameName" required value="${game.getName()}"><br><br>

                    <label for="listedPrice">Listed Price:</label>
                    <input type="number" id="listedPrice" name="listedPrice" required value="${game.getListedPrice()}"><br><br>

                    <label for="discountPrice">Discount Price:</label>
                    <input type="number" id="discountPrice" name="discountPrice" required value="${game.getDiscountPrice()}"><br><br>

                    <label for="image">Image (Upload if need to change) :</label>
                    <input type="file" id="image" name="image" accept="image/*" required"><br><br>

                    <div id="categories">
                        <label>Categories:</label> <br>
                        <% 
                            CategoryDAO cateDAO = new CategoryDAO();
                            ArrayList<Category> categories = cateDAO.getAll();
                            
                            Game game = (Game) request.getAttribute("game");
                            
                            for (Category category : categories){
                            
                            boolean is_checked = false;
                            for (Category game_cate : game.getCategories()){
                                    if (game_cate.getId() == category.getId()){
                                    is_checked = true;
                                }
                            }
                
                        %>
                        <input type="checkbox" id="<%= category.getName() %>" name="categories" value="<%= category.getId()%>" <%= (is_checked) ? "checked" : ""%> >
                        <label for="<%= category.getName() %>"><%= category.getName() %></label><br>
                        <% } %>
                    </div>


                    <label for="introduction">Introduction:</label><br>
                    <textarea id="introduction" name="introduction" rows="4" cols="50" value="">
                        <%= game.getDetail().getIntroduction()%>
                    </textarea><br><br>

                    <label for="description">Description:</label><br>
                    <textarea id="description" name="description" rows="8" cols="50" value="">
                        <%= game.getDetail().getDescription()%>
                    </textarea><br><br>

                    <input type="submit" value="Update" style="display: block; margin: 0 auto; border-radius: 6px">
                </form>
            </div>

        </div>


        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>
    </body>
</html>

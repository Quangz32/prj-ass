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
                <h2 style="color: white; margin-bottom: 20px; text-align: center">Add a Game</h2>
                <form action="admin/game/insert" method="POST" enctype="multipart/form-data">
                    <label for="gameName">Game Name:</label>
                    <input type="text" id="gameName" name="gameName" required><br><br>

                    <label for="listedPrice">Listed Price:</label>
                    <input type="number" id="listedPrice" name="listedPrice" required><br><br>

                    <label for="discountPrice">Discount Price:</label>
                    <input type="number" id="discountPrice" name="discountPrice" required><br><br>

                    <label for="image">Image:</label>
                    <input type="file" id="image" name="image" accept="image/*" required><br><br>

                    <div id="categories">
                        <label>Categories:</label> <br>
                        <% 
                            CategoryDAO cateDAO = new CategoryDAO();
                            ArrayList<Category> categories = cateDAO.getAll();
                            for (Category category : categories){ 
                
                        %>
                        <input type="checkbox" id="<%= category.getName() %>" name="categories" value="<%= category.getId()%>">
                        <label for="<%= category.getName() %>"><%= category.getName() %></label><br>
                        <% } %>
                    </div>


                    <label for="introduction">Introduction:</label><br>
                    <textarea id="introduction" name="introduction" rows="4" cols="50"></textarea><br><br>

                    <label for="description">Description:</label><br>
                    <textarea id="description" name="description" rows="8" cols="50"></textarea><br><br>

                    <input type="submit" value="Submit" style="display: block; margin: 0 auto; border-radius: 6px">
                </form>
            </div>

        </div>


        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>
    </body>
</html>

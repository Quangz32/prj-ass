<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a Game</title>
    </head>
    <body>
        <h2>Add a Game</h2>
        <form action="admin/game/insert" method="POST" enctype="multipart/form-data">
            <label for="gameName">Game Name:</label>
            <input type="text" id="gameName" name="gameName" required><br><br>

            <label for="listedPrice">Listed Price:</label>
            <input type="number" id="listedPrice" name="listedPrice" required><br><br>

            <label for="discountPrice">Discount Price:</label>
            <input type="number" id="discountPrice" name="discountPrice" required><br><br>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required><br><br>

            <label>Categories:</label> <br>
            <% 
                CategoryDAO cateDAO = new CategoryDAO();
                ArrayList<Category> categories = cateDAO.getAll();
                for (Category category : categories){ 
                
            %>
            <input type="checkbox" id="<%= category.getName() %>" name="categories" value="<%= category.getId()%>">
            <label for="<%= category.getName() %>"><%= category.getName() %></label><br>
            <% } %>

            <label for="introduction">Introduction:</label><br>
            <textarea id="introduction" name="introduction" rows="4" cols="50"></textarea><br><br>

            <label for="description">Description:</label><br>
            <textarea id="description" name="description" rows="8" cols="50"></textarea><br><br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>
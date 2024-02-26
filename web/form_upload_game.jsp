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

    <input type="submit" value="Submit">
  </form>
</body>
</html>

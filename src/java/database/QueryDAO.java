/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.ArrayList;
import model.Game;
import java.sql.ResultSet;

public class QueryDAO extends MyDAO {

    public ArrayList<Game> getHotGames() {
        ArrayList<Game> hot_games = new ArrayList<>();

        GameDAO gameDAO = new GameDAO();

        String tablex
                = "SELECT ci.gameId, ci.quantity\n"
                + "    FROM OrderItems oi \n"
                + "    INNER JOIN Orders o ON oi.orderId = o.id\n"
                + "    INNER JOIN CartItems ci ON ci.id = oi.cartItemId\n"
                + "    WHERE O.orderDate >= DATEADD(WEEK, -1, GETDATE())";

        xSql = "WITH tablex AS (" + tablex + ")"
                + "SELECT TOP 4 gameId, SUM(quantity) AS sold_quantity\n"
                + "FROM tablex\n"
                + "GROUP BY gameId\n"
                + "ORDER BY sold_quantity DESC;";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int game_id = rs.getInt("gameId");
                Game game = gameDAO.getById(game_id);
                hot_games.add(game);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hot_games;
    }

    //get the game have the same genre(s), show 5 newest game
    public ArrayList<Game> getRelatedGames(int game_id) {
        ArrayList<Game> related_games = new ArrayList<>();

        GameDAO gameDAO = new GameDAO();

        String tablex = "SELECT categoryId FROM Game_Category WHERE gameId = " + game_id;

        xSql = "SELECT DISTINCT TOP 5 gameId\n"
                + "FROM Game_Category\n"
                + "WHERE categoryId IN (\n"
                + tablex + ("\n")
                + ")\n"
                + "ORDER BY gameId DESC;";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int game_idx = rs.getInt("gameId");
                Game game = gameDAO.getById(game_idx);
                related_games.add(game);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return related_games;
    }

    //Get the sold quantity and total of games in days
    public ResultSet getReport(int days, int category_id) {
        ArrayList<Game> related_games = new ArrayList<>();

        GameDAO gameDAO = new GameDAO();

        String tablex = "SELECT oi.id,ci.gameId,ci.quantity,oi.price*ci.quantity AS 'money'\n"
                + "   FROM OrderItems oi\n"
                + "   INNER JOIN Orders o ON oi.orderId = o.id\n"
                + "   INNER JOIN CartItems ci ON ci.id = oi.cartItemId\n";

        String date_condition = "O.orderDate >= DATEADD(DAY, -" + days + ", GETDATE())";
        String category_condition = "EXISTS (SELECT * from Game_Category gc \n"
                + " where gc.gameId = ci.gameId and gc.categoryId = " + category_id + ")";

        if (days > 0 || category_id > 0) {
            tablex += " WHERE ";
        }
        if (days > 0) {
            tablex += date_condition;
        }
        if (days > 0 && category_id > 0) {
            tablex += " AND ";
        }
        if (category_id > 0) {
            tablex += category_condition;
        }

        xSql = "WITH tablex AS\n"
                + "  (\n"
                + tablex + ("\n")
                + "   )\n"
                + "SELECT gameId,\n"
                + "       sum(quantity) AS 'sold',\n"
                + "       sum(MONEY) AS 'total'\n"
                + "FROM tablex\n"
                + "GROUP BY gameId\n"
                + "ORDER BY [total] DESC";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
//            while (rs.next()) {
//                int game_idx = rs.getInt("gameId");
//                Game game = gameDAO.getById(game_idx);
//                related_games.add(game);
//
//            }
            return rs;
//            rs.close();
//            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}

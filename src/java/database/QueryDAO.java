/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.util.ArrayList;
import model.Game;

/**
 *
 * @author quang
 */
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
}

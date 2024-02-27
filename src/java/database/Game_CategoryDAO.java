package database;

import model.*;
import java.util.*;

public class Game_CategoryDAO extends MyDAO {

    public void addGameCategory(int game_id, int category_id) {
        xSql = "insert into Game_Category values (?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, game_id);
            ps.setInt(2, category_id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Category> getCategoriesByGame(Game game) {
        CategoryDAO cDAO = new CategoryDAO();

        ArrayList<Category> categories = new ArrayList<>();

        xSql = "select categoryId from Game_Category where gameId = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, game.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                Category category = cDAO.getById(categoryId);
                categories.add(category);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return (categories);
    }

    public ArrayList<Game> getGamesByCategory(Category category) {

        GameDAO gDAO = new GameDAO();
        ArrayList<Game> games = new ArrayList<>();

        xSql = "select gameId from Game_Category where categoryId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, category.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                int gameId = rs.getInt("gameId");
                Game game_i = gDAO.getById(gameId);
                games.add(game_i);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (games);
    }
}

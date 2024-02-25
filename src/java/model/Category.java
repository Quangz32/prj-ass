package model;

import database.GameDAO;
import database.MyDAO;
import java.util.ArrayList;

public class Category {

    int id;
    String name;

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + '}';
    }

    ////
    public ArrayList<Game> getGames() {

        GameDAO gDAO = new GameDAO();

        ArrayList<Game> games = new ArrayList<>();

        MyDAO mydao = new MyDAO();
        mydao.xSql = "select * from Game_Category where categoryId = ?";

        try {
            mydao.ps = mydao.con.prepareStatement(mydao.xSql);
            mydao.ps.setInt(1, this.id);
            mydao.rs = mydao.ps.executeQuery();
            while (mydao.rs.next()) {
                int gameId = mydao.rs.getInt("gameId");

                Game game_i = gDAO.getById(gameId);

                games.add(game_i);
            }
            mydao.rs.close();
            mydao.ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (games);
    }

}

package model;

import database.GameDAO;
import database.Game_CategoryDAO;
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
        Game_CategoryDAO gcDAO = new Game_CategoryDAO();
        return gcDAO.getGamesByCategory(this);
    }
}

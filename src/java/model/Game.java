package model;

import java.util.*;
import database.*;

public class Game {

    int id;
    String name;
    int listedPrice;
    int discountPrice;
    String imageURL;    //should be imageFileName **

    public Game(int id, String name, int listedPrice, int discountPrice, String imageURL) {
        this.id = id;
        this.name = name;
        this.listedPrice = listedPrice;
        this.discountPrice = discountPrice;
        this.imageURL = imageURL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageURL() {
        return imageURL;
    }

    public String getImagePath() {
        return "/Ass1/assets/images/" + imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getListedPrice() {
        return listedPrice;
    }

    public void setListedPrice(int listedPrice) {
        this.listedPrice = listedPrice;
    }

    public int getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(int discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Game{" + "id=" + id + ", imageURL=" + imageURL + ", listedPrice=" + listedPrice + ", discountPrice=" + discountPrice + ", name=" + name + '}';
    }

    ////////////
    public void insertToDatabase() {
        GameDAO gDAO = new GameDAO();
        gDAO.insert(this);
    }

    public ArrayList<Category> getCategories() {
        Game_CategoryDAO gcDAO = new Game_CategoryDAO();
        return gcDAO.getCategoriesByGame(this);
    }

    public void addCategory(int category_id) {
        Game_CategoryDAO gcDAO = new Game_CategoryDAO();
        gcDAO.addGameCategory(this.id, category_id);
    }
    
    public void addDetail(String introduction, String description){
        GameDetail game_detail = new GameDetail(this.id, introduction, description);
        GameDetailDAO gdDAO = new GameDetailDAO();
        gdDAO.insert(game_detail);
    }
    
    public GameDetail getDetail(){
        GameDetailDAO gdDAO = new GameDetailDAO();
        return gdDAO.getByGameId(this.id);
    }

}

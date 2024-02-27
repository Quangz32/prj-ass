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
    public void insertToDatabase(){
        GameDAO gDAO = new GameDAO();
        gDAO.insert(this);
    }
    
    public ArrayList<Category> getCategories() {

        CategoryDAO cDAO = new CategoryDAO();

        ArrayList<Category> categories = new ArrayList<>();

        MyDAO mydao = new MyDAO();
        mydao.xSql = "select * from Game_Category where gameId = ?";

        try {
            mydao.ps = mydao.con.prepareStatement(mydao.xSql);
            mydao.ps.setInt(1, this.id);
            mydao.rs = mydao.ps.executeQuery();
            while (mydao.rs.next()) {
                int categoryId = mydao.rs.getInt("categoryId");
                categories.add(cDAO.getById(categoryId));
            }
            mydao.rs.close();
            mydao.ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return (categories);
    }
    
    public void addCategory(int category_id){
        
        MyDAO mydao = new MyDAO();
        mydao.xSql = "insert into Game_Category values (?,?)";

        try {
            mydao.ps = mydao.con.prepareStatement(mydao.xSql);
            mydao.ps.setInt(1, this.id);
            mydao.ps.setInt(2, category_id);

            mydao.ps.executeUpdate();
            mydao.ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

package model;

import java.util.*;
import database.*;

public class Game {

    int id;
    String name;
    int listedPrice;
    int discountPrice;
    String imageURL;

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

}

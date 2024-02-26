package database;

import java.util.*;
import model.Category;

public class CategoryDAO extends MyDAO {

    public ArrayList<Category> getAll() {

        int idz;
        String namez;

        ArrayList<Category> categories = new ArrayList<>();
        xSql = "select * from Categories";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("id");
                namez = rs.getString("name");

                Category cate = new Category(idz, namez);
                categories.add(cate);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (categories);
    }

    public Category getById(int searchId) {

        int idz;
        String namez;

        ArrayList<Category> categories = new ArrayList<>();
        xSql = "select * from Categories where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, searchId);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("id");
                namez = rs.getString("name");
                Category cate = new Category(idz, namez);

                return cate;    //If exist, return
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public void insert(Category category) {
        xSql = "insert into Categories values (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, category.getName());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

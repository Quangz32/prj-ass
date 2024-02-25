package database;

import java.util.*;
import model.Game;

public class GameDAO extends MyDAO {

    public ArrayList<Game> getAll() {

        int idz;
        String namez;
        int listedPricez;
        int discountPricez;
        String imageURLz;

        ArrayList<Game> gameList = new ArrayList<>();
        xSql = "select * from Games";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("id");
                namez = rs.getString("name");
                listedPricez = rs.getInt("listedPrice");
                discountPricez = rs.getInt("discountPrice");
                imageURLz = rs.getString("imageURL");
                Game game_i = new Game(idz, namez, listedPricez, discountPricez, imageURLz);
                System.out.println(game_i);
                gameList.add(game_i);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (gameList);
    }
    
    public Game getById(int searchId) {

        int idz;
        String namez;
        int listedPricez;
        int discountPricez;
        String imageURLz;

        ArrayList<Game> gameList = new ArrayList<>();
        xSql = "select * from Games where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, searchId);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("id");
                namez = rs.getString("name");
                listedPricez = rs.getInt("listedPrice");
                discountPricez = rs.getInt("discountPrice");
                imageURLz = rs.getString("imageURL");
                Game game_i = new Game(idz, namez, listedPricez, discountPricez, imageURLz);
                
                return game_i;  //return 
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;    //return nothing
    }

    public void insert(Game gameToInsert) {
        xSql = "insert into Games values (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, gameToInsert.getId());
            ps.setString(2, gameToInsert.getName());
            ps.setInt(3, gameToInsert.getListedPrice());
            ps.setInt(4, gameToInsert.getDiscountPrice());
            ps.setString(5, gameToInsert.getImageURL());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

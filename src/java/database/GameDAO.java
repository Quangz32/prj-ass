package database;

import java.util.*;
import model.Game;
import java.sql.*;

public class GameDAO extends MyDAO {

    private Game getGameInRS(ResultSet rs) throws Exception {
        int idz = rs.getInt("id");
        String namez = rs.getString("name");
        int listedPricez = rs.getInt("listedPrice");
        int discountPricez = rs.getInt("discountPrice");
        String imageURLz = rs.getString("imageURL");

        Game game_i = new Game(idz, namez, listedPricez, discountPricez, imageURLz);

        return game_i;
    }

    public ArrayList<Game> getAll() {
        ArrayList<Game> gameList = new ArrayList<>();
        xSql = "select * from Games where id not in (\n"
                + "	select * from DeletedGames\n"
                + ")";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Game game_i = this.getGameInRS(rs);
                gameList.add(game_i);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (gameList);
    }

    public Game getLast() {

        int idz;
        String namez;
        int listedPricez;
        int discountPricez;
        String imageURLz;

        xSql = "SELECT TOP 1 * FROM Games ORDER BY ID DESC;";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Game game_i = this.getGameInRS(rs);

                return game_i;  //return 
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;    //return nothing
    }

    public Game getById(int searchId) {

        int idz;
        String namez;
        int listedPricez;
        int discountPricez;
        String imageURLz;

        xSql = "select * from Games where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, searchId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Game game_i = this.getGameInRS(rs);
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
        xSql = "insert into Games values (?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, gameToInsert.getName());
            ps.setInt(2, gameToInsert.getListedPrice());
            ps.setInt(3, gameToInsert.getDiscountPrice());
            ps.setString(4, gameToInsert.getImageURL());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int game_id) {
        xSql = "insert into DeletedGames values (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, game_id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Game> getDeletedGames() {
        ArrayList<Game> deleted_games = new ArrayList<>();
        xSql = "select * from DeletedGames";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int game_id = rs.getInt("gameId");
                deleted_games.add(this.getById(game_id));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (deleted_games);
    }

    public void Update(int gameid, Game game_info) {
//        xSql = "UPDATE Games\n"
//                + "SET name = ?, \n"
//                + "listedPrice=?, \n"
//                + "discountPrice = ?, \n"
//                + "imageURL = ?\n"
//                + "WHERE id = ?;";

        String s1 = "UPDATE Games\n"
                + "SET name = ?, \n"
                + "listedPrice=?,\n";
        String s3 = "discountPrice = ?\n"
                + "WHERE id = ?;";

        String s2 = ""; //imageURL = '',

        if (!game_info.getImageURL().isEmpty()) {
            s2 = "imageURL = '" + game_info.getImageURL() + "',\n";;
            //ps.setString(4, game_info.getImageURL());
        }

        xSql = s1 + s2 + s3;

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, game_info.getName());
            ps.setInt(2, game_info.getListedPrice());
            ps.setInt(3, game_info.getDiscountPrice());
            ps.setInt(4, gameid);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

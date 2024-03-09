package database;

import java.util.*;
import model.GameDetail;

public class GameDetailDAO extends MyDAO {

    public ArrayList<GameDetail> getAll() {

        int idz;
        String introz;
        String descriptz;

        ArrayList<GameDetail> game_details = new ArrayList<>();
        xSql = "select * from GameDetails";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("gameId");
                introz = rs.getString("introduction");
                descriptz = rs.getString("description");

                GameDetail game_detail = new GameDetail(idz, introz, descriptz);
                game_details.add(game_detail);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (game_details);
    }

    public GameDetail getByGameId(int gameId) {

        xSql = "select * from GameDetails where gameId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, gameId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idz = rs.getInt("gameId");
                String introz = rs.getString("introduction");
                String descriptz = rs.getString("description");

                GameDetail game_detail = new GameDetail(idz, introz, descriptz);

                return game_detail;    //If exist, return
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public void insert(GameDetail game_detail) {
        xSql = "insert into GameDetails values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, game_detail.getGameId());
            ps.setString(2, game_detail.getIntroduction());
            ps.setString(3, game_detail.getDescription());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(int gameid, String new_intro, String new_desc) {
        xSql = "UPDATE GameDetails set introduction = ?, description = ? where gameId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, new_intro);
            ps.setString(2, new_desc);
            ps.setInt(3, gameid);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

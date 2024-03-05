package database;

import model.Feedback;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Feedback;

public class FeedbackDAO extends MyDAO {

    public ArrayList<Feedback> getAll() {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        xSql = "select * from Feedbacks";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                feedbacks.add(getFeedback(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbacks;
    }

    public Feedback getById(int feedback_id) {
        xSql = "select * from Feedbacks where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, feedback_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getFeedback(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Feedback> getByGameId(int game_id) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        xSql = "select * from Feedbacks where gameId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, game_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                feedbacks.add(getFeedback(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbacks;
    }

    public void insert(Feedback feedback) {
        xSql = "insert into Feedbacks (userId, gameId, content) values (?, ?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, feedback.getUserId());
            ps.setInt(2, feedback.getGameId());
            ps.setString(3, feedback.getContent());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //
    private Feedback getFeedback(ResultSet rs) throws Exception {
        int id = rs.getInt("id");
        int userid = rs.getInt("userId");
        int gameid = rs.getInt("gameId");
        String content = rs.getString("content");

        return new Feedback(id, userid, gameid, content);

    }
}

package database;

import java.util.ArrayList;
import model.User;
import java.sql.ResultSet;

public class UserDAO extends MyDAO {

    public ArrayList<User> getAll() {

        ArrayList<User> userList = new ArrayList<>();
        xSql = "select * from Users";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {

                userList.add(getUser(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (userList);
    }

    public User getLast() {

        xSql = "SELECT TOP 1 * FROM Users ORDER BY ID DESC;";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getUser(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;    //return nothing
    }

    public User getById(int searchId) {

        xSql = "select * from Users where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, searchId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getUser(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;    //return nothing
    }

    public User getByEmailPassword(String email, String password) {

        xSql = "select * from Users where email = ? and password = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            ps.setString(2, Lib.MyLib.hashString(password));
            rs = ps.executeQuery();
            while (rs.next()) {
                return getUser(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;    //return nothing
    }

    public void insert(User userToInsert) {
        xSql = "insert into Users values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userToInsert.getName());
            ps.setString(2, userToInsert.getEmail());
            ps.setString(3, userToInsert.getPassword());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePassword(int user_id, String new_pass) {
        xSql = "update Users set password = ? where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            // ps.setInt(1, cart_item.getId());
            ps.setString(1, new_pass);
            ps.setInt(2, user_id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // HELP FUNCTION
    private User getUser(ResultSet rs) throws Exception {
        int idz = rs.getInt("id");
        String namez = rs.getString("name");
        String gmailz = rs.getString("email");
        String passwordz = rs.getString("password");
        User user = new User(idz, namez, gmailz, passwordz);
        return user;
    }

}

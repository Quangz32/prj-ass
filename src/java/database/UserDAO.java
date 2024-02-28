package database;

import java.util.ArrayList;
import model.User;

public class UserDAO extends MyDAO {

    public ArrayList<User> getAll() {

        int idz;
        String namez;
        String gmailz;
        String passwordz;

        ArrayList<User> userList = new ArrayList<>();
        xSql = "select * from Users";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idz = rs.getInt("id");
                namez = rs.getString("name");
                gmailz = rs.getString("email");
                passwordz = rs.getString("password");
                User user_i = new User(idz, namez, gmailz, passwordz);
                //System.out.println(user_i);
                userList.add(user_i);
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
                int idz = rs.getInt("id");
                String namez = rs.getString("name");
                String gmailz = rs.getString("email");
                String passwordz = rs.getString("password");
                User user_i = new User(idz, namez, gmailz, passwordz);

                return user_i;  //return 
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
                int idz = rs.getInt("id");
                String namez = rs.getString("name");
                String gmailz = rs.getString("email");
                String passwordz = rs.getString("password");
                User user_i = new User(idz, namez, gmailz, passwordz);

                return user_i;  //return 
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
}

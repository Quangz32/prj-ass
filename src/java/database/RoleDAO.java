package database;

import java.util.ArrayList;
import model.*;

public class RoleDAO extends MyDAO {

    public String getRole(int user_id) {
        xSql = "select * from Roles where userId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                return (rs.getString("role"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (null);
    }
}

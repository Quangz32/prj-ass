package database;

import java.util.ArrayList;
import model.*;

public class CartItemDAO extends MyDAO {

    public ArrayList<CartItem> getAll() {
        int user_idz;
        int game_idz;
        int quantityz;

        ArrayList<CartItem> cart_items = new ArrayList<>();
        xSql = "select * from CartItems";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                user_idz = rs.getInt("userId");
                game_idz = rs.getInt("gameId");
                quantityz = rs.getInt("quantity");

                CartItem cart_item = new CartItem(user_idz, game_idz, quantityz);
                cart_items.add(cart_item);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (cart_items);
    }

    public CartItem getByUserIdAndGameId(int user_id, int game_id) {

        xSql = "select * from CartItems where userId = ? and gameId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);
            ps.setInt(2, game_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int user_idz = rs.getInt("userId");
                int game_idz = rs.getInt("gameId");
                int quantityz = rs.getInt("quantity");

                CartItem cart_item = new CartItem(user_idz, game_idz, quantityz);

                return cart_item;    //If exist, return
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }
    
    public ArrayList<CartItem> getByUserId(int user_id) {
        
        int user_idz;
        int game_idz;
        int quantityz;
        
        ArrayList<CartItem> cart_items = new ArrayList<>();

        xSql = "select * from CartItems where userId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                user_idz = rs.getInt("userId");
                game_idz = rs.getInt("gameId");
                quantityz = rs.getInt("quantity");
                CartItem cart_item = new CartItem(user_idz, game_idz, quantityz);

                cart_items.add(cart_item);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cart_items;

    }

    public void insert(CartItem cart_item) {
        xSql = "insert into CartItems values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            // ps.setInt(1, cart_item.getId());
            ps.setInt(1, cart_item.getUserId());
            ps.setInt(2, cart_item.getGameId());
            ps.setInt(3, cart_item.getQuantity());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(CartItem cart_item) {
        xSql = "update CartItems set quantity = ? where userId = ? and gameId = ?";
        try {
            ps = con.prepareStatement(xSql);
            // ps.setInt(1, cart_item.getId());
            ps.setInt(1, cart_item.getQuantity());
            ps.setInt(2, cart_item.getUserId());
            ps.setInt(3, cart_item.getGameId());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

package database;

import java.util.ArrayList;
import model.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemDAO extends MyDAO {

    public ArrayList<CartItem> getAll() {
        ArrayList<CartItem> cart_items = new ArrayList<>();
        xSql = "select * from CartItems";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cart_items.add(getCartItem(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (cart_items);
    }

    public ArrayList<CartItem> getByUserIdAndStatus(int user_id, String status) {
        ArrayList<CartItem> cart_items = new ArrayList<>();
        xSql = "select * from CartItems where userId = ? and status = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);
            ps.setString(2, status);

            rs = ps.executeQuery();
            while (rs.next()) {
                cart_items.add(getCartItem(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (cart_items);
    }

    public CartItem getByUserIdAndGameIdAndStatus(int user_id, int game_id, String status) {
        xSql = "select * from CartItems where userId = ? and gameId = ? and status = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);
            ps.setInt(2, game_id);
            ps.setString(3, status);

            rs = ps.executeQuery();
            while (rs.next()) {
                return this.getCartItem(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

//    public CartItem getByUserIdAndGameId(int user_id, int game_id) {
//
//        xSql = "select * from CartItems where userId = ? and gameId = ?";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setInt(1, user_id);
//            ps.setInt(2, game_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                int user_idz = rs.getInt("userId");
//                int game_idz = rs.getInt("gameId");
//                int quantityz = rs.getInt("quantity");
//
//                CartItem cart_item = new CartItem(user_idz, game_idz, quantityz);
//
//                return cart_item;    //If exist, return
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return null;
//
//    }
//    public ArrayList<CartItem> getByUserId(int user_id) {
//
////       int idz;
////        int user_idz;
////        int game_idz;
////        int quantityz;
////        String statusz;
//        ArrayList<CartItem> cart_items = new ArrayList<>();
//
//        xSql = "select * from CartItems where userId = ?";
//        try {
//            ps = con.prepareStatement(xSql);
//            ps.setInt(1, user_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//
//                CartItem cart_item = new CartItem(idz, user_idz, game_idz, quantityz, statusz);
//                cart_items.add(cart_item);
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return cart_items;
//
//    }
//
    public void insert(CartItem cart_item) {
        xSql = "insert into CartItems values (?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            // ps.setInt(1, cart_item.getId());
            ps.setInt(1, cart_item.getUserId());
            ps.setInt(2, cart_item.getGameId());
            ps.setInt(3, cart_item.getQuantity());
            ps.setString(4, cart_item.getStatus());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateQuantity(int card_item_id, int new_quantity) {
        xSql = "update CartItems set quantity = ? where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            // ps.setInt(1, cart_item.getId());
            ps.setInt(1, new_quantity);
            ps.setInt(2, card_item_id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get a CartItem from curren rs =====================
    private CartItem getCartItem(ResultSet rs) throws Exception {
        int idz = rs.getInt("id");
        int user_idz = rs.getInt("userId");
        int game_idz = rs.getInt("gameId");
        int quantityz = rs.getInt("quantity");
        String statusz = rs.getString("status");

        return new CartItem(idz, user_idz, game_idz, quantityz, statusz);
    }

}

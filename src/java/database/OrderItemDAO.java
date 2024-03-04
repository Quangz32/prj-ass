/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import model.OrderItem;
import java.sql.*;
import java.util.ArrayList;

public class OrderItemDAO extends MyDAO {

    public ArrayList<OrderItem> getAll() {
        ArrayList<OrderItem> order_items = new ArrayList<>();
        xSql = "select * from OrderItems";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                order_items.add(getOrderItem(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order_items;
    }

    public OrderItem getById(int order_item_id) {

        xSql = "select * from OrderItems where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, order_item_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getOrderItem(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(OrderItem order_item) {
        xSql = "insert into OrderItems (orderId, cartItemId, price) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, order_item.getOrderId());
            ps.setInt(2, order_item.getCartItemId());
            ps.setInt(3, order_item.getPrice());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private OrderItem getOrderItem(ResultSet rs) throws Exception {
        int idz = rs.getInt("id");
        int order_idz = rs.getInt("orderId");
        int cart_item_idz = rs.getInt("cartItemId");
        int pricez = rs.getInt("price");

        return new OrderItem(idz, order_idz, cart_item_idz, pricez);
    }
}

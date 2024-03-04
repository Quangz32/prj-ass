/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Order;

public class OrderDAO extends MyDAO {

    public ArrayList<Order> getAll() {
        ArrayList<Order> order_items = new ArrayList<>();
        xSql = "select * from Orders";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                order_items.add(getOrder(rs));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order_items;
    }

    public Order getById(int order_id) {
        xSql = "select * from Orders where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, order_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getOrder(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Order getLast() {
        xSql = "select TOP 1 * from Orders ORDER BY id DESC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return getOrder(rs);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(Order order) {
        xSql = "insert into Orders (userId, orderDate) values (?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, order.getUserId());
            ps.setTimestamp(2, Timestamp.valueOf(order.getOrderDate()));
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Order getOrder(ResultSet rs) throws Exception {
        int idz = rs.getInt("id");
        int user_idz = rs.getInt("userId");
        LocalDateTime order_datez = rs.getTimestamp("orderDate").toLocalDateTime();
        return new Order(idz, user_idz, order_datez);
    }
}

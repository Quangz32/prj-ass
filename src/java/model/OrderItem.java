/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import database.CartItemDAO;

public class OrderItem {
    private int id;
    private int orderId;
    private int cartItemId;
    private int price;

    public OrderItem(int id, int orderId, int cartItemId, int price) {
        this.id = id;
        this.orderId = orderId;
        this.cartItemId = cartItemId;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "id=" + id + ", orderId=" + orderId + ", cartItemId=" + cartItemId + ", price=" + price + '}';
    }
    
    ///
    public CartItem getCartItem(){
        CartItemDAO ciDAO = new CartItemDAO();
        return ciDAO.getById(this.cartItemId);
    }
 
}

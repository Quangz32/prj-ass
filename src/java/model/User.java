package model;

import database.*;
import java.util.ArrayList;
import java.sql.ResultSet;

public class User {

    int id;
    String name;
    String email;
    String password;

    public User() {
    }

    public User(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + '}';
    }

    ///
    public int numberOfItemInCart() {
        CartItemDAO ciDAO = new CartItemDAO();
        ArrayList<CartItem> cart_items = ciDAO.getByUserIdAndStatus(this.id, "in_cart");

        int number_of_item = 0;
        for (CartItem cart_item : cart_items) {
            number_of_item += cart_item.getQuantity();
            if (number_of_item > 99) {
                return 99;
            }
        }
        return number_of_item;
    }

    public boolean checkPassword(String pass_to_check) {
        return Lib.MyLib.hashString(pass_to_check).equals(this.password);
    }

}

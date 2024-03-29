/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cart;

import database.CartItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.CartItem;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("current_user") == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            //response.getWriter().print("AOWHFIOPAWFHFAIPWH");
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] cart_item_ids = request.getParameterValues("cart-items");

        User c_user = (User) request.getSession().getAttribute("current_user");
        if (c_user == null) {
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }

        ArrayList<CartItem> cart_items = new ArrayList<>();
        CartItemDAO ciDAO = new CartItemDAO();

        if (cart_item_ids != null) {
            for (int i = 0; i < cart_item_ids.length; i++) {
                int cart_item_id = Integer.parseInt(cart_item_ids[i]);
                CartItem cart_item = ciDAO.getById(cart_item_id);
                cart_items.add(cart_item);
                //response.getWriter().println(cart_item);
            }
        }

        request.setAttribute("cart_items", cart_items);

        request.getRequestDispatcher("cart_confirm.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

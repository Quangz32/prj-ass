/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Game;

import database.CartItemDAO;
import database.CategoryDAO;
import database.GameDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.CartItem;
import model.Category;
import model.Game;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/game/add_to_cart"})
public class AddToCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("/Ass1/dashboard").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        User current_user = (User) request.getSession().getAttribute("current_user");
        //IF NOT LOGGED IN
        if (current_user == null) {
            request.getRequestDispatcher("/login").forward(request, response);
            return;
        }

        String game_id_String = request.getParameter("game_id");
        String quantity_String = request.getParameter("quantity");
        int game_id = Integer.parseInt(game_id_String);
        int quantity = Integer.parseInt(quantity_String);

        CartItemDAO ciDAO = new CartItemDAO();
        CartItem cart_item = ciDAO.getByUserIdAndGameIdAndStatus(current_user.getId(), game_id, "in_cart");

        if (cart_item == null) {
            cart_item = new CartItem(-1, current_user.getId(), game_id, quantity, "in_cart");
            ciDAO.insert(cart_item);
        } else {
            int quantity_new = cart_item.getQuantity() + quantity;
            ciDAO.updateQuantity(cart_item.getId(), quantity_new);
        }

        //GO BACK TO SHOP PAGE
        request.getSession().setAttribute("notification-message", "Your game has been in the cart!");
        response.sendRedirect("/Ass1/shop");

        //request.getRequestDispatcher("/shop").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

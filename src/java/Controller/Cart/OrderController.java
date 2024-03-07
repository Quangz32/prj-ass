/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cart;

import database.CartItemDAO;
import database.GameDAO;
import database.OrderDAO;
import database.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import model.CartItem;
import model.Game;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getSession().setAttribute("notification-message", "Somthing went wrong!");
        response.sendRedirect("/Ass1/dashboard");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        User c_user = (User) request.getSession().getAttribute("current_user");
        //NOT LOGGED IN
        if (c_user == null) {
            request.getSession().setAttribute("notification-message", "You need to login first");
            response.sendRedirect("/Ass1/login");
            return;
        }

        //ELSE
        String[] cart_item_ids_s = request.getParameterValues("card_items");

        CartItemDAO ciDAO = new CartItemDAO();
        OrderItemDAO oiDAO = new OrderItemDAO();
        OrderDAO oDAO = new OrderDAO();
        GameDAO gDAO = new GameDAO();

        User now_user = (User) request.getSession().getAttribute("current_user");

        Order new_order = new Order(-1, now_user.getId(), LocalDateTime.now());
        oDAO.insert(new_order);
        new_order = oDAO.getLast();

        for (String cart_item_id_s : cart_item_ids_s) {
            int cart_item_id = Integer.parseInt(cart_item_id_s);

            CartItem cart_item = ciDAO.getById(cart_item_id);
            int game_id = cart_item.getGameId();
            Game game = gDAO.getById(game_id);

            ciDAO.updateStatus(cart_item_id, "buyed");

            OrderItem order_item = new OrderItem(-1, new_order.getId(), cart_item.getId(), game.getDiscountPrice());
            oiDAO.insert(order_item);

            //SEND CODE GAME TO EMAIL: (later) 
        }

        request.getSession().setAttribute("notification-message", "Order success. Key will be sent to your email");
        response.sendRedirect("/Ass1/dashboard");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

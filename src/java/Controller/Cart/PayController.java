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

/**
 *
 * @author quang
 */
@WebServlet(name = "PayController", urlPatterns = {"/pay"})
public class PayController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //IF PAYMENT FAILED
        if (! Lib.MyLib.isOrderSuccess()){
            request.setAttribute("notification-message", "You haven't made the payment");
            request.getRequestDispatcher("dashboard").forward(request, response);
            return;
        }
        
        //IF PAYMENT SUCCESS
        String[] cart_item_ids_s = request.getParameterValues("card_items");

        CartItemDAO ciDAO = new CartItemDAO();

        ArrayList<CartItem> cart_items = new ArrayList();
        for (String s : cart_item_ids_s) {
            int cart_item_id = Integer.parseInt(s);
            cart_items.add(ciDAO.getById(cart_item_id));
        }

        String order_total_string = request.getParameter("order_total");
        int order_total = Integer.parseInt(order_total_string);

        request.setAttribute("cart_items", cart_items);
        request.setAttribute("order_total", order_total);

        request.getRequestDispatcher("pay.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

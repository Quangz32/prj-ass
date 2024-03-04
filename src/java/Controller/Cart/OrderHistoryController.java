/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Cart;

import database.OrderDAO;
import database.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name="OrderHistoryController", urlPatterns={"/order_history"})
public class OrderHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        //IF NOT LOGGED IN
        User c_user = (User) request.getSession().getAttribute("current_user");
        if (c_user == null){
            request.setAttribute("notification-message", "You need to log in first!");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
        
        //ELSE, IF LOGGED IN
        
        OrderDAO oDAO = new OrderDAO();
        ArrayList<Order> orders = oDAO.getByUserId(c_user.getId());
        

        
        request.setAttribute("orders", orders);
        
        request.getRequestDispatcher("order_history.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

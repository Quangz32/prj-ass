/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Cart;

import database.OrderDAO;
import database.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name="AllOrderController", urlPatterns={"/admin/all_order"})
public class AllOrderController extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User c_user = (User) request.getSession().getAttribute("current_user");
        //NOT A USER
        if (c_user == null) {
            request.getSession().setAttribute("notification-message", "You need to login first");
            response.sendRedirect("/Ass1/login");
            return;
        }

        //IF NOT ADMIN
        RoleDAO rDAO = new RoleDAO();
        String user_role = rDAO.getRole(c_user.getId());
        if (!user_role.equals("admin")) {
            request.getSession().setAttribute("notification-message", "You have no permission");
            response.sendRedirect("/Ass1/dashboard");
            return;
        }

        //IF ADMIN
        
        OrderDAO oDAO = new OrderDAO();
        ArrayList<Order> orders = oDAO.getAll();
        request.setAttribute("orders", orders);
        
        request.getRequestDispatcher("/order_history.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

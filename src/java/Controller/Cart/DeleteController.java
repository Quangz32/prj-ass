/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.*;
import database.*;
import java.util.*;

@WebServlet(name = "DeleteController", urlPatterns = {"/delete_cart"})
public class DeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("notification-message", "Something went wrong!");
        response.sendRedirect("/Ass1/dashboard");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User c_user = (User) request.getSession().getAttribute("current_user");

        //NOT LOGGED IN
        if (c_user == null) {
            request.getSession().setAttribute("notification-message", "You need to login first");
            response.sendRedirect("/Ass1/login");
            return;
        }

        //LOGGED IN
        CartItemDAO ciDAO = new CartItemDAO();
        ArrayList<CartItem> cart_items = ciDAO.getByUserIdAndStatus(c_user.getId(), "in_cart");

        for (CartItem ci : cart_items) {
            ciDAO.delete(ci.getId());
        }

        request.getSession().setAttribute("notification-message", "Delete cart success!");
        response.sendRedirect("/Ass1/shop");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

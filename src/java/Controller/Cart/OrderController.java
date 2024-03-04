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

/**
 *
 * @author quang
 */
@WebServlet(name="OrderController", urlPatterns={"/order"})
public class OrderController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String[] cart_item_ids_s = request.getParameterValues("card_items");
        
        CartItemDAO ciDAO = new CartItemDAO();
        
        for (String cart_item_id_s : cart_item_ids_s){
            int cart_item_id = Integer.parseInt(cart_item_id_s);
            ciDAO.updateStatus(cart_item_id, "buyed");
            //SEND CODE GAME TO EMAIL: (later) 
        }
        
        request.setAttribute("notification-message", "Order success. Key will be sent to your email");
        request.getRequestDispatcher("dashboard").forward(request, response);
        ///DELETE WHEN DONE
        //PrintWriter out = response.getWriter();
        
//        for (String s : request.getParameterValues("card_items")){
//            out.print(s+" ");
//        }
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package Controller;

import database.*;
import model.*;
import Lib.MyLib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

// You shouldnot care about this class, it just be use to test functions
@WebServlet(name = "TestController", urlPatterns = {"/test"})
public class TestController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.sendRedirect("dashboard");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        CategoryDAO categoryDAO = new CategoryDAO();
        GameDAO gameDAO = new GameDAO();
        UserDAO uDAO = new UserDAO();
        CartItemDAO ciDAO = new CartItemDAO();
        OrderItemDAO oiDAO = new OrderItemDAO();
        OrderDAO oDAO = new OrderDAO();
        FeedbackDAO fbDAO = new FeedbackDAO();
        QueryDAO qDAO = new QueryDAO();
        RoleDAO rDAO = new RoleDAO();

        gameDAO.Update(2, new Game(1, "helo", 12, 12, "fuck"));
        out.print(gameDAO.getAll());

        //fbDAO.insert(fb);
        ///out.print(fbDAO.getByGameId(2));
        //Order order1 = oDAO.getById(2);
        //oDAO.insert(order1);
        //oiDAO.insert(new OrderItem(1, 4, 2, 10));
        //out.print(oDAO.getByUserId(1));
//        Game game = gameDAO.getById(4);
//        out.println(game.getDetail());
        //out.println(ciDAO.getByUserIdAndStatus(4, "in_cart"));
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

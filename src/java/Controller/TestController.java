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
        
        ciDAO.insert(new CartItem(1, 3, 4));
        ciDAO.insert(new CartItem(2, 2, 2));
        
        ciDAO.update(new CartItem(1, 3, 9));
        
        out.println(ciDAO.getAll());
        
        out.println(uDAO.getByEmailPassword("qui@gmail.com", "01"));
        
        out.println(request.getSession().getAttribute("current_user"));
        //out.println(Lib.MyLib.hashString("Hello, World!"));
        //out.print(gDAO.getAll().toString().replaceAll("},", "},"+"\n"));
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Game;

import database.GameDAO;
import database.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;


@WebServlet(name="GameDeleteController", urlPatterns={"/game/delete"})
public class DeleteController extends HttpServlet {
    
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
        String game_id_string = request.getParameter("gameid");
        int game_id = Integer.parseInt(game_id_string);
        
        GameDAO gdao = new GameDAO();
        gdao.delete(game_id);
        
        request.setAttribute("notification-message", "Delete success!");
        request.getRequestDispatcher("/admin/game_manage").forward(request, response); 
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

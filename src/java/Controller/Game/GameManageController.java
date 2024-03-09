package Controller.Game;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

@WebServlet(urlPatterns = {"/admin/game_manage"})
public class GameManageController extends HttpServlet {

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
        GameDAO gdao = new GameDAO();
        ArrayList<Game> games = gdao.getAll();

        request.setAttribute("games", games);

        request.getRequestDispatcher("/game_manage.jsp").forward(request, response);
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

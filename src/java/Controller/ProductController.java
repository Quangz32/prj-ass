/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import database.FeedbackDAO;
import database.GameDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Feedback;
import model.Game;

/**
 *
 * @author quang
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product/*"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path_info = request.getPathInfo().substring(1);
        if (path_info != null) {
            int game_id = Integer.parseInt(path_info);

            GameDAO gamedao = new GameDAO();
            Game game_to_show = gamedao.getById(game_id);

            if (game_to_show == null) {
                request.setAttribute("notification-message", "Game not found!");
                request.getRequestDispatcher("/dashboard").forward(request, response);
                //response.sendRedirect("/Ass1/dashboard");
            } else {
                FeedbackDAO fbDAO = new FeedbackDAO();
                ArrayList<Feedback> feedbacks = fbDAO.getByGameId(game_id);

                request.setAttribute("game", game_to_show);
                request.setAttribute("feedbacks", feedbacks);

                //response.getWriter().print(feedbacks);
                request.getRequestDispatcher("/product-details.jsp").forward(request, response);
            }

        }
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

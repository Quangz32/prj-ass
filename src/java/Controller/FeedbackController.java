/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import database.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
public class FeedbackController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("dashboard");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User c_user = (User) request.getSession().getAttribute("current_user");

        //IF NOT LOGIN
        if (c_user == null) {
            response.sendRedirect("login");
            return;
        }

        //IF LOGGED IN
        String feedback_content = request.getParameter("feedback_content");
        String game_id_string = request.getParameter("game_id");
        int game_id = Integer.parseInt(game_id_string);

        Feedback new_feedback = new Feedback(-1, c_user.getId(), game_id, feedback_content);

        FeedbackDAO fbDAO = new FeedbackDAO();
        fbDAO.insert(new_feedback);

        request.getSession().setAttribute("notification-message", "Your feed back has been sent!");
        response.sendRedirect("/Ass1/product/" + game_id);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Auth;

import database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/change_password"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("change_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String old_password = request.getParameter("old_password");
        User c_user = (User) request.getSession().getAttribute("current_user");

        //IF OLD_PASSWORD IS WRONG
        if (!c_user.checkPassword(old_password)) {
            request.setAttribute("message", "Password incorrect!");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }

        //IF OLD_PASSWORD IS TRUE
        String new_password = request.getParameter("new_password");
        UserDAO uDAO = new UserDAO();
        uDAO.updatePassword(c_user.getId(), Lib.MyLib.hashString(new_password));

        request.setAttribute("notification-message", "Update password success!");
        request.getRequestDispatcher("dashboard").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

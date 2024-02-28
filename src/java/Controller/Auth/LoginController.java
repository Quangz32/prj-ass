package Controller.Auth;

import database.UserDAO;
import model.User;
import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //response.getWriter().println("Hellokigub");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO uDAO = new UserDAO();
        User user = uDAO.getByEmailPassword(email, password);

        response.getWriter().println(user);
        if (user == null) {
            request.setAttribute("last_email", email);
            request.setAttribute("last_password", password);

            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("current_user", user);
            request.getRequestDispatcher("dashboard").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "servlet_name: LoginController";
    }

}

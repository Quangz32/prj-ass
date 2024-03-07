package Controller.Auth;

import database.UserDAO;
import model.User;
import java.util.ArrayList;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //create Cookie to save Login info
        Cookie emailCookie = new Cookie("email", email);
        emailCookie.setMaxAge(30 * 60);
        Cookie passwordCookie = new Cookie("password", password);
        passwordCookie.setMaxAge(30 * 60);

        response.addCookie(emailCookie);
        response.addCookie(passwordCookie);

        UserDAO uDAO = new UserDAO();
        User user = uDAO.getByEmailPassword(email, password);

        if (user == null) {
            request.setAttribute("login_failed", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("current_user", user);
            request.getSession().setAttribute("notification-message", "Login success");
            response.sendRedirect("/Ass1/dashboard");
            //request.getRequestDispatcher("dashboard").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "servlet_name: LoginController";
    }

}

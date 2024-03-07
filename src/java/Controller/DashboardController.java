/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author quang
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User c_user = (User) request.getSession().getAttribute("current_user");
        
        if (c_user == null){
            tryToLoginByCookie(request, response);
        }
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    /// HELP FUNCTION
    private void tryToLoginByCookie(HttpServletRequest rq, HttpServletResponse rs) 
            throws ServletException, IOException {
        
        String last_email = null;
        String last_password = null;

        //GET EMAIL AND PASSWORD FROM COOKIE (IF SAVED)
        Cookie[] cookies = rq.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    last_email = cookie.getValue();
                    break;
                }

            }

            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("password")) {
                    last_password = cookie.getValue();
                    break;
                }

            }
        }
        
        //LOGIN
        UserDAO uDAO = new UserDAO();
        User user = uDAO.getByEmailPassword(last_email, last_password);

        if (user == null) {
            rq.setAttribute("login_failed", true);
        } else {
            rq.getSession().setAttribute("current_user", user);
            rq.getSession().setAttribute("notification-message", "Login success");

        }
        
    }

}

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

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String namez = request.getParameter("name").trim();
        String emailz = request.getParameter("email").trim();
        String passwordz = request.getParameter("password").trim();
        passwordz = Lib.MyLib.hashString(passwordz);

        User user = new User(-1, namez, emailz, passwordz);

        UserDAO uDAO = new UserDAO();
        uDAO.insert(user);

        response.sendRedirect("login");
        //request.getRequestDispatcher("/Ass1/login").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "servlet_name: RegisterController";
    }// </editor-fold>

}

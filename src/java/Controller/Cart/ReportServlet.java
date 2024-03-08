package Controller.Cart;

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
import java.util.ArrayList;

import model.*;
import database.*;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author quang
 */
@WebServlet(urlPatterns = {"/admin/report"})
public class ReportServlet extends HttpServlet {

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
        //Get Parameter
        String categorys = request.getParameter("category");
        String times = request.getParameter("time");

        if (categorys == null) {
            categorys = "all";
        }

        if (times == null) {
            times = "all";
        }

        int dayx, categoryx;

        if (categorys.equals("all")) {
            categoryx = -1;
        } else {
            categoryx = Integer.parseInt(categorys);
        }

        if (times.equals("lastweek")) {
            dayx = 7;
        } else if (times.equals("lastmonth")) {
            dayx = 30;
        } else {
            dayx = -1;
        }

        OrderDAO oDAO = new OrderDAO();

        ArrayList<Order> orders = oDAO.getAll();
        request.setAttribute("orders", orders);

        QueryDAO qDAO = new QueryDAO();
        ResultSet rs = qDAO.getReport(dayx, categoryx);

        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> categories = cDAO.getAll();

        request.setAttribute("categories", categories);
        request.setAttribute("rs", rs);

        request.getRequestDispatcher("/admin_report.jsp").forward(request, response);
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

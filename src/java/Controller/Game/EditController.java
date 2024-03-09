/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Game;

import database.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import model.*;

/**
 *
 * @author quang
 */
@WebServlet(name = "GameEditController", urlPatterns = {"/game/edit"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class EditController extends HttpServlet {

    private static final String UPLOAD_DIR = "assets/images/";

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
        Game game_to_edit = gdao.getById(game_id);
        request.setAttribute("game", game_to_edit);

        //request.setAttribute("notification-message", "Delete success!");
        request.getRequestDispatcher("/game_edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Store image
        String fileName = saveUploadedFile(request);

        //Build Game object -> save to database
        String gameIdString = request.getParameter("gameid");
        String gameName = request.getParameter("gameName");
        String listedPriceString = request.getParameter("listedPrice");
        String discountPriceString = request.getParameter("discountPrice");

        int listedPrice = Integer.parseInt(listedPriceString);
        int discountPrice = Integer.parseInt(discountPriceString);
        int gameId = Integer.parseInt(gameIdString);

        GameDAO gamedao = new GameDAO();

        Game new_game_info = new Game(-1, gameName, listedPrice, discountPrice, fileName);
        gamedao.Update(gameId, new_game_info);

        //Add categories inputted
        AddCategories(gameId, request);

        //Add GameDetail
        AddGameDetail(gameId, request);

        request.getSession().setAttribute("notification-message", "Game uploaded");
        response.sendRedirect("/Ass1/shop");
    }

    //===========================================================
    void AddGameDetail(int gameid, HttpServletRequest request) throws IOException, ServletException {
        String introz = request.getParameter("introduction");
        String descriptz = request.getParameter("description");

        GameDAO gDAO = new GameDAO();
        Game game = gDAO.getById(gameid);

        GameDetailDAO gddao = new GameDetailDAO();
        gddao.update(gameid, introz, descriptz);

    }

    void AddCategories(int gameid, HttpServletRequest request) throws IOException, ServletException {
        //DELETE OLD CATEGORY
        Game_CategoryDAO gcdao = new Game_CategoryDAO();
        gcdao.deleteAllCategories(gameid);

        //ADD NEW CATEGORY
        GameDAO gDAO = new GameDAO();
        Game game = gDAO.getById(gameid);

        String[] categories = request.getParameterValues("categories");
        if (categories != null) {
            for (int i = 0; i < categories.length; i++) {
                int category_id = Integer.parseInt(categories[i]);
                game.addCategory(category_id);
            }
        }
    }

    String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part part = request.getPart("image");
        if (part == null || part.getSize() <= 0) {
            return "";
        }

        String fileName = getUniqueFileName(part);
        String filePath = uploadPath + File.separator + fileName;

        part.write(filePath);

        File uploadedFile = new File(filePath);
        if (uploadedFile.exists()) {
            return fileName;
        } else {
            return "";
        }
    }

    String getUniqueFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        String fileExtension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
        String newFileName = System.currentTimeMillis() + fileExtension;
        return newFileName;
    }

}

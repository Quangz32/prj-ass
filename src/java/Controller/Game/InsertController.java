package Controller.Game;

import database.GameDAO;
import database.RoleDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import jakarta.servlet.annotation.MultipartConfig;
import model.Game;
import model.User;

@WebServlet("/admin/game/insert")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class InsertController extends HttpServlet {

    private static final String UPLOAD_DIR = "assets/images/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Store image
        String fileName = saveUploadedFile(request);

        //Build Game object -> save to database
        String gameName = request.getParameter("gameName");
        String listedPriceString = request.getParameter("listedPrice");
        String discountPriceString = request.getParameter("discountPrice");

        //Maybe add some validation in the furture
        int listedPrice = Integer.parseInt(listedPriceString);
        int discountPrice = Integer.parseInt(discountPriceString);

        Game gameToInsert = new Game(-1, gameName, listedPrice, discountPrice, fileName);
        gameToInsert.insertToDatabase();

        //Add categories inputted
        AddCategories(request);

        //Add GameDetail
        AddGameDetail(request);

        request.getRequestDispatcher("/shop").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
        request.getRequestDispatcher("/form_upload_game.jsp").forward(request, response);
    }

    private void AddGameDetail(HttpServletRequest request) throws IOException, ServletException {
        String introz = request.getParameter("introduction");
        String descriptz = request.getParameter("description");

        GameDAO gDAO = new GameDAO();
        Game newest_game = gDAO.getLast();

        newest_game.addDetail(introz, descriptz);
    }

    private void AddCategories(HttpServletRequest request) throws IOException, ServletException {
        GameDAO gDAO = new GameDAO();
        Game newest_game = gDAO.getLast();

        String[] categories = request.getParameterValues("categories");
        if (categories != null) {
            for (int i = 0; i < categories.length; i++) {
                int category_id = Integer.parseInt(categories[i]);
                newest_game.addCategory(category_id);
            }
        }
    }

    private String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part part = request.getPart("image");
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

    private String getUniqueFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        String fileExtension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
        String newFileName = System.currentTimeMillis() + fileExtension;
        return newFileName;
    }

    // Other methods (doGet, getServletInfo, etc.) go here
}

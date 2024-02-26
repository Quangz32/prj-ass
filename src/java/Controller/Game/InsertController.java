
package Controller.Game;

import database.GameDAO;
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
//        if (!fileName.isEmpty()) {
//            response.getWriter().println("Image uploaded successfully. File name: " + fileName);
//        } else {
//            response.getWriter().println("Failed to upload image.");
//        }
        
        //Build Game object -> save to database
        String gameName = request.getParameter("gameName");
        String listedPriceString = request.getParameter("listedPrice");
        String discountPriceString = request.getParameter("discountPrice");
            
            //Maybe add some validation in the furture
        int listedPrice = Integer.parseInt(listedPriceString);
        int discountPrice = Integer.parseInt(discountPriceString);

        Game gameToInsert = new Game(-1, gameName, listedPrice, discountPrice, fileName);
        
        GameDAO gamedao = new GameDAO();
        
        gamedao.insert(gameToInsert);

        request.getRequestDispatcher("/shop").forward(request, response);
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
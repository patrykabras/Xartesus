package com.patal.productmanagement;

import com.patal.dbconnector.DBConnector;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

@WebServlet(name = "AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pathToOut = getServletContext().getRealPath("");
        String pathToWeb = pathToOut.substring(0,pathToOut.indexOf("\\out\\"));

        String name = request.getParameter("name");
        String[] genreIds = request.getParameterValues("genre");
        String graphicsId = request.getParameter("graphics");
        String[] typeIds = request.getParameterValues("type");
        String pegiId = request.getParameter("pegi");
        String producerId = request.getParameter("producer");
        String publisherId = request.getParameter("publisher");
        String releaseDate = request.getParameter("releaseDate");

        Part filePart = request.getPart("blob");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();

        try {
            Image image = ImageIO.read(fileContent);

            BufferedImage bi = this.createResizedCopy(image, 250, 250, true);
            File dir = new File(pathToWeb + "\\web\\img\\");
            File dirOut = new File(pathToOut);
            if(!dir.exists()){
                dir.mkdirs();
            }
            if(!dirOut.exists()){
                dirOut.mkdirs();
            }
            ImageIO.write(bi, "jpg", new File(pathToWeb + "\\web\\img\\"+fileName));
            ImageIO.write(bi, "jpg", new File(pathToOut+"\\img\\"+fileName));

        } catch (IOException e) {
            System.out.println("Error");
        }



        int idOfAddedProduct = DBConnector.setProduct(name,producerId,publisherId,graphicsId,pegiId,releaseDate,fileName);
        if(idOfAddedProduct != -1){
            DBConnector.setGenre_product(idOfAddedProduct,genreIds);
            DBConnector.setType_product(idOfAddedProduct,typeIds);
        }


        try {
            getServletContext().getRequestDispatcher("/ProductManagment").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    BufferedImage createResizedCopy(Image originalImage, int scaledWidth, int scaledHeight, boolean preserveAlpha) {
        int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
        BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
        Graphics2D g = scaledBI.createGraphics();
        if (preserveAlpha) {
            g.setComposite(AlphaComposite.Src);
        }
        g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
        g.dispose();
        return scaledBI;
    }
}

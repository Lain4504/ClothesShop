package com.controller.admin.management.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.repository.ProductRepository;
import com.utils.FileUtil;

@WebServlet(name = "EditProductControl", urlPatterns = {"/editproduct"})
@MultipartConfig
public class EditProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid_raw = request.getParameter("id");
        String pname = request.getParameter("name");
        String pprice_raw = request.getParameter("price");
        String pdescribe = request.getParameter("describe");
        String pquantity_raw = request.getParameter("quantity");
        String pquantityunit = request.getParameter("quantityunit");
        String pdate = request.getParameter("date");
        String pdiscount_raw = request.getParameter("discount");
        String pcategory_raw = request.getParameter("category");
        String psupplier_raw = request.getParameter("supplier");

        double pprice, pdiscount;
        int pid, pquantity, psupplier, pcategory;
        String imagePaths = "";

        try {
            pprice = Double.parseDouble(pprice_raw);
            pdiscount = Double.parseDouble(pdiscount_raw);
            pquantity = Integer.parseInt(pquantity_raw);
            pid = Integer.parseInt(pid_raw);
            psupplier = Integer.parseInt(psupplier_raw);
            pcategory = Integer.parseInt(pcategory_raw);

            // Create the directory if it doesn't exist
           // String savePath = getServletContext().getRealPath("/") + "images/products/";
           String savePath = "E:/ClothesShop/images/products/";
           //Thay thế để xem bug. Tạo thử một cái product bằng dòng getServletContext() trước. 
            //Sau đó tạo một cái product bằng dòng dưới, ko hiển thị ảnh thì vào một file bất kỳ, gõ bậy mấy cái rồi ctrl+s, 
            //sau đó ctrl+z xóa mấy cái gõ bậy rồi ctrl+s lại là nó hiển thị được

            String categoryFolder = getCategoryFolder(pcategory);
            File fileSaveDir = FileUtil.getFolderUpload(savePath, categoryFolder);


            // Process each uploaded file
         // Process each uploaded file
            for (Part part : request.getParts()) {
                if (part.getName().equals("image")) {
                    String fileName = FileUtil.saveFile(part, fileSaveDir.getAbsolutePath());
                    System.out.println(fileName);
                    imagePaths += "E:/ClothesShop/images/products/" + categoryFolder + "/" + fileName + ",";
                    System.out.println(imagePaths);
                }
            }

            // Remove trailing comma if present
            if (imagePaths.endsWith(",")) {
                imagePaths = imagePaths.substring(0, imagePaths.length() - 1);
                System.out.println(imagePaths);
            }

            ProductRepository dao = new ProductRepository();
            dao.editProduct(pname, imagePaths, pprice, pdescribe, pquantity, pquantityunit, pdate, pdiscount, psupplier, pcategory, pid);
            
            request.setAttribute("mess", "Edit successfully!");
            request.getRequestDispatcher("manager").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    private String getCategoryFolder(int categoryID) {
        switch (categoryID) {
            case 1: return "Men";
            case 2: return "Women";
            case 3: return "Kids";
            case 4: return "Unisex";
            case 5: return "Gift";
            default: return "Others";
        }
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
}

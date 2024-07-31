package com.controller.admin.management.product;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.repository.ProductRepository;
import com.utils.FileUtil;

@WebServlet(name = "AddProductControl", urlPatterns = {"/addproduct"})
@MultipartConfig
public class AddProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pname = request.getParameter("name");
        String pprice_raw = request.getParameter("price");
        String pdescribe = request.getParameter("describe");
        String pquantity_raw = request.getParameter("quantity");
        String pquantityunit = request.getParameter("quantityunit");
        String pdate = request.getParameter("date");
        String pdiscount_raw = request.getParameter("discount");
        String psupplier_raw = request.getParameter("supplier");
        String pcategory_raw = request.getParameter("category");
        double pprice, pdiscount;
        int pquantity, psupplier, pcategory;
        StringBuilder imagePaths = new StringBuilder();
        
        try {
            pprice = Double.parseDouble(pprice_raw);
            pdiscount = Double.parseDouble(pdiscount_raw);
            pquantity = Integer.parseInt(pquantity_raw);
            psupplier = Integer.parseInt(psupplier_raw);
            pcategory = Integer.parseInt(pcategory_raw); 
            // Specify the save path
           // String savePath = getServletContext().getRealPath("/") + "images/products/";
            
         String savePath = "E:/ClothesShop/images/products/";
            //Thay thế để xem bug. Tạo thử một cái product bằng dòng getServletContext() trước. 
             //Sau đó tạo một cái product bằng dòng dưới, ko hiển thị ảnh thì vào một file bất kỳ, gõ bậy mấy cái rồi ctrl+s, 
             //sau đó ctrl+z xóa mấy cái gõ bậy rồi ctrl+s lại là nó hiển thị được
            String categoryFolder = getCategoryFolder(pcategory);
            
            File fileSaveDir = FileUtil.getFolderUpload(savePath, categoryFolder);

            // Process each uploaded file
            for (Part part : request.getParts()) {
                if (part.getName().equals("image")) {
                    String fileName = FileUtil.saveFile(part, fileSaveDir.getAbsolutePath());
                    imagePaths.append("images/products/").append(categoryFolder).append("/").append(fileName).append(",");
                }
            }

            // Remove trailing comma if present
            if (imagePaths.length() > 0 && imagePaths.charAt(imagePaths.length() - 1) == ',') {
                imagePaths.setLength(imagePaths.length() - 1);
            }

            ProductRepository dao = new ProductRepository();
            dao.insertProduct(pname, imagePaths.toString(), pprice, pdescribe, pquantity, pquantityunit, pdate, pdiscount, psupplier, pcategory);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("mess", "Product Added!");
        request.getRequestDispatcher("manager").forward(request, response);
    }

    private String getCategoryFolder(int categoryID) {
        switch (categoryID) {
        case 1: return "jackets";
        case 2: return "polo-shirts";
        case 3: return "dress-shirts";
        case 4: return "sweaters";
        case 5: return "t-shirts";
        case 6: return "long-pants";
        case 7: return "jeans";
        case 8: return "short-pants";
        case 9: return "accessories";
        default: return "others";
            
          
        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}


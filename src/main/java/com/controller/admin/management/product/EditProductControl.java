package com.controller.admin.management.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

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

            Collection<Part> fileParts = request.getParts().stream()
                    .filter(part -> "image".equals(part.getName()) && part.getSize() > 0)
                    .collect(Collectors.toList());
            if (fileParts != null && !fileParts.isEmpty()) {
                List<String> fileNames = fileParts.stream()
                    .filter(part -> part.getSize() > 0) // Ensure the file part is not empty
                    .map(FileUtil::saveFile) // Save the file and get the file name //đã bao gồm save??
                    .collect(Collectors.toList());
                // Set filenames saved to Model. Assuming images can be a list of filenames
                imagePaths = String.join(",", fileNames); // Join filenames with comma or any other delimiter
                System.out.println(imagePaths);
            }
            // Remove trailing comma if present
            if (imagePaths.endsWith(",")) {
                imagePaths = imagePaths.substring(0, imagePaths.length() - 1);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
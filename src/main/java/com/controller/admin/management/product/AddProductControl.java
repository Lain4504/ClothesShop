package com.controller.admin.management.product;

import java.io.IOException;
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

@WebServlet(name = "AddProductControl", urlPatterns = {"/addproduct"})
@MultipartConfig
public class AddProductControl extends HttpServlet {
	private static final long serialVersionUID = -331986167361646886L;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pname = request.getParameter("name");
        String ppriceRaw = request.getParameter("price");
        String pdescribe = request.getParameter("describe");
        String pquantityRaw = request.getParameter("quantity");
        String pquantityUnit = request.getParameter("quantityunit");
        String pdate = request.getParameter("date");
        String pdiscountRaw = request.getParameter("discount");
        String psupplierRaw = request.getParameter("supplier");
        String pcategoryRaw = request.getParameter("category");

        double pprice, pdiscount;
        int pquantity, psupplier, pcategory;
        String imagePaths = "";

        try {
            pprice = Double.parseDouble(ppriceRaw);
            pdiscount = Double.parseDouble(pdiscountRaw);
            pquantity = Integer.parseInt(pquantityRaw);
            psupplier = Integer.parseInt(psupplierRaw);
            pcategory = Integer.parseInt(pcategoryRaw);

           
            Collection<Part> fileParts = request.getParts().stream()
                    .filter(part -> "image".equals(part.getName()) && part.getSize() > 0)
                    .collect(Collectors.toList());
            if (fileParts != null && !fileParts.isEmpty()) {
                List<String> fileNames = fileParts.stream()
                    .filter(part -> part.getSize() > 0) // Ensure the file part is not empty
                    .map(FileUtil::saveFile) // Save the file and get the file name // save??
                    .collect(Collectors.toList());
                // Set filenames saved to Model. Assuming images can be a list of filenames
                String.join(",", fileNames); // Join filenames with comma or any other delimiter
                System.out.println(imagePaths);
            }
         

            // Remove trailing comma if present
            if (imagePaths.endsWith(",")) {
                imagePaths = imagePaths.substring(0, imagePaths.length() - 1);
            }

            ProductRepository dao = new ProductRepository();
            dao.insertProduct(pname, imagePaths, pprice, pdescribe, pquantity, pquantityUnit, pdate, pdiscount, psupplier, pcategory);
        } catch (NumberFormatException e) {
            System.out.println(e);
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

package com.controller.admin.management.supplier;

import com.model.Category;
import com.model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Supplier;
import com.repository.CategoryRepository;
import com.repository.ProductRepository;
import com.repository.SupplierRepository;

@WebServlet(name = "UpdateSupplierControl", urlPatterns = {"/updatesupplier"})
public class UpdateSupplierControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id_raw = request.getParameter("sid");
        ProductRepository daoP = new ProductRepository();
        SupplierRepository daoS = new SupplierRepository();
        CategoryRepository daoC = new CategoryRepository();
        int id = Integer.parseInt(id_raw);
        Supplier s = daoS.getSupplierById(id);
        List<Category> listC = daoC.getAll();
        List<Supplier> listS = daoS.getAll();


        request.setAttribute("detail", s);
        request.setAttribute("listSup", listS);
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("dashboard/updatesupplier.jsp").forward(request, response);
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

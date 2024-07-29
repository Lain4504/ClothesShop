package com.controller.admin.management.supplier;

import com.dal.CategoryDAO;
import com.dal.SupplierDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.Category;
import com.model.Supplier;

@WebServlet(name = "EditSupplierControl", urlPatterns = {"/editsupplier"})
public class EditSupplierControl extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sid_raw = request.getParameter("id");
        String companyName = request.getParameter("companyName");
        String contactName = request.getParameter("contactName");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        String homepage = request.getParameter("homepage");
        
        SupplierDAO daoS = new SupplierDAO();
        CategoryDAO daoC = new CategoryDAO();
        int id = Integer.parseInt(sid_raw);
        daoS.editSupplier(id, companyName, contactName, country, phone, homepage);
        List<Supplier> listAllSupplier = daoS.getAll();
        List<Category> listAllCategory = daoC.getAll();
        request.setAttribute("mess", "Edit successfully!");
        request.setAttribute("listAllSupplier", listAllSupplier);
        request.setAttribute("listAllCategory", listAllCategory);
        request.getRequestDispatcher("dashboard/supplier.jsp").forward(request, response);
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
    }// </editor-fold>

}

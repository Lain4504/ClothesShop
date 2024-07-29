package com.controller.admin.management.supplier;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Supplier;
import com.repository.CategoryRepository;
import com.repository.SupplierRepository;

@WebServlet(name = "AddSupplierControl", urlPatterns = {"/addsupplier"})
public class AddSupplierControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SupplierRepository sd = new SupplierRepository();

        String CompanyName = request.getParameter("CompanyName");
        String ContactName = request.getParameter("ContactName");
        String Country = request.getParameter("Country");
        String Phone = request.getParameter("Phone");
        String HomePage = request.getParameter("HomePage");
        Supplier supplier = new Supplier(0, CompanyName, ContactName, Country, Phone, HomePage);
        String msg = "";
        sd.insert(supplier);
        msg = "Supplier " + supplier.getCompanyName() + " add successfully!";
        request.setAttribute("mess", msg);
        response.sendRedirect("managersupplier");
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

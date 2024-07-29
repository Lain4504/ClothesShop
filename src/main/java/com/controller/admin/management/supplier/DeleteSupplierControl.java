package com.controller.admin.management.supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.repository.SupplierRepository;

@WebServlet(name = "DeleteSupplier", urlPatterns = {"/deletesupplier"})
public class DeleteSupplierControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String idSupplier_raw = request.getParameter("sid");
        SupplierRepository dao = new SupplierRepository();
        String msg = "";
        int idSup;
        try {
            idSup = Integer.parseInt(idSupplier_raw);
            dao.deleteSupplier(idSup);
            msg = "Supplier " + idSup + " deleted successfully";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("managersupplier").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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


}

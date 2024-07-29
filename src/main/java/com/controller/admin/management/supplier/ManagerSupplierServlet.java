package com.controller.admin.management.supplier;

import com.dal.SupplierDAO;
import com.dal.CategoryDAO;
import com.model.Category;
import com.model.Supplier;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ManagerSupplierServlet", urlPatterns = {"/managersupplier"})
public class ManagerSupplierServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SupplierDAO daoS = new SupplierDAO();
        CategoryDAO daoC = new CategoryDAO();

        List<Supplier> listAllSupplier = daoS.getAll();

        request.setAttribute("listAllSupplier", listAllSupplier);

        request.getRequestDispatcher("dashboard/supplier.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("valueSearch");
        SupplierDAO daoS = new SupplierDAO();
        CategoryDAO daoC = new CategoryDAO();

        List<Supplier> listAllSupplier = daoS.getSuppliersBySearch(txtSearch);
        List<Category> listAllCategory = daoC.getAll();

        request.setAttribute("listAllSupplier", listAllSupplier);
        request.setAttribute("listAllCategory", listAllCategory);
        request.setAttribute("searchValue", txtSearch);
        request.getRequestDispatcher("dashboard/supplier.jsp").forward(request, response);
    }

   
}

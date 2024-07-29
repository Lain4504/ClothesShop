
package com.controller.admin.management.supplier;

import com.dal.CategoryDAO;
import com.dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.Category;
import com.model.Supplier;

@WebServlet(name="ManageSearchSupplierServlet", urlPatterns={"/searchSupplier"})
public class ManageSearchSupplierServlet extends HttpServlet {
   
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageSearchSupplierServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageSearchSupplierServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        SupplierDAO daoS = new SupplierDAO();
        CategoryDAO daoC = new CategoryDAO();

        List<Supplier> listAllSupplier = daoS.getSuppliersBySearch(txtSearch);
        List<Category> listAllCategory = daoC.getAll();

        request.setAttribute("listAllSupplier", listAllSupplier);
        request.setAttribute("listAllCategory", listAllCategory);
        request.setAttribute("searchValue", txtSearch);
        request.getRequestDispatcher("ajax/search_supplier_ajax.jsp").forward(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    

}

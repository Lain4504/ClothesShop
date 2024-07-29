package com.controller.admin.management.product;

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

@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerProductServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProductRepository daoP = new ProductRepository();
        CategoryRepository daoC = new CategoryRepository();
        SupplierRepository daoS = new SupplierRepository();
        List<Product> list = daoP.getAll();
        List<Category> listC = daoC.getAll();

        int page = 1, numPerPage = 6;
        int size = list.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);

        List<Product> listByPage = daoP.getListByPage(list, start, end);
        List<Supplier> listSup = daoS.getAll();
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        request.setAttribute("listCC", listC);
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("list", listSup);

        request.getRequestDispatcher("dashboard/mnproduct.jsp").forward(request, response);
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("valueSearch");
        ProductRepository daoP = new ProductRepository();
        CategoryRepository daoC = new CategoryRepository();
        SupplierRepository daoS = new SupplierRepository();
        List<Product> list = daoP.searchByName(txtSearch);
        List<Category> listC = daoC.getAll();

        int page = 1, numPerPage = 6;
        int size = list.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);

        List<Product> listByPage = daoP.getListByPage(list, start, end);
        List<Supplier> listSup = daoS.getAll();
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        request.setAttribute("listCC", listC);
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("list", listSup);
        request.setAttribute("searchValue", txtSearch);
        request.getRequestDispatcher("dashboard/mnproduct.jsp").forward(request, response);
    }

   

}

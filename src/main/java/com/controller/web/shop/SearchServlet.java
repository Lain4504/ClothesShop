
package com.controller.web.shop;

import com.dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.Category;
import com.model.Product;


@WebServlet(name="SearchServlet", urlPatterns={"/search"})
public class SearchServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        String home_raw = request.getParameter("home");
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.searchByName(txtSearch);
        int home;
        if(home_raw != null) {
            home = Integer.parseInt(home_raw);
        } else {
            home = 0;
        }
        request.setAttribute("productPage", list);
        request.setAttribute("txtS", txtSearch);
        request.setAttribute("col", 3);
        request.setAttribute("home", home);
        request.getRequestDispatcher("ajax/search_ajax.jsp").forward(request, response);
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

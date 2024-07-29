package com.controller.admin.statistic;

import com.model.Product;
import com.repository.ProductRepository;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Top10SellerProduct", urlPatterns = {"/top10"})
public class Top10SellerProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ProductRepository dao = new ProductRepository();
        List<Product> list = dao.getTop10SellerProduct();
        int listTop10Product = list.size();
        
        request.setAttribute("list", list);
        request.setAttribute("listTop10Product", listTop10Product);

        request.getRequestDispatcher("dashboard/top10.jsp").forward(request, response);
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

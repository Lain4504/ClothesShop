package com.controller.web.shop;

import com.dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Product;

@WebServlet(name = "LoadPagingServlet", urlPatterns = {"/load"})
public class LoadPagingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //tam thoi load ra 9 san pham truoc 
        String amount = request.getParameter("exits");
        int iamount = Integer.parseInt(amount);
        ProductDAO p = new ProductDAO();
        List<Product> list = p.getNext9Product(iamount);
        request.setAttribute("productPage", list);
        request.setAttribute("col", 4);
        request.getRequestDispatcher("ajax/search_ajax.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }



}

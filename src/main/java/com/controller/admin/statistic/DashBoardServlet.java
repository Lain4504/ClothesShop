package com.controller.admin.statistic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.repository.OrderRepository;
import com.repository.ProductRepository;
import com.repository.SupplierRepository;
import com.repository.UserRepository;

@WebServlet(name = "DashBoardServlet", urlPatterns = {"/admin"})
public class DashBoardServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        ProductRepository dao = new ProductRepository();
        UserRepository udao = new UserRepository();
        OrderRepository odao = new OrderRepository();
       SupplierRepository sdao = new SupplierRepository();
        int count = dao.countAllProduct();
        int countS = dao.countAllTypeProduct();
        int countu = udao.countAllUser();
        int countSupplier = sdao.countAllSupplier();
        int sumquantitySold = dao.getSumQuantitySold();
        double totalmoneyAll = odao.sumAllMoneyOrder();
        request.setAttribute("countProduct", count);
        request.setAttribute("countSupplier", countSupplier);
        request.setAttribute("countTypeProduct", countS);
        request.setAttribute("sumquantitySold", sumquantitySold);
        request.setAttribute("countUser", countu);
        request.setAttribute("totalmoneyAll", totalmoneyAll);
        request.getRequestDispatcher("dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

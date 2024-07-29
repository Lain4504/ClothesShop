package com.controller.admin.management.wallet;

import com.dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddBalanceServlet", urlPatterns = {"/addbalance"})
public class AddBalanceServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String balance_raw = request.getParameter("balance");
        String userName = request.getParameter("userName");
        WalletDAO dao = new WalletDAO();
        double balance;
        try {
            balance = Double.parseDouble(balance_raw);
            dao.inputMoney(userName, balance);
        } catch (Exception e) {
        }
        response.sendRedirect("walletmanager");
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

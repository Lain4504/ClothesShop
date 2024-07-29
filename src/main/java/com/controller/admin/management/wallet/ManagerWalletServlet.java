package com.controller.admin.management.wallet;

import com.dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.Wallet;

@WebServlet(name = "ManagerWalletServlet", urlPatterns = {"/walletmanager"})
public class ManagerWalletServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WalletDAO wdao = new WalletDAO();
        List<Wallet> list = wdao.getAll();
        request.setAttribute("listWallet", list);
        request.getRequestDispatcher("dashboard/mngwallet.jsp").forward(request, response);
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

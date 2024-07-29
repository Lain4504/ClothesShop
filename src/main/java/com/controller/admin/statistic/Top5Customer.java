package com.controller.admin.statistic;

import com.dal.UserDAO;
import com.model.User;
import com.model.Order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.Spending;


@WebServlet(name = "Top5KhachHangControl", urlPatterns = {"/top5khachhang"})
public class Top5Customer extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        UserDAO dao = new UserDAO();

        List<User> listAllAccount = dao.getAllUsers();
        List<Spending> listTop5CustomerSpending = dao.getTop5Customers();


        request.setAttribute("listAllAccount", listAllAccount);
        request.setAttribute("listTop5Spending", listTop5CustomerSpending);
//        request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
        request.getRequestDispatcher("dashboard/top5customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}

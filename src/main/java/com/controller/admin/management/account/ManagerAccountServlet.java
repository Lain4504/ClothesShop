package com.controller.admin.management.account;

import com.model.User;
import com.repository.UserRepository;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ManagerAccountControl", urlPatterns = {"/managerAccount"})
public class ManagerAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("valueSearch");
        UserRepository dao = new UserRepository();

        List<User> list = dao.getUsersBySearchName(txtSearch);

        request.setAttribute("listUser", list);

        request.getRequestDispatcher("dashboard/mngaccount.jsp").forward(request, response);

    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User a = (User) session.getAttribute("account");
        String userName = a.getUserName();
        UserRepository dao = new UserRepository();

        List<User> list = dao.getAllUsers();

        request.setAttribute("listUser", list);
        request.getRequestDispatcher("dashboard/mngaccount.jsp").forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("valueSearch");
        UserRepository dao = new UserRepository();

        List<User> list = dao.getUsersBySearchName(txtSearch);

        request.setAttribute("listUser", list);
        request.setAttribute("searchValue", txtSearch);
        request.getRequestDispatcher("dashboard/mngaccount.jsp").forward(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

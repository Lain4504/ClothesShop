package com.controller.admin.management.account;

import com.dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.User;

@WebServlet(name = "DeleteAccountControl", urlPatterns = {"/deleteaccount"})
public class DeleteAccountControl extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        User userss = (User) session.getAttribute("account");
        String at = request.getParameter("at");
        UserDAO dao = new UserDAO();
        String msg = "";
        if (username != null) {
            dao.deleteUser(username);
            msg = "Delete username " + username + " successfully!";
        } else {
            msg = "Delete failed!";
        }
        request.setAttribute("mess", msg);
        if (username.equals(userss.getUserName())) {
            session.removeAttribute("account");
            request.getRequestDispatcher("home").forward(request, response);
        }
        request.getRequestDispatcher("managerAccount").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   

}

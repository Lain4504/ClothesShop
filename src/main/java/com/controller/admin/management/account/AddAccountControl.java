package com.controller.admin.management.account;

import com.model.User;
import com.repository.UserRepository;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddAccountControl", urlPatterns = {"/addaccount"})
public class AddAccountControl extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String FullName = request.getParameter("name");
        String UserName = request.getParameter("user");
        String Password = request.getParameter("pass");
        String roleId_raw = request.getParameter("roleId");
        String Email = request.getParameter("email");
        String Phone = request.getParameter("phone");
        String BirthDay = request.getParameter("birthdate");
        int roleId = (roleId_raw == null ? 2 : Integer.parseInt(roleId_raw));
        String msg = "";
        UserRepository dao = new UserRepository();
        boolean check = dao.checkUserNameDuplicate(UserName);
        if (check) {
            msg = "Username already exist!";
            request.setAttribute("error", msg);
        } else {
            dao.insertUser(UserName, FullName, Password, roleId, Email, BirthDay, Phone);
            msg = "Username " + UserName + " add successfully!";
            request.setAttribute("mess", msg);
        }
        request.getRequestDispatcher("managerAccount").forward(request, response);
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

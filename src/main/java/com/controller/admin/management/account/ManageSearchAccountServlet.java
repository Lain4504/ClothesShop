
package com.controller.admin.management.account;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.User;
import com.repository.UserRepository;

@WebServlet(name="ManageSearchAccount", urlPatterns={"/searchAccount"})
public class ManageSearchAccountServlet extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageSearchAccount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageSearchAccount at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        UserRepository dao = new UserRepository();

        List<User> list = dao.getUsersBySearchName(txtSearch);

        request.setAttribute("listUser", list);
        request.setAttribute("searchValue", txtSearch);
        request.getRequestDispatcher("ajax/search_account_ajax.jsp").forward(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


}

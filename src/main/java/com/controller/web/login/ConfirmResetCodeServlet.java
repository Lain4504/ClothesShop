package com.controller.web.login;

import com.dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ConfirmResetCodeServlet", urlPatterns = {"/confirmresetcode"})
public class ConfirmResetCodeServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmResetCodeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmResetCodeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO ud = new UserDAO();
        String resetCode = request.getParameter("resetcode");
        String code = (String) session.getAttribute("code");
        String email = request.getParameter("email");
        String message = (String) request.getAttribute("message");
        String check = (String) request.getAttribute("check");
        if (code.equalsIgnoreCase(resetCode)) {
            check = "true";
            String userName = ud.getUserNameByEmail(email);

            request.removeAttribute("code");
            request.setAttribute("uName", userName);
            request.setAttribute("check", check);
            request.getRequestDispatcher("newpassword.jsp").forward(request, response);
        } else {
            check = "true";
            message = "Sorry, reset code incorrect";
            session.setAttribute("code", code);
            request.setAttribute("email", email);
            request.setAttribute("check", check);
            request.setAttribute("message", message);
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
        }
    }

    

}

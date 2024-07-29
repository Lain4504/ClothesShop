package com.controller.web.shop;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.model.Category;
import com.model.Email;
import com.repository.CategoryRepository;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryRepository d = new CategoryRepository();
        List<Category> categories = d.getAll();
        request.setAttribute("category", categories);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String cmt = request.getParameter("cmt");
        Email handleEmail = new Email();
        String message = "";
        String check = "";

        if (handleEmail.isValidEmail(email)) {
            message = "Cảm ơn bạn là liên hệ với chúng tôi, chúng tôi sẽ kết nối với bạn trong thời gian sớm nhất";
            check = "success";
            String subject = handleEmail.subjectContact(name);
            String msg = handleEmail.messageContact(name);
            handleEmail.sendEmail(subject, msg, email);
        } else {
            message = "Có vẻ như một số thông tin cung cấp của bạn không hợp lệ, vui lòng cung cấp lại thông tin";
            check = "fail";
        }

        request.setAttribute("message", message);
        request.setAttribute("check", check);
        request.setAttribute("fullName", name);
        request.setAttribute("email", email);
        request.setAttribute("comment", cmt);
        request.getRequestDispatcher("ajax/contact_ajax.jsp").forward(request, response);
    }

}

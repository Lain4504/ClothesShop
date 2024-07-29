package com.controller.web.cart_wishlist;

import com.dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.model.Cart;
import com.model.Item;
import com.model.Product;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        // Phan cart
        Cart cart = null;
        Object o = session.getAttribute("cart");
        // Check
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        ProductDAO pd = new ProductDAO();

        String role = request.getParameter("role");
        switch (role) {
            case "add": {
                String tnum = request.getParameter("quantity");
                String tid = request.getParameter("id");
                int num, id;
                try {
                    num = Integer.parseInt(tnum);
                    id = Integer.parseInt(tid);
                    Product p = pd.getProductByID(id);
                    Item t = new Item(p, num);
                    cart.addItem(t);
                } catch (Exception e) {
                }
                List<Item> list = cart.getListItems();
                session.setAttribute("cart", cart);
                session.setAttribute("listItemsInCart", list);
                session.setAttribute("cartSize", list.size());
                request.getRequestDispatcher("ajax/header_right_ajax.jsp").forward(request, response);
                break;
            }
            case "remove": {
                String tRid = request.getParameter("rid");
                int rid;
                try {
                    rid = Integer.parseInt(tRid);
                    cart.removeItem(rid);
                } catch (Exception e) {
                }
                List<Item> list = cart.getListItems();
                session.setAttribute("cart", cart);
                session.setAttribute("listItemsInCart", list);
                session.setAttribute("cartSize", list.size());
                request.getRequestDispatcher("ajax/header_right_ajax.jsp").forward(request, response);
                break;
            }
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}

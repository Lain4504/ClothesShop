package com.controller.admin.management.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.model.Cart;
import com.model.Item;
import com.repository.ProductRepository;

@WebServlet(name = "DeleteProductControl", urlPatterns = {"/deleteproduct"})
public class DeleteProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        // Check
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String pid = request.getParameter("pid");
        ProductRepository dao = new ProductRepository();
        int id = Integer.parseInt(pid);
        String msg = "";
//        dao.deleteCartByProductID(pid);
        dao.deleteProduct(id);
        cart.removeItem(id);
        List<Item> list = cart.getListItems();
        session.setAttribute("cart", cart);
        session.setAttribute("listItemsInCart", list);
        session.setAttribute("cartSize", list.size());
        msg = "Product " + pid + " deleted successfully";
        request.setAttribute("mess", msg);
        request.getRequestDispatcher("manager").forward(request, response);
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

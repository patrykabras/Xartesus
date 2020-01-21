package com.patal.store;

import com.patal.utils.ErrorMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ErrorMessage> errorMessageList = new ArrayList<>();
        String warehosueItemID = request.getParameter("warehosueItemID");
        HashMap<String, ShoppingCartItem> shoppingCart = new HashMap<String, ShoppingCartItem>();
        if (session.getAttribute("shopingCart") != null) {
            shoppingCart = (HashMap<String, ShoppingCartItem>) session.getAttribute("shopingCart");
            shoppingCart.remove(warehosueItemID);
            session.setAttribute("shopingCart", shoppingCart);
            session.setMaxInactiveInterval(30 * 60);
            double shopingCartPrice = 0;
            for (Map.Entry<String, ShoppingCartItem> entry : shoppingCart.entrySet()) {
                shopingCartPrice += entry.getValue().getPrice();
            }
            session.setAttribute("shopingCartPrice", shopingCartPrice);
        }

        errorMessageList.add(new ErrorMessage("bg-warning","Cart update","RemoveFromCart","Item was removed from shopping cart"));
        session.setAttribute("errorMessageList",errorMessageList);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }
}

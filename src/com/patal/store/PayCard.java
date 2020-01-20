package com.patal.store;

import com.patal.dbconnector.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "PayCard")
public class PayCard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String user = (String) session.getAttribute("user");

        HashMap<String,ShoppingCartItem> shoppingCart = new HashMap<String, ShoppingCartItem>();
        if(session.getAttribute("shopingCart") != null){
            shoppingCart = (HashMap<String, ShoppingCartItem>) session.getAttribute("shopingCart");
            session.setAttribute("shopingCart",shoppingCart);
        }else{
            session.setAttribute("shopingCart",shoppingCart);
        }

        for (Map.Entry<String, ShoppingCartItem> entry : shoppingCart.entrySet()) {
            DBConnector.BuyProduct(id,user,entry.getValue().getWarehouseId());
        }

        session.removeAttribute("shopingCart");
        response.sendRedirect(request.getContextPath());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

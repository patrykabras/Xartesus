package com.patal.store;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.Product;
import com.patal.utils.ErrorMessage;
import com.patal.warehousemanagment.WarehouseItem;

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

@WebServlet(name = "AddToCart")
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ErrorMessage> errorMessageList = new ArrayList<>();
        String warehouseID = request.getParameter("warehouseID");
        WarehouseItem currentItem = DBConnector.getWarehouse().searchByID(warehouseID).get(0);
        Product product = currentItem.getProduct();
        String productName = product.getName();
        String picture = product.getPicture();
        double price = currentItem.getPrice();
        double shopingCartPrice = 0;

        ShoppingCartItem shoppingCartItem = new ShoppingCartItem(warehouseID,productName,picture,price);
        HashMap<String,ShoppingCartItem> shoppingCart = new HashMap<String, ShoppingCartItem>();
        if(session.getAttribute("shopingCart") != null){
            shoppingCart = (HashMap<String, ShoppingCartItem>) session.getAttribute("shopingCart");
            shoppingCart.put(warehouseID,shoppingCartItem);
            session.setAttribute("shopingCart",shoppingCart);
        }else{
            shoppingCart.put(warehouseID,shoppingCartItem);
            session.setAttribute("shopingCart",shoppingCart);
        }

        for (Map.Entry<String, ShoppingCartItem> entry : shoppingCart.entrySet()) {
            shopingCartPrice += entry.getValue().getPrice();
        }

        errorMessageList.add(new ErrorMessage("bg-success","Cart update","AddToCart","Item was added to shopping cart"));
        session.setAttribute("errorMessageList",errorMessageList);

        session.setAttribute("shopingCartPrice",shopingCartPrice);
        session.setMaxInactiveInterval(30*60);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

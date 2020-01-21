package com.patal.store;

import com.patal.dbconnector.DBConnector;
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

@WebServlet(name = "PayCard")
public class PayCard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ErrorMessage> errorMessageList = new ArrayList<>();
        String id = (String) session.getAttribute("id");
        String user = (String) session.getAttribute("user");

        HashMap<String, ShoppingCartItem> shoppingCart = new HashMap<String, ShoppingCartItem>();
        if (session.getAttribute("shopingCart") != null) {
            shoppingCart = (HashMap<String, ShoppingCartItem>) session.getAttribute("shopingCart");
            session.setAttribute("shopingCart", shoppingCart);
        } else {
            session.setAttribute("shopingCart", shoppingCart);
        }

        for (Map.Entry<String, ShoppingCartItem> entry : shoppingCart.entrySet()) {
            if (!DBConnector.getWarehouse().searchByID(entry.getValue().getWarehouseId()).get(0).isIs_sold()) {
                DBConnector.BuyProduct(id, user, entry.getValue().getWarehouseId());
                errorMessageList.add(new ErrorMessage("bg-success","Success to buy","payCard", entry.getValue().getProductName() +" was added to your Library"));
            }else {
                errorMessageList.add(new ErrorMessage("bg-danger","Failed to buy","payCard", entry.getValue().getProductName() +" missing, you couldn't buy it ,but we didn't take your money for that. We are sorry for problems."));
            }
        }

        session.setAttribute("errorMessageList",errorMessageList);
        session.removeAttribute("shopingCart");
        response.sendRedirect(request.getContextPath());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

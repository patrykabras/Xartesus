package com.patal.warehousemanagment;

import com.patal.dbconnector.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddProductToWarehouse")
public class AddProductToWarehouse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_product = request.getParameter("id_product");
        String price = request.getParameter("price");
        String key_purchased = request.getParameter("key_purchased");
        String is_sold = request.getParameter("is_sold");

        DBConnector.setProductToWarehouse(id_product,price,key_purchased,is_sold);

        try {
            getServletContext().getRequestDispatcher("/ProductManagment").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package com.patal.productInfo;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.Product;
import com.patal.logicdbstruct.ProductList;
import com.patal.warehousemanagment.WarehouseItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductInfo")
public class ProductInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/productInfo.jsp";
        String id = request.getParameter("warehouseID");
        WarehouseItem warehouseItem = DBConnector.getWarehouse().searchByID(id).get(0);

        request.setAttribute("warehouseItem", warehouseItem);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}

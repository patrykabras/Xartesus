package com.patal.productInfo;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.Product;
import com.patal.logicdbstruct.ProductList;
import com.patal.warehousemanagment.WarehouseItem;
import com.patal.warehousemanagment.WarehouseProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductInfo")
public class ProductInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/productInfo.jsp";
        String id = request.getParameter("productID");
        ArrayList<WarehouseProduct> warehouseProducts = DBConnector.getWarehouse().getWarehouseProducts(id);
        Product product = DBConnector.getProducts().searchByID(id).get(0);

        request.setAttribute("warehouseProducts", warehouseProducts);
        request.setAttribute("product", product);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}

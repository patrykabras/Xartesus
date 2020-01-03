package com.patal.index;

import com.patal.dbconnector.DBConnector;
import com.patal.warehousemanagment.Warehouse;
import com.patal.warehousemanagment.WarehouseItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet(name = "IndexServlet")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Warehouse warehouseList = DBConnector.getWarehouse();
        ArrayList<WarehouseItem> temp = warehouseList.getRandomItems(6);
        warehouseList.setWarehouseItemsList(temp);
        request.setAttribute("warehouseList", warehouseList);
        String url = "/index.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

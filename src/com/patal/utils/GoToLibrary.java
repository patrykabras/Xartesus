package com.patal.utils;

import com.patal.dbconnector.DBConnector;
import com.patal.warehousemanagment.WarehouseItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "GoToLibrary")
public class GoToLibrary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");
        String userName = (String) session.getAttribute("user");
        HashMap<String, WarehouseItem> userProducts = DBConnector.getUserProducts(userId, userName);

        request.setAttribute("userProducts", userProducts);
        String url = "/Library.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}

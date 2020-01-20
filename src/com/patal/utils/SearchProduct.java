package com.patal.utils;

import com.patal.dbconnector.DBConnector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProduct")
public class SearchProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urlNotFound = "/ProductNotFound.jsp";
        String searchProductName = (String) request.getParameter("searchProductName");
        List productList =  DBConnector.getProducts().searchByName(searchProductName);
        if(productList.size() == 0){
            getServletContext().getRequestDispatcher(urlNotFound).forward(request, response);
        }else{
            String searchProductID = DBConnector.getProducts().searchByName(searchProductName).get(0).getIdProduct() + "";
            request.setAttribute("searchProductID",searchProductID);
            RequestDispatcher rd = request.getRequestDispatcher("ProductInfo");
            rd.forward(request,response);
        }
    }
}

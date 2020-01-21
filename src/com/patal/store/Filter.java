package com.patal.store;

import com.patal.dbconnector.DBConnector;
import com.patal.logicdbstruct.ProductList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Filter")
public class Filter extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String priceFrom = request.getParameter("priceFrom");
        String priceTo = request.getParameter("priceTo");
        String[] types = request.getParameterValues("type");
        String[] genres = request.getParameterValues("genre");
        String[] graphics = request.getParameterValues("graphics");
        String[] pegis = request.getParameterValues("pegi");
        String[] producers = request.getParameterValues("producer");
        String[] publishers = request.getParameterValues("publisher");

        ProductList productList =  DBConnector.getFilter(types,genres,graphics,pegis,producers,publishers);

        request.setAttribute("productListFilter",productList);
        RequestDispatcher rd = request.getRequestDispatcher("Store");
        rd.forward(request,response);
    }
}

package com.patal.profile;

import com.patal.dbconnector.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Polling")
public class Polling extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] genreIds = request.getParameterValues("genre");
        String[] graphicsIds = request.getParameterValues("graphics");
        String[] typeIds = request.getParameterValues("type");
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        System.out.println("User ID: " + session.getAttribute("id"));
        System.out.println("Genre:" +genreIds);
        for (String id: genreIds){
            System.out.println(id);
        }
        DBConnector.setPolling(idUser,genreIds,graphicsIds,typeIds);
        response.sendRedirect(request.getContextPath() + "");

    }
}

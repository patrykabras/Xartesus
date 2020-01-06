package com.patal.profile;

import com.patal.dbconnector.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "Profile")
public class Profile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashMap<Integer, String> genre = DBConnector.getGenre();
        HashMap<Integer, String> graphics = DBConnector.getGraphics();
        HashMap<Integer, String> pegi = DBConnector.getPegi();
        HashMap<Integer, String> producer = DBConnector.getProducer();
        HashMap<Integer, String> publisher = DBConnector.getPublisher();
        HashMap<Integer, String> type = DBConnector.getType();

        request.setAttribute("genre", genre);
        request.setAttribute("graphics", graphics);
        request.setAttribute("pegi", pegi);
        request.setAttribute("producer", producer);
        request.setAttribute("publisher", publisher);
        request.setAttribute("type", type);


        String url = "/profile.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}

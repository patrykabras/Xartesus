package com.patal;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.User;
import com.patal.logicdbstruct.UsersList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogIn")
public class LogIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsersList temp = DBConnector.getUsers();
        System.out.println(temp.searchByUsername("asdas"));
        String url = "/Hello.jsp";
        String userName = request.getParameter("name");
        request.setAttribute("userName", userName);
        try {
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}


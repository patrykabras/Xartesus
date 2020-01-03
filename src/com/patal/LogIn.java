package com.patal;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogIn")
public class LogIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/Hello.jsp";
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        boolean isValid = DBConnector.validateUser(userName,password);
        if(isValid){
            User userNow = DBConnector.getSingleUser(userName,password);
            HttpSession session = request.getSession();
            System.out.println(userNow);
            session.setAttribute("user",userName);
            session.setAttribute("role",userNow.getUsertype()+"");
            session.setMaxInactiveInterval(30*60);

            Cookie loginCookie = new Cookie("user",userName);
            Cookie roleCookie = new Cookie("role",userNow.getUsertype()+"");

            loginCookie.setMaxAge(30*60);
            roleCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            response.addCookie(roleCookie);
        }
        response.sendRedirect(request.getContextPath());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}


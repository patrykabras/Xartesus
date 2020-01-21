package com.patal.utils;

import com.patal.dbconnector.DBConnector;
import com.patal.dbstruct.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LogIn")
public class LogIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ErrorMessage> errorMessageList = new ArrayList<>();
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        boolean isValid = DBConnector.validateUser(userName,password);

        if(isValid){
            User userNow = DBConnector.getSingleUser(userName,password);
            session.setAttribute("user",userName);
            session.setAttribute("role",userNow.getUsertype()+"");
            session.setAttribute("id",userNow.getIdUser()+"");
            session.setMaxInactiveInterval(30*60);

            Cookie loginCookie = new Cookie("user",userName);
            Cookie roleCookie = new Cookie("role",userNow.getUsertype()+"");
            Cookie idCookie = new Cookie("id",userNow.getIdUser()+"");

            loginCookie.setMaxAge(30*60);
            roleCookie.setMaxAge(30*60);
            idCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            response.addCookie(roleCookie);
            response.addCookie(idCookie);
        }else{
            errorMessageList.add(new ErrorMessage("bg-danger","Failed to login","login","wrong username or password"));
        }
        session.setAttribute("errorMessageList",errorMessageList);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}


package com.patal.register;

import com.patal.dbconnector.DBConnector;
import com.patal.utils.ErrorMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegisterForm")
public class RegisterForm extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ErrorMessage> errorMessageList = new ArrayList<>();
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String login = request.getParameter("login");
        String birth_date = request.getParameter("birth_date");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(!DBConnector.isUserExists(login) && (login != "" || login != null && (password != "" || password != null))){
            errorMessageList.add(new ErrorMessage("bg-success","Success to create account","register","congratulation now you have your own account"));
            session.setAttribute("errorMessageList",errorMessageList);
            DBConnector.setUser(name,surname,login,birth_date,email,password);
        }else{
            errorMessageList.add(new ErrorMessage("bg-warning","Failed to create account","register","this login is taken"));
            session.setAttribute("errorMessageList",errorMessageList);

        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

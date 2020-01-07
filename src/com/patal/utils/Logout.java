package com.patal.utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Logout")
public class Logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Cookie loginCookie = null;
        Cookie roleCookie = null;
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("role");
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")){
                    loginCookie = cookie;
                    break;
                }
                if(cookie.getName().equals("role")){
                    roleCookie = cookie;
                    break;
                }
            }
        }
        if(loginCookie != null){
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }
        if(roleCookie != null){
            roleCookie.setMaxAge(0);
            response.addCookie(roleCookie);
        }
        response.sendRedirect(request.getContextPath() + "/index");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

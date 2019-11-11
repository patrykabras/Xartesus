package com.patal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LogIn")
public class LogIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        dbTest();
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

    private void dbTest() {
        try {


            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
//here sonoo is the database name, root is the username and root is the password
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select * from usertest");

//            System.out.println(rs.getString("fName"));
            while (rs.next())
                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

            con.close();
        } catch (SQLException  e) {
            e.printStackTrace();


        }

    }
}

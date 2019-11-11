package com.patal.dbconnector;

import com.patal.dbstruct.User;
import com.patal.logicdbstruct.UsersList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBConnector {
    private static Connection con;
    private static String url = "jdbc:mysql://localhost:3306/xartesus";
    private static String user = "root";
    private static String password = "";

    public DBConnector() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void sendSQL(String sql) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static UsersList getUsers() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        List<User> usersList = new ArrayList<User>();
        try {
            con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from users");
            while (rs.next()) {
                int idUser = rs.getInt("id_users");
                int usertype = rs.getInt("usertype");
                String name = rs.getString("name");
                String surname = rs.getString("surname");
                Date birthDate = rs.getDate("birth_date");
                String login = rs.getString("login");
                String mail = rs.getString("mail");
                String password = rs.getString("password");
                User temp = new User(idUser, usertype, name, surname, birthDate, login, mail, password);
                usersList.add(temp);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new UsersList(usersList);
    }
}

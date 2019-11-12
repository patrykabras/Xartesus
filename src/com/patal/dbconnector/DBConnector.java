package com.patal.dbconnector;

import com.patal.dbstruct.User;
import com.patal.logicdbstruct.ProductList;
import com.patal.logicdbstruct.UsersList;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
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

    private static void classforname() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void sendSQL(String sql) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static UsersList getUsers() {
        classforname();
        List<User> usersList = new ArrayList<User>();
        try {

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

    public static void setUser() {
        //TODO: SET USER
    }

    public static ProductList getProducts() {
        classforname();
        ProductsDBC productsDBC = new ProductsDBC(con);
        return productsDBC.getProducts();
    }

    public static void setProduct() {
        //TODO: SET PRODUCT
    }

    public static HashMap<Integer, String> getPublisher() {
        classforname();
        HashMap<Integer, String> publishersMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from publisher");
            while (rs.next()) {
                publishersMap.put(rs.getInt("id_publisher"), rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishersMap;
    }

    public static void setPublisher(String publisherString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_producer`, `name`) VALUES (NULL, '" + publisherString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, String> getProducer() {
        classforname();
        HashMap<Integer, String> publishersMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from producer");
            while (rs.next()) {
                publishersMap.put(rs.getInt("id_producer"), rs.getString("name"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishersMap;
    }

    public static void setProducer(String producerString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_producer`, `name`) VALUES (NULL, '" + producerString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, String> getGenre() {
        classforname();
        HashMap<Integer, String> publishersMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from genre");
            while (rs.next()) {
                publishersMap.put(rs.getInt("id_genre"), rs.getString("name"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishersMap;
    }

    public static void setGenre(String genreString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_genre`, `name`) VALUES (NULL, '" + genreString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, String> getGraphics() {
        classforname();
        HashMap<Integer, String> publishersMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from graphics");
            while (rs.next()) {
                publishersMap.put(rs.getInt("id_graphics"), rs.getString("name"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishersMap;
    }

    public static void setGraphics(String graphicsString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_graphics`, `name`) VALUES (NULL, '" + graphicsString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, String> getType() {
        classforname();
        HashMap<Integer, String> publishersMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from type");
            while (rs.next()) {
                publishersMap.put(rs.getInt("id_type"), rs.getString("name"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publishersMap;
    }

    public static void setType(String typeString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_type`, `name`) VALUES (NULL, '" + typeString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, String> getPegi() {
        classforname();
        HashMap<Integer, String> pegiMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from pegi");
            while (rs.next()) {
                pegiMap.put(rs.getInt("id_pegi"), rs.getString("name"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pegiMap;
    }

    public static void setPegi(String pegiString) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("INSERT INTO `producer` (`id_pegi`, `name`) VALUES (NULL, '" + pegiString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

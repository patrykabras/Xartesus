package com.patal.dbconnector;

import com.patal.dbstruct.Product;
import com.patal.dbstruct.User;
import com.patal.logicdbstruct.ProductList;
import com.patal.logicdbstruct.UsersList;
import com.patal.warehousemanagment.Warehouse;
import com.patal.warehousemanagment.WarehouseItem;

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

    public static boolean validateUser(String user, String password) {
        classforname();
        boolean vali = false;
        try {

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from users where  login = '" + user + "' and password = '" + password + "';");
            if (rs.next()) {
                vali = true;
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vali;
    }

    public static User getSingleUser(String user, String password) {
        classforname();
        User temp = null;
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from users where  login = '" + user + "' and password = '" + password + "';");
            while (rs.next()) {
                temp = new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return temp;
    }

    public static void setPolling(String idUser, String[] genreIds, String[] graphicsIds, String[] typeIds) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `genre_polling` WHERE `id_user`="+idUser+"");
            for (String id : genreIds) {
                stmt = con.createStatement();
                stmt.executeUpdate("INSERT INTO `genre_polling` (`id_genre_polling`, `id_user`, `id_genre`) VALUES (NULL, '" + idUser + "','" + id + "');");
            }
            stmt.executeUpdate("DELETE FROM `graphics_polling` WHERE `id_user`="+idUser+"");
            for (String id : graphicsIds) {
                stmt = con.createStatement();
                stmt.executeUpdate("INSERT INTO `graphics_polling` (`id_graphics_polling`, `id_user`, `id_graphics`) VALUES (NULL, '" + idUser + "','" + id + "');");
            }
            stmt.executeUpdate("DELETE FROM `type_polling` WHERE `id_user`="+idUser+"");
            for (String id : typeIds) {
                stmt = con.createStatement();
                stmt.executeUpdate("INSERT INTO `type_polling` (`id_type_polling`, `id_user`, `id_type`) VALUES (NULL, '" + idUser + "','" + id + "');");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void getPolling() {

    }

    public static void setUser(String name, String surname, String login, String birth_date, String email, String password) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `users` (`id_users`, `usertype`, `name`, `surname`, `birth_date`, `login`, `mail`, `password`) VALUES (NULL, '1','" + name + "','" + surname + "','" + birth_date + "','" + login + "','" + email + "','" + password + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static ProductList getProducts() {
        classforname();
        ProductsDBC productsDBC = new ProductsDBC(con);
        return productsDBC.getProducts();
    }

    public static int setProduct(String name, String id_producer, String id_publisher, String id_graphics, String id_pegi, String release_date, String fileName) {
        classforname();
        int idOfLastProduct = -1;
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `products` (`id_products`, `name`, `id_producer`, `id_publisher`, `id_graphics`, `id_pegi`, `release_date`, `picture`) VALUES (NULL,'" + name + "','" + id_producer + "','" + id_publisher + "','" + id_graphics + "','" + id_pegi + "','" + release_date + "','" + fileName + "');");

            ResultSet rs = stmt.executeQuery("SELECT LAST_INSERT_ID();");
            while (rs.next()) {
                idOfLastProduct = rs.getInt(1);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idOfLastProduct;
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
            stmt.executeUpdate("INSERT INTO `publisher` (`id_publisher`, `name`) VALUES (NULL, '" + publisherString + "');");
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
            stmt.executeUpdate("INSERT INTO `producer` (`id_producer`, `name`) VALUES (NULL, '" + producerString + "');");
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
            stmt.executeUpdate("INSERT INTO `genre` (`id_genre`, `name`) VALUES (NULL, '" + genreString + "');");
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
            stmt.executeUpdate("INSERT INTO `graphics` (`id_graphics`, `name`) VALUES (NULL, '" + graphicsString + "');");
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
            stmt.executeUpdate("INSERT INTO `type` (`id_type`, `name`) VALUES (NULL, '" + typeString + "');");
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
            stmt.executeUpdate("INSERT INTO `pegi` (`id_pegi`, `name`) VALUES (NULL, '" + pegiString + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, Integer> getGenre_product() {
        classforname();
        HashMap<Integer, Integer> genre_product = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from genre_product");
            while (rs.next()) {
                genre_product.put(rs.getInt("id_product"), rs.getInt("id_genre"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genre_product;
    }

    public static void setGenre_product(int id_product, String[] id_genre) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            for (int i = 0; i < id_genre.length; i++) {
                stmt.executeUpdate("INSERT INTO `genre_product` (`id_genre_product`,`id_product`, `id_genre`) VALUES (NULL, '" + id_product + "','" + id_genre[i] + "');");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<Integer, Integer> getType_product() {
        classforname();
        HashMap<Integer, Integer> genre_product = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from genre_product");
            while (rs.next()) {
                genre_product.put(rs.getInt("id_product"), rs.getInt("id_genre"));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genre_product;
    }

    public static void setType_product(int id_product, String[] id_type) {
        classforname();
        try {
            Statement stmt = con.createStatement();
            for (int i = 0; i < id_type.length; i++) {
                stmt.executeUpdate("INSERT INTO `type_product` (`id_type_product`,`id_product`, `id_type`) VALUES (NULL, '" + id_product + "','" + id_type[i] + "');");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Warehouse getWarehouse() {
        classforname();
        ArrayList<WarehouseItem> tempWarehouseItems = new ArrayList<>(1);
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from warehouse");
            ProductList productList = DBConnector.getProducts();
            while (rs.next()) {
                //TODO moze sie zajechac jezlei product z bazy bedzie usuniety
                Product tempProduct = productList.searchByID(rs.getInt("id_product") + "").get(0);
                WarehouseItem temp = new WarehouseItem(rs.getInt("id_warehouse"), tempProduct, rs.getFloat("price"), rs.getString("key_purchased"), rs.getBoolean("is_sold"));
                tempWarehouseItems.add(temp);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Warehouse(tempWarehouseItems);
    }

    public static void setProductToWarehouse(String id_product, String price, String key_purchased, String is_sold) {
        classforname();
        String isSold = "0";
        if (is_sold != null) {
            isSold = "1";
        }
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `warehouse` (`id_warehouse`,`id_product`, `price`, `key_purchased`, `is_sold`) VALUES (NULL, '" + id_product + "','" + price + "','" + key_purchased + "','" + isSold + "');");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

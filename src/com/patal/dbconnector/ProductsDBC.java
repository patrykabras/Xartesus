package com.patal.dbconnector;

import com.patal.dbstruct.Product;
import com.patal.logicdbstruct.ProductList;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class ProductsDBC {
    private Connection con;

    public ProductsDBC(Connection con) {
        this.con = con;
    }

    public ProductList getProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from products");
            while (rs.next()) {
                 int idProduct = rs.getInt("id_products");
                 String name = rs.getString("name");
                 String producer = getProdcuer(rs.getInt("id_producer"));
                 String publisher = getPublisher(rs.getInt("id_publisher"));
                 String pegi = getPegi(rs.getInt("id_pegi"));
                 String graphic = getGraphics(rs.getInt("id_graphics"));
                 Date releaseDate = rs.getDate("release_date");
                 String picture = rs.getString("picture");
                 List<String> genres = getGenres(idProduct + "");
                 List<String> types = getTypes(idProduct + "");
                 Product temp = new Product(idProduct,name,producer,publisher,pegi,graphic,releaseDate,picture,genres,types);
                 products.add(temp);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ProductList(products);
    }

    public ProductList getProducts(String sql) {
        ArrayList<Product> products = new ArrayList<>();
        HashMap<String,Product> productHashMap = new HashMap<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int idProduct = rs.getInt("id_products");
                String name = rs.getString("name");
                String producer = getProdcuer(rs.getInt("id_producer"));
                String publisher = getPublisher(rs.getInt("id_publisher"));
                String pegi = getPegi(rs.getInt("id_pegi"));
                String graphic = getGraphics(rs.getInt("id_graphics"));
                Date releaseDate = rs.getDate("release_date");
                String picture = rs.getString("picture");
                List<String> genres = getGenres(idProduct + "");
                List<String> types = getTypes(idProduct + "");
                Product temp = new Product(idProduct,name,producer,publisher,pegi,graphic,releaseDate,picture,genres,types);
                productHashMap.put(idProduct +"",temp);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for(Map.Entry<String, Product> entry : productHashMap.entrySet()) {
            products.add(entry.getValue());
        }

        return new ProductList(products);
    }

    public ProductList getFilterSql(String[] types,String[] genres,String[] graphics,String[] pegis,String[] producers,String[] publishers) {
        String sqlStart = "SELECT * FROM `products`INNER JOIN genre_product ON products.id_products = genre_product.id_product INNER JOIN type_product ON products.id_products = type_product.id_product";
        String sql = "";

        if(producers != null){
            if(producers.length != 0){
                for(String producer : producers){
                    sql += " products.id_producer = " + producer + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }
        if(publishers != null){
            if(publishers.length != 0){
                for(String publisher : publishers){
                    sql += " products.id_publisher = " + publisher + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }
        if(graphics != null){
            if(graphics.length != 0){
                for(String graphic : graphics){
                    sql += " products.id_graphics = " + graphic + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }

        if(pegis != null){
            if(pegis.length != 0){
                for(String pegi : pegis){
                    sql += " products.id_pegi = " + pegi + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }

        if(genres != null){
            if(genres.length != 0){
                for(String genre : genres){
                    sql += " genre_product.id_genre = " + genre + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }

        if(types != null){
            if(types.length != 0){
                for(String type : types){
                    sql += " type_product.id_type = " + type + " OR ";
                }
                sql = sql.substring(0,sql.length() - 3);
                sql += " AND ";
            }
        }


        if(sql.length() != 0){
            sql = sql.substring(0,sql.length() - 4);
            sqlStart += " WHERE " + sql;
        }
        return getProducts(sqlStart);
    }

    private String getProdcuer(int index){
        String producer = "";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name from producer WHERE id_producer = "+index);
            while(rs.next()){
                producer = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return producer;
    }

    private String getPublisher(int index){
        String publisher = "";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name from publisher WHERE id_publisher = "+index);
            while(rs.next()){
                publisher = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publisher;
    }

    private String getGraphics(int index){
        String graphics = "";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name from graphics WHERE id_graphics = "+index);
            while(rs.next()){
                graphics = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return graphics;
    }

    private String getPegi(int index){
        String pegi = "";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name from pegi WHERE id_pegi = "+index);
            while(rs.next()){
                pegi = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pegi;
    }

    private List<String> getGenres(String index){
        List<String> genres= new ArrayList<String>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT genre.name from genre,genre_product WHERE genre_product.id_product = "+index+" AND genre_product.id_genre = genre.id_genre");
            while(rs.next()){
                genres.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
    private List<String> getTypes(String index){
        List<String> types= new ArrayList<String>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT type.name from type,type_product WHERE type_product.id_product = "+index+" AND type_product.id_type = type.id_type");
            while(rs.next()){
                types.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }
}

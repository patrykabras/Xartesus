package com.patal.dbconnector;

import com.patal.dbstruct.Product;
import com.patal.logicdbstruct.ProductList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                 String graphic = getGraphics(rs.getInt("id_graphic"));
                 Date releaseDate = rs.getDate("relase_date");
                 Blob picture = rs.getBlob("picture");
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

    private String getProdcuer(int index){
        String producer = "";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name from products WHERE id_producer = "+index);
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
                genres.add(rs.getString(0));
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
                types.add(rs.getString(0));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }
}

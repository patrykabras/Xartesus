package com.patal.dbstruct;

import java.sql.*;
import java.util.List;

public class Product {
    private int idProduct;
    private String name;
    private String producer;
    private String publisher;
    private String pegi;
    private String graphic;
    private Date releaseDate;
    private String picture;
    private List<String> genres;
    private List<String> types;

    public Product(int idProduct, String name, String producer, String publisher, String pegi, String graphic, Date releaseDate, String picture, List<String> genres, List<String> types) {
        this.idProduct = idProduct;
        this.name = name;
        this.producer = producer;
        this.publisher = publisher;
        this.pegi = pegi;
        this.graphic = graphic;
        this.releaseDate = releaseDate;
        this.picture = picture;
        this.genres = genres;
        this.types = types;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPegi() {
        return pegi;
    }

    public void setPegi(String pegi) {
        this.pegi = pegi;
    }

    public String getGraphic() {
        return graphic;
    }

    public void setGraphic(String graphic) {
        this.graphic = graphic;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public List<String> getGenres() {
        return genres;
    }

    public void setGenres(List<String> genres) {
        this.genres = genres;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idProduct=" + idProduct +
                ", name='" + name + '\'' +
                ", producer='" + producer + '\'' +
                ", publisher='" + publisher + '\'' +
                ", pegi='" + pegi + '\'' +
                ", graphic='" + graphic + '\'' +
                ", releaseDate=" + releaseDate +
                ", picture=" + picture +
                ", genres=" + genres +
                ", types=" + types +
                '}';
    }
}

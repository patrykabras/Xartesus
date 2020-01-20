package com.patal.store;

public class ShoppingCartItem {
    String warehouseId;
    String productName;
    String picture;
    double price;

    public ShoppingCartItem(String warehouseId, String productName, String picture, double price) {
        this.warehouseId = warehouseId;
        this.productName = productName;
        this.picture = picture;
        this.price = price;
    }

    public String getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(String warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return
                "warehouseId='" + warehouseId + '\'' +
                ", productName='" + productName + '\'' +
                ", picture='" + picture + '\'' +
                ", price=" + price;
    }
}

package com.patal.warehousemanagment;

import com.patal.dbstruct.Product;

public class WarehouseProduct {
    int id;
    Product product;
    float price;

    public WarehouseProduct(int id, Product product, float price) {
        this.id = id;
        this.product = product;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}

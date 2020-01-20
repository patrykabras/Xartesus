package com.patal.warehousemanagment;

import com.patal.dbstruct.Product;

public class WarehouseItem {
    int id;
    Product product;
    float price;
    String key_purchased;
    boolean is_sold;



    public WarehouseItem(int id, Product product, float price, String key_purchased, boolean is_sold) {
        this.id = id;
        this.product = product;
        this.price = price;
        this.key_purchased = key_purchased;
        this.is_sold = is_sold;
    }

    public int getId() {
        return id;
    }

    public Product getProduct() {
        return product;
    }

    public float getPrice() {
        return price;
    }

    public String getKey_purchased() {
        return key_purchased;
    }

    public boolean isIs_sold() {
        return is_sold;
    }
    @Override
    public String toString() {
        return "WarehouseItem{" +
                "id=" + id +
                ", product=" + product +
                ", price=" + price +
                ", key_purchased='" + key_purchased + '\'' +
                ", is_sold=" + is_sold +
                '}';
    }
}

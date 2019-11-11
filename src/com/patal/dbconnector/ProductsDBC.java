package com.patal.dbconnector;

import com.patal.dbstruct.Product;
import com.patal.logicdbstruct.ProductList;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

class ProductsDBC {
    private Connection con;
    public ProductsDBC(Connection con) {
        this.con = con;
    }

    public ProductList getProducts(){
        ArrayList<Product> products = new ArrayList<>();

        return new ProductList(products);
    }
}

package com.patal.logicdbstruct;

import com.patal.dbstruct.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductList {
    private List<Product> productList;

    public ProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
    public List<Product> searchByID(String phrase){
        return productList.stream().filter(product -> phrase.equals(product.getIdProduct() +"")).collect(Collectors.toList());
    }
    public List<Product> searchByName(String phrase){
        return productList.stream().filter(product -> phrase.toLowerCase().equals(product.getName().toLowerCase() +"")).collect(Collectors.toList());
    }
}

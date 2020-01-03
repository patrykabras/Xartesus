package com.patal.warehousemanagment;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class Warehouse {

    ArrayList<WarehouseItem> warehouseItemsList;

    public Warehouse(ArrayList<WarehouseItem> warehouseItemsList) {
        this.warehouseItemsList = warehouseItemsList;
    }

    public ArrayList<WarehouseItem> getWarehouseItemsList() {
        return warehouseItemsList;
    }

    public void setWarehouseItemsList(ArrayList<WarehouseItem> warehouseItemsList) {
        this.warehouseItemsList = warehouseItemsList;
    }
    public List<WarehouseItem> searchByID(String phrase){
        return warehouseItemsList.stream().filter(warehouseItem -> phrase.equals(warehouseItem.getId() +"")).collect(Collectors.toList());
    }

//    https://stackoverflow.com/questions/8115722/generating-unique-random-numbers-in-java
    public ArrayList<WarehouseItem> getRandomItems(int howMuch){
        ArrayList<WarehouseItem> randomItems = new ArrayList<>(0);
        int currentSize = warehouseItemsList.size();
        if(currentSize <= howMuch){
            randomItems = warehouseItemsList;
        }else{
            ArrayList<Integer> list = new ArrayList<Integer>();
            for (int i=0; i<currentSize; i++) {
                list.add(i);
            }
            Collections.shuffle(list);
            for (int i=0; i<howMuch; i++) {
                randomItems.add(warehouseItemsList.get(list.get(i)));
            }
        }
        return randomItems;
    }
}

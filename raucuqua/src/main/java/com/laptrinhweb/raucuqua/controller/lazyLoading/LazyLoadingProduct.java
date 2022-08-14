package com.laptrinhweb.raucuqua.controller.lazyLoading;

import com.laptrinhweb.raucuqua.beans.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LazyLoadingProduct {
    private Map<Integer, List<Product>> lazy;
    public static LazyLoadingProduct instance;
    private LazyLoadingProduct(){
        lazy = new HashMap<Integer,List<Product>>();
    }

    public static LazyLoadingProduct getInstance() {
        if(instance == null){
            instance = new LazyLoadingProduct();
        }
        return instance;
    }
    public boolean containKey(Integer id){
        return lazy.containsKey(id);
    }
    public List<Product> getList(Integer id){
        if(containKey(id)){
            return lazy.get(id);
        }
        return null;
    }
    public int getListSize(Integer id){
        if(containKey(id)){
            return lazy.get(id).size();
        }
        return -1;
    }
    public void add(Integer id,List<Product> products){
        lazy.put(id,products);
    }

    public void removeseed(int seed) {
        lazy.put(seed,null);
    }
}

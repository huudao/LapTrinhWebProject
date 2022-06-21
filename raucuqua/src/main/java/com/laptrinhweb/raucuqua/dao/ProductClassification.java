package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProductClassification {
    public static List<Product> productForSale(int limit){
        try {

            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where percent_discount>0 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
//                System.out.println(p.getId_product());
                products.add(p);
            }
            rs.close();
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static List<Product> productHot(int limit){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where amount_bought > amount_imported/2 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
//                System.out.println(p.getId_product());
                products.add(p);
            }
            rs.close();
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static List<Product> productTypeTraiCayKhuyenMai(int limit){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where product_type=? and percent_discount>0 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"Trái cây");
            ps.setInt(2,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
//                System.out.println(p.getId_product());
                products.add(p);
            }
            rs.close();;
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Product> productTypeTraiCayHot(int limit){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where product_type=? and amount_bought > amount_imported/2 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"trái cây");
            ps.setInt(2,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
//                System.out.println(p.getId_product());
                products.add(p);
            }
            rs.close();;
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static List<Product> productTypeRauCuKhuyenMai(int limit){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where product_type=? and percent_discount>0 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"rau củ");
            ps.setInt(2,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
                products.add(p);
            }
            rs.close();;
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static List<Product> productTypeRauCuHot(int limit){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql  = "select * from Product where product_type=? and amount_bought > amount_imported/2 limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"rau củ");
            ps.setInt(2,limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setId_product(rs.getString(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_type(rs.getString(3));
                p.setAmount_bought(rs.getInt(4));
                p.setAmount_imported(rs.getInt(5));
                p.setPercent_discount(rs.getInt(6));
                p.setPrice(rs.getDouble(7));
                p.setShort_description(rs.getString(8));
                p.setDescription(rs.getString(9));
                p.setImg_url(rs.getString(10));
                products.add(p);
            }
            rs.close();;
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println("---sale product");
//        List<Product> list = productForSale(10);
//        List<Product> list = productHot(10);
//        List<Product> list = productTypeTraiCayKhuyenMai(10);
        List<Product> list = productTypeRauCuHot(10);

        for (Product p:list
        ) {
            System.out.println(p.getId_product()+", "+p.getPrice()+", "+p.getProduct_type()+" percentdiscount:  "+p.getPercent_discount()+" name: "+p.getProduct_name());
        }

    }
}

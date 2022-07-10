package com.laptrinhweb.raucuqua.dao;
import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.beans.BoughtProduct;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Search {

    public static List<Product> searchByName(String name){
        try {
            Connection con = GetConnection.getCon();
            List<Product> products = new ArrayList<Product>();
            String sql = "SELECT id_product," +
                    "product_name,product_type,amount_bought" +
                    ",amount_imported,percent_discount,price,short_discription," +
                    "discription,img_url FROM product WHERE product_name LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"%"+name+"%");
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
            rs.close();
            ps.close();
            GetConnection.releaseConection(con);

            return products;
        } catch (SQLException e) {
            //some error when execute query
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //can't find the name to get COnnection down database
            e.printStackTrace();
        }
    return null;
    }

    // Lay ra <number> Blog moi nhat
    public static List<Blog> searchBlogByNumber(int number){
        try {
            Connection con = GetConnection.getCon();
            List<Blog> blogs = new ArrayList<Blog>();
            String sql = "select * from blog order by date_post desc limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,number);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Blog blog = new Blog(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7));
                blogs.add(blog);
            }
            rs.close();
            ps.close();
            GetConnection.releaseConection(con);

            return blogs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static Product searchProductById(String id){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from product where id_product = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            Product p = new Product();
            while(rs.next()){
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
            }
            ps.close();
            rs.close();
            GetConnection.releaseConection(con);

            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
    public static List<Bill> bills(String id_user){
        try{
            Connection con = GetConnection.getCon();
            String sql = "select * from bill where id_user = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_user);
            ResultSet rs = ps.executeQuery();
            List<Bill> bills = new ArrayList<Bill>();
            while(rs.next()){
                Bill bill = new Bill();
                bill.setId_bill(rs.getString("id_bill"));
                bill.setId_user(rs.getString("id_user"));
                bill.setAddress(rs.getString("address"));
                bill.setPhone_number(rs.getString("phone_number"));
                bill.setState(rs.getString("state"));
                bill.setTotal_money(rs.getDouble("total_money"));
                bill.setDate_time(rs.getDate("date_time"));
                bills.add(bill);
            }
            rs.close();
            ps.close();
            GetConnection.releaseConection(con);

            return bills;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static Bill billById(String id_bill){
        try{
            Connection con = GetConnection.getCon();
            String sql = "select * from bill where id_bill = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_bill);
            ResultSet rs = ps.executeQuery();
            Bill bill = new Bill();
            while(rs.next()){
                bill.setId_bill(rs.getString("id_bill"));
                bill.setId_user(rs.getString("id_user"));
                bill.setAddress(rs.getString("address"));
                bill.setPhone_number(rs.getString("phone_number"));
                bill.setState(rs.getString("state"));
                bill.setTotal_money(rs.getDouble("total_money"));
                bill.setDate_time(rs.getDate("date_time"));
            }
            rs.close();
            ps.close();
            GetConnection.releaseConection(con);
            return bill;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static List<BoughtProduct> boughtProductsByidBill(String id_bill){
        try{
            Connection con = GetConnection.getCon();
            String sql = "select * from bill join bill_detail on bill.id_bill =bill_detail.id_bill join product on bill_detail.id_product=product.id_product where bill.id_bill = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_bill);
            ResultSet rs = ps.executeQuery();
            List<BoughtProduct> boughtProducts = new ArrayList<BoughtProduct>();
            while(rs.next()){
                BoughtProduct p = new BoughtProduct();
                p.setId_product(rs.getString("bill_detail.id_product"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_type(rs.getString("product_type"));
                p.setAmount_bought(rs.getInt("product.amount_bought"));
                p.setAmount_imported(rs.getInt("amount_imported"));
                p.setPercent_discount(rs.getInt("percent_discount"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_url(rs.getString("img_url"));
                p.setBoughtPrice(rs.getDouble("price_bought"));
                p.setAmount(rs.getInt("bill_detail.amount_bought"));
                boughtProducts.add(p);
            }
            rs.close();
            ps.close();
            GetConnection.releaseConection(con);
            return boughtProducts;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        List<Bill> bills = bills("UA0001");
        for (Bill b:bills
             ) {
            System.out.println(b.toString());
        }
//        Bill b = billById("BI0009");
        Bill b = billById("BI0006");

        System.out.println(b.toString());
        System.out.println("---");
        for(BoughtProduct boughtProduct:boughtProductsByidBill("BI0013")){
            System.out.println(boughtProduct.toString());

        }
//        List<Product> products = searchByName("bắp");
//        UserAccount account = searchUserById("UA0001");
//        System.out.println(account.toString());
//        List<Blog> blogs= searchBlogByNumber(2);
//        for (Blog b:blogs
//             ) {
//            System.out.println(b.toString());
//        }

//        Product ps = searchProductById("PD0005");
//        System.out.println(ps.toString());

//        System.out.println(products.size());
//        for (Product p:products
//             ) {
//            System.out.println(p.toString());
//        }
    }
}

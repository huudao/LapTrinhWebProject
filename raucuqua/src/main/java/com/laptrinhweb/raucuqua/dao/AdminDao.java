package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.beans.Contact;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {
    public static List<UserAccount> listAccount() {
        List<UserAccount> listUser = new ArrayList<UserAccount>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_user,user_name,email,password,img_url,role FROM user_account";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            UserAccount user = null;
            while (rs.next()) {
                user = new UserAccount();
                user.setId_user(rs.getString("id_user"));
                user.setUser_name(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setImg_url(rs.getString("img_url"));
                user.setRole(rs.getInt("role"));

                listUser.add(user);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listUser;
    }

    public static List<Product> listProduct() {
        List<Product> listProduct = new ArrayList<Product>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_product,product_name,product_type,amount_bought,amount_imported,percent_discount, price,short_discription,discription,img_url FROM product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            Product product = null;
            while (rs.next()) {
                product = new Product();
                product.setId_product(rs.getString("id_product"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_type(rs.getString("product_type"));
                product.setAmount_bought(rs.getInt("amount_bought"));
                product.setAmount_imported(rs.getInt("amount_imported"));
                product.setPercent_discount(rs.getInt("percent_discount"));
                product.setPrice(rs.getDouble("price"));
                product.setShort_description(rs.getString("short_discription"));
                product.setDescription(rs.getString("discription"));
                product.setDescription(rs.getString("img_url"));

                listProduct.add(product);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listProduct;
    }

    public static List<Blog> listBlog() {
        List<Blog> listBlog = new ArrayList<Blog>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_blog,blog_name,short_discript,content,author,date_post,img_url FROM blog";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            Blog blog = null;
            while (rs.next()) {
                blog = new Blog();
                blog.setId_blog(rs.getString("id_blog"));
                blog.setName(rs.getString("blog_name"));
                blog.setShort_discription(rs.getString("short_discript"));
                blog.setContent(rs.getString("content"));
                blog.setAuthor(rs.getString("author"));
                blog.setDate_post(rs.getDate("date_post"));
                blog.setImg_url(rs.getString("img_url"));

                listBlog.add(blog);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listBlog;
    }

    public static List<Contact> listContact(int month, int year) {
        List<Contact> listContact = new ArrayList<Contact>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_contact,email,name,phone_name,content,date_up_contact FROM contact WHERE MONTH(date_up_contact) = ? AND YEAR(date_up_contact) = ? ORDER BY date_up_contact DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            Contact contact = null;
            while (rs.next()) {
                contact = new Contact();
                contact.setId_contact(rs.getString("id_contact"));
                contact.setEmail(rs.getString("email"));
                contact.setName(rs.getString("name"));
                contact.setPhone_name(rs.getString("phone_name"));
                contact.setContent(rs.getString("content"));
                contact.setDate_up_contact(rs.getDate("date_up_contact"));

                listContact.add(contact);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listContact;
    }

    public static boolean addProduct(String product_name, String product_type, int amount_bought, int amount_imported, int percent_discount, double price, String short_description, String description, String img_url) {
        try {
            Connection con = GetConnection.getCon();
            String newID = Util.nextID(con, "product", "id_product", "PD");
            //insert infor
            String sqladd = "insert into product(id_product,product_name,product_type,amount_bought,amount_imported,percent_discount,price,short_discription,discription,img_url) values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement psAd = con.prepareStatement(sqladd);
            psAd.setString(1, newID);
            psAd.setString(2, product_name);
            psAd.setString(3, product_type);
            psAd.setInt(4, amount_bought);
            psAd.setInt(5, amount_imported);
            psAd.setInt(6, percent_discount);
            psAd.setDouble(7, price);
            psAd.setString(8, short_description);
            psAd.setString(9, description);
            psAd.setString(10, img_url);
            int result = psAd.executeUpdate();

            GetConnection.releaseConection(con);
            if (result == 1)
                return true;
            else
                return false;


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateProduct(String id_product, String product_name, String product_type, int amount_bought, int amount_imported, int percent_discount, double price, String short_description, String description, String img_url) {
        try {
            Connection con = GetConnection.getCon();
            String sqlUpdate = "UPDATE product SET product_name = ?, product_type = ?, amount_bought = ?, amount_imported = ? , percent_discount = ? , price = ?, short_discription = ?, discription = ?, img_url = ? WHERE id_product = ?";
            PreparedStatement ps = con.prepareStatement(sqlUpdate);
            ps.setString(1,product_name);
            ps.setString(2,product_type);
            ps.setInt(3,amount_bought);
            ps.setInt(4,amount_imported);
            ps.setInt(5,percent_discount);
            ps.setDouble(6,price);
            ps.setString(7,short_description);
            ps.setString(8,description);
            ps.setString(9,img_url);
            ps.setString(10,id_product);

            int result = ps.executeUpdate();

            GetConnection.releaseConection(con);
            if (result == 1)
                return true;
            else
                return false;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteProduct(String id_product){
        try {
            Connection con = GetConnection.getCon();
            String sqlDelete = "DELETE FROM product WHERE id_product=?";
            PreparedStatement psAd = con.prepareStatement(sqlDelete);
            psAd.setString(1,id_product);
            int result = psAd.executeUpdate();

            GetConnection.releaseConection(con);
            if (result == 1)
                return true;
            else
                return false;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
//        System.out.println(updateProduct("PD0010","afasgsf", "bc",15, 15,20,12,"asfaefwa","abasafsadfdsf",""));

//        System.out.println(addProduct("abc", "bc",15, 15,20,12,"asfaefwa","abasafsadfdsf",""));
//        System.out.println(deleteProduct("PD0010"));

//        for (UserAccount u : listAccount()) {
//            System.out.println(u);
//        }

//        for(Product p : listProduct()){
//            System.out.println(p);
//        }
//
//        for(Blog b : listBlog()){
//            System.out.println(b);
//        }

//        for(Contact c : listContact(8,2022)){
//            System.out.println(c);
//        }
    }

}

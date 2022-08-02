package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.CommentProduct;
import com.laptrinhweb.raucuqua.beans.IComment;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductFunction {
    //only return number of star in product
    public static int[] returnNumberStar(HashMap<String, IComment> comments) {
        int[] numberstars = new int[5];
        for (IComment i : comments.values()) {
            CommentProduct p = (CommentProduct) i;
            numberstars[p.getNum_star() - 1]++;
        }
        return numberstars;
    }

    public static List<Product> searchProductByTypeAndQuantity(String type, int quantity) {
        List<Product> products = new ArrayList<Product>();
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from product where product_type = ? limit ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, type);
            ps.setInt(2, quantity);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public static void main(String[] args) {
//        for (Product p : searchProductByTypeAndQuantity("rau củ", 5)
//        ) {
//            System.out.println(p.toString());
//        }
    }
}

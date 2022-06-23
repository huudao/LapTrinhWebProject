package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.connection.GetConnection;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.beans.UserAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartFuntions {
    public static List<Cart> watch(String id_user){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from cart join product on cart.id_product = product.id_product join user_account on user_account.id_user = cart.id_user where cart.id_user=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_user);
            List<Cart> user_products = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                UserAccount user = new UserAccount();
                Cart cart = new Cart();
                p.setId_product(rs.getString("id_product"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_type(rs.getString("product_type"));
                p.setAmount_bought(rs.getInt("amount_bought"));
                p.setAmount_imported(rs.getInt("amount_imported"));
                p.setPercent_discount(rs.getInt("percent_discount"));
                p.setPrice(rs.getDouble("price"));
                p.setShort_description(rs.getString("short_discription"));
                p.setDescription(rs.getString("discription"));
                p.setImg_url(rs.getString("img_url"));
                user.setId_user(id_user);
                user.setUser_name(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
//                user.setPassword(rs.getString("password"));
                cart.setUser(user);
                cart.setProduct(p);
                cart.setAmount(rs.getInt("c_amount_bought"));
                user_products.add(cart);
            }
            rs.close();
            return user_products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}

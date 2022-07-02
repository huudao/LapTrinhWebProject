package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Payment {
    public static void checkValidData(Connection con, List<Cart> products) throws SQLException {
        for (Cart cart:products
        ) {
            String id_product = cart.getProduct().getId_product();
            int amount = cart.getAmount();
            Util.check_amount_in_warehouse(con, id_product, amount);
        }
//        System.out.println("[VALID DATA] -remove this notification if needed!");
    }
    public static synchronized void payment(String id_user,String address,String state,double total_money,String phone_number)  {
        try {
            Connection con = GetConnection.getCon();
            List<Cart> products = CartFuntions.watch(id_user);
            //check is amount still valid?
            checkValidData(con, products);
            //buy time!
            //get the latest id in table
            String id = Util.nextID(con, "bill", "id_bill", "BI");
            System.out.println(id);
            //do it bill infor.
            String sql = "insert into bill values(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, id_user);
            ps.setString(3, address);
            ps.setString(4, state);
            ps.setDouble(5, total_money);
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            ps.setTimestamp(6, date);
            ps.setString(7, phone_number);
            int scalar = ps.executeUpdate();

            //deal with bill_detail
            //add all product and infor into bill_detail
            for (Cart cart : products
            ) {
//            try {
                String sql_add = "insert into bill_detail values (?,?,?,?)";
                PreparedStatement ps_add = con.prepareStatement(sql_add);
                ps_add.setString(1, cart.getProduct().getId_product());
                ps_add.setString(2, id);
                ps_add.setInt(3, cart.getAmount());
                ps_add.setDouble(4, cart.getProduct().getPrice());
                ps_add.executeUpdate();
                //increase amount_bought in product table.
                String sql_update_product = "update product set amount_bought = ? where id_product = ?";
                int amount_bought = cart.getAmount() + cart.getProduct().getAmount_bought();
                ps_add = con.prepareStatement(sql_update_product);
                ps_add.setInt(1, amount_bought);
                ps_add.setString(2, cart.getProduct().getId_product());
                ps_add.executeUpdate();
            }
            //delete all product in cart!
            for (Cart cart : products
            ) {
                CartFuntions.deleteProduct(id_user, cart.getProduct().getId_product());
            }
            GetConnection.releaseConection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        String id_user = "UA0004";
        payment(id_user,"java ranch 123s","đã thanh toán",CartFuntions.totalMoney(id_user),"0123445679");
    }
}

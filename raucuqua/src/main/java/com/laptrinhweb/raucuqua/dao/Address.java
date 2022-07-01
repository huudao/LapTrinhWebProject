package com.laptrinhweb.raucuqua.dao;


import com.laptrinhweb.raucuqua.beans.UserAddress;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Address {
    public static void addAddress(String id_user,String city_province,String district,String ward,String house_address,String phone_number,String username)  {
        try {
            Connection con = GetConnection.getCon();
            String nextID = Util.nextID(con, "user_address", "id_address", "AD");
            String sql = "insert into user_address values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nextID);
            ps.setString(2, id_user);
            ps.setString(3, city_province);
            ps.setString(4, district);
            ps.setString(5, ward);
            ps.setString(6, house_address);
            ps.setString(7, phone_number);
            ps.setString(8, username);
            ps.setBoolean(9,false);
            int scalar = ps.executeUpdate();
            GetConnection.releaseConection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static List<UserAddress> watch(String id_user) {
        try {
            Connection con = GetConnection.getCon();
            String sql = "Select * from user_address join user_account on user_address.id_user = user_account.id_user where user_address.id_user = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_user);
            List<UserAddress> addresses = new ArrayList<UserAddress>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserAddress u = new UserAddress();
                u.setId_address(rs.getString("id_address"));
                u.setId_user(rs.getString("id_user"));
                u.setCity_province(rs.getString("city_province"));
                u.setDistrict(rs.getString("district"));
                u.setWard(rs.getString("ward"));
                u.setHouse_address(rs.getString("house_address"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setUser_name(rs.getString("user_name"));
                u.setChoose(rs.getBoolean("is_choose"));
                addresses.add(u);
            }
            rs.close();
            GetConnection.releaseConection(con);
            return addresses;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean setDefaultAddress(String id_user,String id_address){
        try {
            Connection con = GetConnection.getCon();
            String sql = "update user_address set ischoose = true where id_address = ? and id_address=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_user);
            ps.setString(2, id_address);
            int sclar = ps.executeUpdate();
            GetConnection.releaseConection(con);
            if(sclar ==1)return true; else return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static void removeAddress(String id_user,String id_address)  {
        try {
            Connection con = GetConnection.getCon();
            String sql = "delete from user_address where id_user = ? and id_address = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_user);
            ps.setString(2, id_address);
            int sclar = ps.executeUpdate();
            GetConnection.releaseConection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        watch("UA0003");
        addAddress("UA0005","city 1","district1","ward 1","house address 1","0123","javax");
        removeAddress("UA0005","AD0010");
    }
}

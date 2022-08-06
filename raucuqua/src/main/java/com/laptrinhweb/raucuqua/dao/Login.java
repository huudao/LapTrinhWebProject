package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.connection.GetConnection;
import com.laptrinhweb.raucuqua.beans.UserAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
    public static UserAccount login(String username,String password){
        try {
            Connection con = GetConnection.getCon();
            String sql ="SELECT id_user,user_name,email,password,img_url,role FROM user_account" +
                    " WHERE user_name = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,Util.hashPassword(password));
            ResultSet rs = ps.executeQuery();
            int count = 0;
            UserAccount user =null;
            while(rs.next()){
                if(count ==1) return null;
                 user = new UserAccount();
                user.setId_user(rs.getString(1));
                user.setUser_name(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setImg_url(rs.getString("img_url"));
                user.setRole(rs.getInt("role"));
                if(!rs.getString(2).equals(username)) return null;
                if(!rs.getString(4).equals(Util.hashPassword(password))) return null;
                count++;
            }
            GetConnection.releaseConection(con);
            if(count ==0) return null;
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    return null;
    }

    public static void main(String[] args) {
        System.out.println(login("thejavax","jdk7"));
        UserAccount ua = Login.login("qkhai","12");
        System.out.println(ua.toString());
    }
}

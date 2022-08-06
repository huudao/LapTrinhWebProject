package com.laptrinhweb.raucuqua.dao;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.laptrinhweb.raucuqua.dao.Util.nextID;

public class Register {
    // duplicated return true
    public static boolean checkDuplicate(String userName, String email, String password) {
        try {
            Connection con = GetConnection.getCon();
            String sql = "SELECT * FROM user_account";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getString("user_name").equals(userName) || rs.getString("email").equals(email)) {
                    return true;
                }
            }
            GetConnection.releaseConection(con);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean registerAutoID_user(String username,String email,String password,String img_url){
        try {
            if(!checkDuplicate(username,email,password)) {
                //query down to get the last id and +1 e.g UA0001 -> UA and 1 and next will be UA and 2 -> UA0002
                Connection con = GetConnection.getCon();
                String newID = nextID(con, "user_account", "id_user", "UA");
                System.out.println(newID);
                //insert infor
                String sqladd = "insert into user_account(id_user,user_name,email,password,img_url) values(?,?,?,?,?)";
                PreparedStatement psAd = con.prepareStatement(sqladd);
                psAd.setString(1, newID);
                psAd.setString(2, username);
                psAd.setString(3, email);
                psAd.setString(4, Util.hashPassword(password));
                psAd.setString(5,img_url);
                int result = psAd.executeUpdate();
                GetConnection.releaseConection(con);

                if (result == 1)
                    return true;
                else
                    return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(registerAutoID_user("abc","abc@gmail.com","abc",""));

    }
}

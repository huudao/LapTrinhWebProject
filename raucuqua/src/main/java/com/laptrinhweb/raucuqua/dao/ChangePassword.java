package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ChangePassword {
    public static boolean checkOldPassword(String id, String oldPassword) {
        try {
            Connection con = GetConnection.getCon();
            String sql = "SELECT id_user,user_name,email,password FROM user_account" +
                    " WHERE id_user = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, Util.hashPassword(oldPassword));
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            GetConnection.releaseConection(con);
            if (count == 1) return true;
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean changePassById(String id, String oldPassword, String newPassword) {
        try {
            if (checkOldPassword(id, oldPassword)) {
                Connection con = GetConnection.getCon();
                String sql = "UPDATE user_account set password=? where id_user = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, Util.hashPassword(newPassword));
                ps.setString(2, id);
                int result = ps.executeUpdate();
                GetConnection.releaseConection(con);
                if (result == 1) {
                    return true;
                } else {
                    return false;
                }
            } else return false;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean changePassByEmail(String email, String newPassword) {
        try {
            Connection con = GetConnection.getCon();
            String sql = "UPDATE user_account set password=? where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Util.hashPassword(newPassword));
            ps.setString(2, email);
            int result = ps.executeUpdate();
            GetConnection.releaseConection(con);
            if (result >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
//        System.out.println(changePassByEmail("thuan0373535207@gmail.com","hey javax"));

    }
}

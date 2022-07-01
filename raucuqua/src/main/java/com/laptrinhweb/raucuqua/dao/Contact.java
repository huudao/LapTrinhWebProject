package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.connection.GetConnection;
import com.laptrinhweb.raucuqua.dao.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Contact {
    public static void addContact(String email,String name,String phone_name,String content) {
        try {
            Connection con = GetConnection.getCon();
            String nextID = Util.nextID(con, "contact", "id_contact", "CT");
            String sql = "insert into contact values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nextID);
            ps.setString(2, email);
            ps.setString(3, name
            );
            ps.setString(4, phone_name);
            ps.setString(5, content);
            int clar = ps.executeUpdate();
            GetConnection.releaseConection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        addContact("trkih2001@gmail.com","Khai","0901197448","alooooo");
    }

}

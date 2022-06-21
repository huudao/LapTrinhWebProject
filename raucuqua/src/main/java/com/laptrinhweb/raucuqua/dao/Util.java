package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Util {
    public static String nextID(Connection con, String table_name, String id_template, String symbolID) throws SQLException {
        String sql ="SELECT "+id_template+" FROM "+table_name;
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Integer> id_list = new ArrayList<Integer>();
        String lastId = null;
        while(rs.next()){
            lastId = rs.getString(1);
            id_list.add(Integer.parseInt(rs.getString(1).substring(2)));
        }

//        int number = Integer.parseInt(lastId.substring(2))+1;
        int number = getMax(id_list)+1;
        String newID = symbolID+String.format("%04d", number);
        rs.close();
        return newID;
    }
    public static int getMax (List<Integer> list){
        if(list==null || list.size()==0){
            return 0;
        }
        int max = list.get(0);
        for (Integer i:list
        ) {
            if(max<i){
                max = i;
            }
        }
        return max;
    }

    public static void main(String[] args) {
        Connection con = null;
        try {
            con = GetConnection.getCon();
            System.out.println(nextID(con, "user_account", "id_user", "UA"));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}

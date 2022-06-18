package com.laptrinhweb.raucuqua.dao;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Register {
    public static String nextID(Connection con,String table_name,String id_template,String symbolID) throws SQLException {
        String sql ="SELECT "+id_template+" FROM "+table_name;
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Integer> id_list = new ArrayList<Integer>();
        String lastId = null;
        System.out.println("run nextid");
        while(rs.next()){
            lastId = rs.getString(1);
            id_list.add(Integer.parseInt(rs.getString(1).substring(2)));
            System.out.println(id_list.get(id_list.size()-1));
        }

//        int number = Integer.parseInt(lastId.substring(2))+1;
        int number = getMax(id_list)+1;
        System.out.println("max id: "+number
        );
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
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean registerAutoID_user(String username,String email,String password){
        try {
            if(!checkDuplicate(username,email,password)) {
                //query down to get the last id and +1 e.g UA0001 -> UA and 1 and next will be UA and 2 -> UA0002
                Connection con = GetConnection.getCon();
                String newID = nextID(con, "user_account", "id_user", "UA");
                System.out.println(newID);
                //insert infor
                String sqladd = "insert into user_account(id_user,user_name,email,password) values(?,?,?,?)";
                PreparedStatement psAd = con.prepareStatement(sqladd);
                psAd.setString(1, newID);
                psAd.setString(2, username);
                psAd.setString(3, email);
                psAd.setString(4, password);
                int result = psAd.executeUpdate();
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
}

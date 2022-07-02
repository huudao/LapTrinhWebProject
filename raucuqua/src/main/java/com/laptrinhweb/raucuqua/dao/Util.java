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
        GetConnection.releaseConection(con);
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
    public static boolean checkDataExist(String id_template,String id,String table_name){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from "+table_name+"  where "+id_template+" = ?";
            PreparedStatement ps  = con.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            boolean exist = false;
            while(rs.next()){
                if(rs.getString(id_template).equals(id)){
                    exist = true;break;}
            }
            rs.close();
            GetConnection.releaseConection(con);

            return exist;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void check_amount_in_warehouse(Connection con,String id_product,int amount) throws SQLException {
        int leftAmount =0;
        String getAmount = "select amount_bought,amount_imported from product where id_product = ?";
        PreparedStatement getAmountps= con.prepareStatement(getAmount);
        getAmountps.setString(1,id_product);
        ResultSet getamountrs = getAmountps.executeQuery();
        getamountrs.next();
        int amount_bought = getamountrs.getInt(1);
        int amount_imported = getamountrs.getInt(2);
        if(!((amount_bought+amount)<=amount_imported)){
            int left_amount = amount_imported-amount_bought;
            GetConnection.releaseConection(con);
            throw new SQLException("amount left in warehouse not enough, only "+left_amount+" items left. But your amount is "+amount+" at product: "+id_product);
        }
        getamountrs.close();
        GetConnection.releaseConection(con);

    }
    public static boolean checkExistMail(String email) {
        try {
            Connection con = GetConnection.getCon();
            String sql ="select count(email) from user_account where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt(1);
            }
            GetConnection.releaseConection(con);

            if(count>=1){
                rs.close();
                ps.close();
                return true;
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        Connection con = null;
        try {
            con = GetConnection.getCon();
            System.out.println(nextID(con, "user_account", "id_user", "UA"));
            System.out.println(checkDataExist("id_user","UA0001","user_account"));
//            check_amount_in_warehouse(con,"PD0001",200);
            System.out.println(checkExistMail("thuan0373535207@gmail.com"));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}

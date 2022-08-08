package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class BillFuntions {
    public static double income(int month,int year){

        try {
            Connection con = GetConnection.getCon();
            String sql = "SELECT SUM(total_money) as total, date_time FROM bill WHERE MONTH(date_time)=? AND YEAR(date_time)=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            double total =0.0;
            while(rs.next()){
                total += rs.getDouble("total");
            }
            GetConnection.releaseConection(con);
            return total;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static List<Bill> listBill(int month, int year){
        List<Bill> listB = new ArrayList<Bill>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_bill,id_user,address,state ,total_money,date_time,phone_number,ship_fee,ship_state,payment FROM bill WHERE MONTH(date_time) = ? AND YEAR(date_time) = ? ORDER BY date_time DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            Bill bill = null;
            while (rs.next()) {
                bill = new Bill();
                bill.setId_bill(rs.getString("id_bill"));
                bill.setId_user(rs.getString("id_user"));
                bill.setAddress(rs.getString("address"));
                bill.setState(rs.getString("state"));
                bill.setTotal_money(rs.getDouble("total_money"));
                bill.setPhone_number(rs.getString("phone_number"));
                bill.setDate_time(rs.getDate("date_time"));
                bill.setShip_fee(rs.getDouble("ship_fee"));
                bill.setShip_state(rs.getString("ship_state"));
                bill.setPayment(rs.getString("payment"));
                listB.add(bill);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listB;
    }

    public static List<Bill> listBillNotPay(int month,int year){
        List<Bill> listBNP = new ArrayList<Bill>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_bill,id_user,address,state ,total_money,date_time,phone_number,ship_fee,ship_state,payment FROM bill WHERE state = 'chưa thanh toán'and MONTH(date_time) = ? AND YEAR(date_time) = ? ORDER BY date_time DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            Bill bill = null;
            while (rs.next()) {
                bill = new Bill();
                bill.setId_bill(rs.getString("id_bill"));
                bill.setId_user(rs.getString("id_user"));
                bill.setAddress(rs.getString("address"));
                bill.setState(rs.getString("state"));
                bill.setTotal_money(rs.getDouble("total_money"));
                bill.setPhone_number(rs.getString("phone_number"));
                bill.setDate_time(rs.getDate("date_time"));
                bill.setShip_fee(rs.getDouble("ship_fee"));
                bill.setShip_state(rs.getString("ship_state"));
                bill.setPayment(rs.getString("payment"));

                listBNP.add(bill);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listBNP;
    }
    public static List<Bill> listBillNotShip(int month,int year){
        List<Bill> listBNS = new ArrayList<Bill>();

        try {
            Connection conn = GetConnection.getCon();
            String sql = "SELECT id_bill,id_user,address,state ,total_money,date_time,phone_number,ship_fee,ship_state,payment FROM bill WHERE ship_state = 'chưa giao hàng'and MONTH(date_time) = ? AND YEAR(date_time) = ? ORDER BY date_time DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            Bill bill = null;
            while (rs.next()) {
                bill = new Bill();
                bill.setId_bill(rs.getString("id_bill"));
                bill.setId_user(rs.getString("id_user"));
                bill.setAddress(rs.getString("address"));
                bill.setState(rs.getString("state"));
                bill.setTotal_money(rs.getDouble("total_money"));
                bill.setPhone_number(rs.getString("phone_number"));
                bill.setDate_time(rs.getDate("date_time"));
                bill.setShip_fee(rs.getDouble("ship_fee"));
                bill.setShip_state(rs.getString("ship_state"));
                bill.setPayment(rs.getString("payment"));

                listBNS.add(bill);
            }
            GetConnection.releaseConection(conn);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listBNS;
    }

    public static void main(String[] args) {
//        System.out.println(income(8,2022));
//        System.out.println("---------------------------");
        for(Bill b : listBill(8,2022) ){
            System.out.println(b);
        }
//        System.out.println("---------------------------");
//        for(Bill b : listBillNotPay(8,2022) ){
//            System.out.println(b);
//        }
//        System.out.println("---------------------------");
//        for(Bill b : listBillNotShip(8,2022) ){
//            System.out.println(b);
//        }
    }
}
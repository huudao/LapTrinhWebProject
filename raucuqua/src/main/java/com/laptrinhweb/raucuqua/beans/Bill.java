package com.laptrinhweb.raucuqua.beans;

import java.util.Date;

public class Bill {
    private String id_bill;
    private String id_user;
    private String address;
    private String state;
    private double total_money;
    private Date date_time;
    private String phone_number;

    public String getId_bill() {
        return id_bill;
    }

    public void setId_bill(String id_bill) {
        this.id_bill = id_bill;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id_bill='" + id_bill + '\'' +
                ", id_user='" + id_user + '\'' +
                ", address='" + address + '\'' +
                ", state='" + state + '\'' +
                ", total_money=" + total_money +
                ", date_time=" + date_time +
                ", phone_number='" + phone_number + '\'' +
                '}';
    }
}

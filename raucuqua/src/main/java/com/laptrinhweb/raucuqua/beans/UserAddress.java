package com.laptrinhweb.raucuqua.beans;

public class UserAddress {
    private String id_user;
    private String id_address;
    private String city_province;
    private String district;
    private String ward;
    private String house_address;
    private String phone_number;
    private String user_name;
    private String extra_infor;
    private boolean isChoose;

    public String getExtra_infor() {
        return extra_infor;
    }

    public void setExtra_infor(String extra_infor) {
        this.extra_infor = extra_infor;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public boolean isChoose() {
        return isChoose;
    }

    public void setChoose(boolean choose) {
        isChoose = choose;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getId_address() {
        return id_address;
    }
    public void setId_address(String id_address) {
        this.id_address = id_address;
    }

    public String getCity_province() {
        return city_province;
    }

    public void setCity_province(String city_province) {
        this.city_province = city_province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getHouse_address() {
        return house_address;
    }

    public void setHouse_address(String house_address) {
        this.house_address = house_address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "id_user='" + id_user + '\'' +
                ", id_address='" + id_address + '\'' +
                ", city_province='" + city_province + '\'' +
                ", district='" + district + '\'' +
                ", ward='" + ward + '\'' +
                ", house_address='" + house_address + '\'' +
                ", phone_number='" + phone_number + '\'' +
                '}';
    }
    public String convertAddressToString(){
        return city_province+", "+district+", "+ward+", "+house_address+", phone_number: "+phone_number+", extra infor: "+extra_infor+", id_user: "+id_user+", username: "+user_name;
    }
}

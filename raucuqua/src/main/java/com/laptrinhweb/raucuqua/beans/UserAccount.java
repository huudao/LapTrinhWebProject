package com.laptrinhweb.raucuqua.beans;

public class UserAccount {
    private String id_user;
    private String user_name;
    private String email;
    private String password;
    private String img_url;
    private int role;

    public UserAccount(String id_user, String user_name, String email) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.email = email;
        this.img_url = null;
        this.role = 0;
    }

    public UserAccount(String id_user, String user_name, String email, String password) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.img_url = null;
        this.role = 0;
    }

    public UserAccount(String id_user, String user_name, String email, String password, String img_url, int role) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.img_url = img_url;
        this.role = role;
    }

    public UserAccount(){

    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    @Override
    public String toString() {
        return "UserAccount{" +
                "id_user='" + id_user + '\'' +
                ", user_name='" + user_name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

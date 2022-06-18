package com.laptrinhweb.raucuqua.beans;

public class UserAccount {
    private String id_user;
    private String user_name;
    private String email;

    public UserAccount(String id_user, String user_name, String email) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.email = email;
    }
    public UserAccount(){

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

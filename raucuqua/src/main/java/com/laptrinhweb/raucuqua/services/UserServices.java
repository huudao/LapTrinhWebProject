package com.laptrinhweb.raucuqua.services;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Register;
import com.laptrinhweb.raucuqua.dao.Login;

public class UserServices {
    private static UserServices instance;

    private UserServices() {
    }

    public static UserServices getInstance() {
        if(instance == null) {
            instance = new UserServices();
        }
        return instance;
    }

    public boolean register(String userName,String email, String password) {
        return Register.registerAutoID_user(userName,email,password);
    }


    public UserAccount checkLogin(String username, String password){
        UserAccount user = Login.login(username,password);
        if(user==null||!user.getUser_name().equals(username)) return null;
        return user;
    }

}

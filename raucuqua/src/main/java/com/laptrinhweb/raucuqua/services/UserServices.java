package com.laptrinhweb.raucuqua.services;

import com.laptrinhweb.raucuqua.dao.Register;

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

}

package com.laptrinhweb.raucuqua.controller.admin;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "QuanLyTaiKhoan", value = "/QuanLyTaiKhoan")
public class QuanLyTaiKhoan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserAccount> accounts = AdminDao.listAccount();

        String gson = new Gson().toJson(accounts);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

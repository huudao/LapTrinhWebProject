package com.laptrinhweb.raucuqua.controller.admin.contact;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.beans.Contact;
import com.laptrinhweb.raucuqua.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuanLyFeedBack", value = "/QuanLyFeedBack")
public class QuanLyFeedBack extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Contact> blogs = AdminDao.listContact();
        String gson = new Gson().toJson(blogs);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

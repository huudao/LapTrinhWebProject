package com.laptrinhweb.raucuqua.controller.admin.product;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuanLySanPham", value = "/QuanLySanPham")
public class QuanLySanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Product> products = AdminDao.listProduct();
        String gson = new Gson().toJson(products);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

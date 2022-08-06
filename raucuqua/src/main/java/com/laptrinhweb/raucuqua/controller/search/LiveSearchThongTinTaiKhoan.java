package com.laptrinhweb.raucuqua.controller.search;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LiveSearchThongTinTaiKhoan", value = "/thongTinTaiKhoan/LiveSearch")
public class LiveSearchThongTinTaiKhoan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String s = request.getParameter("q");
        List<Product> products = Search.searchByName(s);
        String gson = new Gson().toJson(products);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

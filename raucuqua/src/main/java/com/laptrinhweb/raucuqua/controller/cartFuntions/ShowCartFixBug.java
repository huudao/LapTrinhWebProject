package com.laptrinhweb.raucuqua.controller.cartFuntions;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.dao.CartFuntions;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowCartFixBug", value = "/thongTinTaiKhoan/ShowCart")
public class ShowCartFixBug extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        List<Cart> carts = CartFuntions.watch(id_user);
        String gson = new Gson().toJson(carts);
        System.out.println(gson);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

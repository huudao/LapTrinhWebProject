package com.laptrinhweb.raucuqua.controller.cartFuntions;

import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.dao.CartFuntions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RemoveAllCart", value = "/RemoveAllCart")
public class RemoveAllCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        List<Cart> carts = CartFuntions.watch(id_user);
        for (Cart c:carts
             ) {
            CartFuntions.deleteProduct(id_user,c.getProduct().getId_product());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.laptrinhweb.raucuqua.controller.cartFuntions;

import com.laptrinhweb.raucuqua.dao.CartFuntions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveCart", value = "/RemoveCart")
public class RemoveCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        String id_product = request.getParameter("id_product");
        int amount = CartFuntions.getAmount(id_user,id_product);
        boolean result = false;
        int delete = 0;
        if(amount > 0){
            delete = CartFuntions.deleteProduct(id_user,id_product);
            result = true;
        }
        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

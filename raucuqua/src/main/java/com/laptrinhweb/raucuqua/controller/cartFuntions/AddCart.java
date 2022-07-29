package com.laptrinhweb.raucuqua.controller.cartFuntions;

import com.laptrinhweb.raucuqua.dao.CartFuntions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCart", value = "/AddCart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        String id_product = request.getParameter("id_product");
        int amount = Integer.parseInt(request.getParameter("amount"));
        boolean check = CartFuntions.checkProductCart(id_user,id_product);
        boolean result = false;
        System.out.println("[OUTSIDE]id_user: "+id_user+", idproduct: "+id_product+", amount: "+amount +", CHECK: "+check);
        if(check == true){
            int amount_cart = CartFuntions.getAmount(id_user,id_product);
            int amountCheck = amount+amount_cart;
            if(amountCheck==0){
                CartFuntions.deleteProduct(id_user,id_product);
                result = true;
            }else {
                result = CartFuntions.updateAmount(id_user, id_product, amount);
            }
        }if(check==false){
            System.out.println("id_user: "+id_user+", idproduct: "+id_product+", amount: "+amount);
            result = CartFuntions.insertProduct(id_user,id_product,amount);
        }

        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.laptrinhweb.raucuqua.controller.payment;

import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.beans.UserAddress;
import com.laptrinhweb.raucuqua.dao.Address;
import com.laptrinhweb.raucuqua.dao.CartFuntions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ThanhToan", value = "/ThanhToan")
public class ThanhToan extends HttpServlet {
    public static double FEE = 0.1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession s = request.getSession();

        UserAccount ua = (UserAccount) s.getAttribute("auth");
        if(ua==null){
            s.setAttribute("previousPage",request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        List<Cart> carts = CartFuntions.watch(ua.getId_user());
        List<UserAddress> addresses = Address.watch(ua.getId_user());

        double totalMoney = CartFuntions.totalMoney(ua.getId_user());
        double feeShip = totalMoney*FEE;
        double total = totalMoney + feeShip;

        request.setAttribute("carts",carts);
        request.setAttribute("addresses",addresses);
        request.setAttribute("cart-size",carts.size());

        request.setAttribute("totalMoney",totalMoney);
        request.setAttribute("feeShip",feeShip);
        request.setAttribute("total",total);

        request.getRequestDispatcher("thanhToan.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

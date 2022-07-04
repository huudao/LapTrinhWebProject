package com.laptrinhweb.raucuqua.controller.address;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.beans.UserAddress;
import com.laptrinhweb.raucuqua.dao.Address;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowDiaChi", value = "/ShowDiaChi")
public class ShowAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        UserAccount ua = (UserAccount) session.getAttribute("auth");
        List<UserAddress> addresses = Address.watch(ua.getId_user());
        request.setAttribute("addresses",addresses);
        request.getRequestDispatcher("thongTinTaiKhoan/soDiaChi.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

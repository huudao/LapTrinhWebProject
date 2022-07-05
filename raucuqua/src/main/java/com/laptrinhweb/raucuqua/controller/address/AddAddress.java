package com.laptrinhweb.raucuqua.controller.address;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Address;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddAddress", value = "/AddAddress")
public class AddAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String id_user = ua.getId_user();
        String user_name = request.getParameter("username");
        String phone_number = request.getParameter("Phone");
        String city_province = request.getParameter("city-province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String house_address= request.getParameter("house-address");
        Address.addAddress(id_user,city_province,district,ward,house_address,phone_number,user_name);
        response.sendRedirect("ShowDiaChi");
    }
}

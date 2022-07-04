package com.laptrinhweb.raucuqua.controller.address;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Address;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteAddress", value = "/DeleteAddress")
public class DeleteAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String id_address = request.getParameter("id_address");
        String id_user = ua.getId_user();
        Address.removeAddress(id_user,id_address);
        response.sendRedirect("ShowDiaChi");
    }
}

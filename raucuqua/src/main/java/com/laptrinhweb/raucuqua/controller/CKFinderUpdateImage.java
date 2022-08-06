package com.laptrinhweb.raucuqua.controller;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Util;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "CKFinderUpdateImage", value = "/thongTinTaiKhoan/CKFinderUpdateImage")
public class CKFinderUpdateImage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RUNNENNNENE");
        String encodeurl = request.getParameter("url");
        System.out.println("RUNNENNNENE: "+encodeurl);
        String url = java.net.URLDecoder.decode(encodeurl, StandardCharsets.UTF_8.name());
        System.out.println(url);
        UserAccount ua = (UserAccount) request.getSession().getAttribute("auth");
        if(ua==null){
            throw new ServletException("do not login");

        }
        Util.updateImgUrl(ua.getId_user(),url);
        ua.setImg_url(url);
        response.sendRedirect("thongTinTaiKhoan.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

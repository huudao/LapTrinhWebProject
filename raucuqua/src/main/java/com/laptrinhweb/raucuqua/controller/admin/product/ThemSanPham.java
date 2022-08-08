package com.laptrinhweb.raucuqua.controller.admin.product;

import com.laptrinhweb.raucuqua.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ThemSanPham", value = "/ThemSanPham")
public class ThemSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("pname");
        String product_type = request.getParameter("ptype");
        int amount_bought = Integer.parseInt(request.getParameter("pnumbuy"));
        int amount_imported = Integer.parseInt(request.getParameter("padd"));
        int percent_discount = Integer.parseInt(request.getParameter("pdiscount"));
        int price = Integer.parseInt(request.getParameter("pprice"));
        String short_description = request.getParameter("psdes");
        String description = request.getParameter("pdes");
        String img_url = request.getParameter("pimg");

        AdminDao.addProduct(product_name,product_type,amount_bought,amount_imported,percent_discount,price,short_description,description,img_url);
        response.sendRedirect("QuanLyAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

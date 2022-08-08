package com.laptrinhweb.raucuqua.controller.admin.bill;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.dao.BillFuntions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "QuanLyHoaDon", value = "/QuanLyHoaDon")
public class QuanLyHoaDon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        LocalDate currentDate = LocalDate.now();
        int month = currentDate.getMonthValue();
        int year = currentDate.getYear();
        List<Bill> listBill = BillFuntions.listBill(month, year);
        String gson = new Gson().toJson(listBill);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

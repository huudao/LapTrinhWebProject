package com.laptrinhweb.raucuqua.controller;

import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.dao.BillFuntions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "IncomeBill", value = "/IncomeBill")
public class IncomeBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int month = Integer.parseInt(request.getParameter("month"));
            int year = Integer.parseInt(request.getParameter("year"));
            System.out.println("month"+month+", year"+year);

            double income = (double) BillFuntions.income(month,year);
            request.setAttribute("income",income);
            response.getWriter().println(income);
    }
}

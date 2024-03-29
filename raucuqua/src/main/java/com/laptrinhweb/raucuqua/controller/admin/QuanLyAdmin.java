package com.laptrinhweb.raucuqua.controller.admin;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuanLyAdmin", value = "/QuanLyAdmin")
public class QuanLyAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserAccount ua = (UserAccount) request.getSession().getAttribute("auth");
        if (ua==null || ua.getRole()!=1) {
            response.getWriter().println("Usẻ này k phải admin");
            return;
        }
            List<UserAccount> accounts = AdminDao.listAccount();
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("/adminPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

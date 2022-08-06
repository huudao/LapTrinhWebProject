package com.laptrinhweb.raucuqua.controller;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.ChangePassword;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "ChangePasswordController", value = "/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("password");
        String sOldPass = request.getParameter("OldPassword");

        if(sOldPass.equals(s)) {
            response.getWriter().println(false);
            return;
        }

        HttpSession session = request.getSession(false);
        if(session.getAttribute("auth")==null){
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        boolean state= false;
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        System.out.println("in do post s: "+s+", iduser = "+ua.getId_user()+", username = "+ua.getUser_name());
        state = ChangePassword.changePassById(ua.getId_user(),sOldPass,s);
        response.getWriter().println(state);
    }
}

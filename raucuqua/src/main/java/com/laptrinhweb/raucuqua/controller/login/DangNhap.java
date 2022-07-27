package com.laptrinhweb.raucuqua.controller.login;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DangNhap", value = "/DangNhap")
public class DangNhap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        UserAccount ua =  Login.login(username,pass);
        if(ua==null){
            String error = "sai thông tin đăng nhập."

                    ;request.setAttribute("error",error);request.getRequestDispatcher("dangNhap.jsp").forward(request,response);
            return;
        }
        request.setAttribute("userInfor",ua);
        HttpSession s = request.getSession();
        s.setAttribute("auth",ua);
        String x = (String) s.getAttribute("previousPage");
        if(x==null){
            x = "TrangChu";
        }else{
            x = x.substring(1,x.length());
        }
        response.sendRedirect(x);
    }
}


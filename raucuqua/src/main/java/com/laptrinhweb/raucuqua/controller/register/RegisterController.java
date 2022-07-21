package com.laptrinhweb.raucuqua.controller.register;

import com.laptrinhweb.raucuqua.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String pass = request.getParameter("pass");
        String email  =request.getParameter("email");
        boolean c = UserServices.getInstance().register(username,email,pass);
        if(!c){
            String notify = "Đăng ký thất bại";
            request.setAttribute("notify",notify);
            request.getRequestDispatcher("dangKy.jsp").forward(request,response);
        }
        else {
            response.sendRedirect("dangNhap.jsp");
        }
    }
}

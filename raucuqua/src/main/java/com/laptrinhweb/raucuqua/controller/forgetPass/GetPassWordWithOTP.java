package com.laptrinhweb.raucuqua.controller.forgetPass;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetPassWordWithOTP", value = "/GetPassWordWithOTP")
public class GetPassWordWithOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestotp =  Integer.parseInt(request.getParameter("otp"));
        System.out.println("OSHJFOJESF "+request.getSession().getAttribute("otp"));
        int firstOtp = (Integer)request.getSession().getAttribute("otp");
        if(requestotp==firstOtp){
            request.getRequestDispatcher("doiMatKhau.jsp").forward(request,response);
            return;
        }
        response.getOutputStream().println("<h1>wrong otp, can't change password</h1>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

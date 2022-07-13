package com.laptrinhweb.raucuqua.controller.forgetPass;

import com.laptrinhweb.raucuqua.dao.ChangePassword;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangePasswordWithEmail", value = "/ChangePasswordWithEmail")
public class ChangePasswordWithEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        try{
            System.out.println("error here");
            int otp = Integer.parseInt(session.getAttribute("otp").toString());
            System.out.println("note here here");

            int otpSend = Integer.parseInt(request.getParameter("otp"));
            System.out.println("note here here aaaa");
            System.out.println(otp+", otp send: "+otpSend);
            if(otp!=otpSend){
                throw new Exception();
            }
        }catch (Exception e){
            response.getOutputStream().println("<h1 style='color:red'>WRONG DATA 1</h1>");
            return;
        }
        String email = request.getParameter("email");
        String newPass = request.getParameter("newPassword");
        boolean check = ChangePassword.changePassByEmail(email,newPass);
        if(check != true){
            response.getOutputStream().println("<h1 style='color:red'>WRONG DATA 2</h1>");
            return;
        }

        String line = "<script>window.setTimeout(function(){window.location.href = \"dangNhap.jsp\";}, 4000);</script>";
        response.getWriter().println();
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html><head>");
        out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
        out.println("<title>notice</title></head>");
        out.println("<body>");
        out.println("<h1>mật khẩu của bạn đã được đổi <span style='color:green'>Thành công !</span></h1>"+line);
        out.println("<h3>bạn sẽ được chuyển đến trang đăng nhập sau 3s nữa.</h3>"+line);

        // Echo client's request information
        // Generate a random number upon each request
        out.println("</body>");
        out.println("</html>");
    }
}

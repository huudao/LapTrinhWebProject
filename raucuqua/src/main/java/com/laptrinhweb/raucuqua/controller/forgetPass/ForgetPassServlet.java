package com.laptrinhweb.raucuqua.controller.forgetPass;

import com.laptrinhweb.raucuqua.dao.Util;
import com.laptrinhweb.raucuqua.services.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ForgetPassServlet", value = "/ForgetPassServlet")
public class ForgetPassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        boolean checkExistMail = Util.checkExistMail(email);
        String getUserByMail = Util.getUserByMail(email);
        System.out.println("mail "+email);
        if(checkExistMail==false){
//            request.setAttribute("err",new String("email không tồn tại"));
            request.setAttribute("isErr",-1);
            request.getRequestDispatcher("quenMatKhau.jsp").forward(request,response);
            return;
        }

        int otp = generateRandomNumber(email);
        request.getSession().setAttribute("otp",otp);
        System.out.println("OSHJFOJESF "+request.getSession().getAttribute("otp"));
        String h = request.getServletPath()+", "+request.getContextPath()+", "+request.getServletContext()+", "+request.getServerName()+". "+request.getServerPort()+", "+request.getPathInfo();
        String path = request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/GetPassWordWithOTP?email="+email+"&otp="+otp+"&user_name="+getUserByMail;
        System.out.println("hhh"+h);
        System.out.println(path);
        String content = "link: "+path;
        MailService.sendMail(email,"xác nhận lấy mật khẩu từ trang raucuqua",content);
        request.setAttribute("isErr",1);
//        request.setAttribute("err",new String("email đã được gửi đi"));
        request.getRequestDispatcher("quenMatKhau.jsp").forward(request,response);
    }

    private int generateRandomNumber(String email){
        Random rand = new Random();
        return rand.nextInt(123456);
    }
}

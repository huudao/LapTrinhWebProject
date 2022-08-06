package com.laptrinhweb.raucuqua.controller.payment;

import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.beans.UserAddress;
import com.laptrinhweb.raucuqua.dao.CartFuntions;
import com.laptrinhweb.raucuqua.dao.Payment;
import com.laptrinhweb.raucuqua.services.MailService;
import com.laptrinhweb.raucuqua.services.billPdfCreator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@WebServlet(name = "DatHang", value = "/DatHang")
public class DatHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username= request.getParameter("firstname");
        String phone_number = request.getParameter("my_phone_number");
        String city_province = request.getParameter("city_province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String house_address = request.getParameter("house_address");
        String extra_infor = request.getParameter("extra-infor");
        double totalMoneyWithFee = Double.parseDouble(request.getParameter("totalMoneyWithFee"));
        UserAddress ua = new UserAddress();
        ua.setUser_name(username
        );
        ua.setPhone_number(phone_number);
        ua.setCity_province(city_province);
        ua.setDistrict(district);
        ua.setWard(ward);ua.setHouse_address(house_address);
        String line = ua.convertAddressToString();
        HttpSession s = request.getSession();
        UserAccount xx = (UserAccount) s.getAttribute("auth");
        String x = xx.getId_user();
        List<Cart> products = CartFuntions.watch(x);
        double ship_fee = 1000;
        String id_bill = Payment.payment(x,line,"chưa thanh toán",totalMoneyWithFee,phone_number,2000,"chưa giao hàng","offline",products);
//Getting the current date value
        LocalDate currentdate = LocalDate.now();
        System.out.println("Current date: "+currentdate);
        //Getting the current day
        int currentDay = currentdate.getDayOfMonth();
        System.out.println("Current day: "+currentDay);
        //Getting the current month
        Month currentMonth = currentdate.getMonth();
        System.out.println("Current month: "+currentMonth.getValue());
        //getting the current year
        int currentYear = currentdate.getYear();
        System.out.println("Current month: "+currentYear);
        String file = billPdfCreator.exportBill(id_bill,currentYear,currentMonth.toString(),currentDay,ua.getUser_name(),"chưa thanh toán","offline",ship_fee,phone_number,house_address,xx.getEmail(),products);
        MailService.sendMail(xx.getEmail(),"bill thanh toan hoa don","đây là bill thanh toán hóa đơn",true,file);
        response.sendRedirect("ListBill");
    }
}

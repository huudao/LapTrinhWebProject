package com.laptrinhweb.raucuqua.controller.accountInfor;

import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListBill", value = "/ListBill")
public class ListBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        List<Bill> bills = Search.bills(ua.getId_user());
        request.setAttribute("bills",bills);
        request.getRequestDispatcher("thongTinTaiKhoan/donHangCuaBan.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

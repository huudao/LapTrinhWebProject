package com.laptrinhweb.raucuqua.controller.accountInfor;

import com.laptrinhweb.raucuqua.beans.Bill;
import com.laptrinhweb.raucuqua.beans.BoughtProduct;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailBill", value = "/DetailBill")
public class DetailBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_bill = request.getParameter("id_bill");
        Bill b = Search.billById(id_bill);
        List<BoughtProduct> boughtProducts = Search.boughtProductsByidBill(id_bill);
        request.setAttribute("bill",b);
        request.setAttribute("boughtProducts",boughtProducts);
        request.getRequestDispatcher("thongTinTaiKhoan/ChiTietDonHang.jsp").forward(request,response);
    }
}

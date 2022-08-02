package com.laptrinhweb.raucuqua.controller.productClassification;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Comment_vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddCommentProduct", value = "/AddCommentProduct")
public class AddCommentProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id_product = request.getParameter("id_product");
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage","/ChiTietSanPham?id_product="+id_product );
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        int numStar = Integer.parseInt(request.getParameter("numStar"));
        String comment = request.getParameter("comment");
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String id_user = ua.getId_user();
        Comment_vote.insert_comment_product(id_product,"null",id_user,numStar,comment);
        response.sendRedirect("ChiTietSanPham?id_product="+id_product);
    }
}

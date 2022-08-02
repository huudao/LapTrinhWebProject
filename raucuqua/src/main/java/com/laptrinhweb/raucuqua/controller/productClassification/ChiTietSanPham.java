package com.laptrinhweb.raucuqua.controller.productClassification;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.ProductFunction;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChiTietSanPham", value = "/ChiTietSanPham")
public class ChiTietSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("run to chi tiet san pham,id: "+request.getParameter("id_product"));
        Product p = Search.searchProductById(request.getParameter("id_product"));
        p.loadComment();
        request.setAttribute("product",p);
        //set set number attributes
        request.setAttribute("numberstarsArray", ProductFunction.returnNumberStar(p.getRawCommentProducts()));
        //relate products:
        request.setAttribute("relateProducts",ProductFunction.searchProductByTypeAndQuantity(p.getProduct_type(),5));
        request.getRequestDispatcher("chiTietSanPham.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

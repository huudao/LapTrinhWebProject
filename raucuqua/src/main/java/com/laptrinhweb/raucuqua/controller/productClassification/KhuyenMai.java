package com.laptrinhweb.raucuqua.controller.productClassification;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "KhuyenMai", value = "/KhuyenMai")
public class KhuyenMai extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductClassification.productForSale(10);
        for (Product p :
                products) {
            p.loadComment();
        }
        System.out.println("khuyen mai: "+products.size());
        request.setAttribute("productsForSale",products);
        request.getRequestDispatcher("khuyenMai.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

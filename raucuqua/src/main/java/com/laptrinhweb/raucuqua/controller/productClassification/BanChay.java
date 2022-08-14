package com.laptrinhweb.raucuqua.controller.productClassification;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.controller.lazyLoading.LazyLoadingProduct;
import com.laptrinhweb.raucuqua.dao.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "BanChay", value = "/BanChay")
public class BanChay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductClassification.productHot(1000);
        for (Product p :
                products) {
            p.loadComment();
        }
        Random rand = new Random();
        int seed = rand.nextInt();

        LazyLoadingProduct lazy = LazyLoadingProduct.getInstance();
        lazy.add(seed,products);

        request.setAttribute("seed",seed);
        int size = (products.size()>=10)?10:products.size();
        System.out.println("[SIZE]"+ products.subList(0,size));
        request.setAttribute("originNumberProduct",size);
        request.setAttribute("productHot",products.subList(0,size));

        request.getRequestDispatcher("banChay.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

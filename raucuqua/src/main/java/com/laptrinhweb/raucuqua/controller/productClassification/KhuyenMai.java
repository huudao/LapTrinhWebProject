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

@WebServlet(name = "KhuyenMai", value = "/KhuyenMai")
public class KhuyenMai extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductClassification.productForSale(10);
        for (Product p :
                products) {
            p.loadComment();
        }
        Random rand = new Random();
        int seed = rand.nextInt();

        LazyLoadingProduct lazy = LazyLoadingProduct.getInstance();
        lazy.add(seed,products);

        request.setAttribute("seed",seed);
        System.out.println("[SIZE]"+ products.subList(0,10));
        request.setAttribute("productsForSale",products.subList(0,10));
        request.setAttribute("originNumberProduct",10);
        System.out.println("khuyen mai: "+products.size());
        request.getRequestDispatcher("khuyenMai.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

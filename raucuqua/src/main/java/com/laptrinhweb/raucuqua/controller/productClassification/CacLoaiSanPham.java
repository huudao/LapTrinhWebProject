package com.laptrinhweb.raucuqua.controller.productClassification;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.controller.lazyLoading.LazyLoadingProduct;
import com.laptrinhweb.raucuqua.dao.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "CacLoaiSanPham", value = "/CacLoaiSanPham")
public class CacLoaiSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Product> productsHot;
        List<Product> productsKhuyenMai;

        int limit = 10;
        if(type.equals("traicay")){
            productsHot = ProductClassification.productTypeTraiCayHot(1000);
            productsKhuyenMai = ProductClassification.productTypeTraiCayKhuyenMai(limit);
        }
        else{
            productsKhuyenMai = ProductClassification.productTypeRauCuKhuyenMai(limit);
            productsHot = ProductClassification.productTypeRauCuHot(1000);

        }
//        for (Product p :
//                productsHot) {
//            p.loadComment();
//        }
//        for (Product p :
//                productsKhuyenMai) {
//            p.loadComment();
//        }
        Random rand = new Random();
        int seed = rand.nextInt();

        LazyLoadingProduct lazy = LazyLoadingProduct.getInstance();
        lazy.add(seed,productsHot);

        request.setAttribute("seed",seed);
        System.out.println("[SIZE]"+ productsKhuyenMai.subList(0,(productsKhuyenMai.size()>=10)?10:productsKhuyenMai.size()));
        request.setAttribute("originNumberProduct",(productsKhuyenMai.size()>=10)?10:productsKhuyenMai.size());
        request.setAttribute("productsHot",productsHot.subList(0,(productsHot.size()>=10)?10:productsHot.size()));
        request.setAttribute("productsKhuyenMai",productsKhuyenMai.subList(0,(productsKhuyenMai.size()>=10)?10:productsKhuyenMai.size()));
        request.setAttribute("type",type);
        System.out.println("[HOT] "+productsHot.size());
        System.out.println("[KHUYEN MAI] "+productsKhuyenMai.size());

        request.getRequestDispatcher("cacLoaiSanPham.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

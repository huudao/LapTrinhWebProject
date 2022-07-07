package com.laptrinhweb.raucuqua.controller;

import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChu", value = "/TrangChu")
public class TrangChu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get hot products( <=4) resize if >4)
        //get discount products(8 products)
        //pick discount products with number bought most.
        List<Product> hotRawProducts = ProductClassification.productHot(4);
        List<Product> discountRawProducts = ProductClassification.productForSale(4);
        discountRawProducts.sort((o1, o2) -> -Integer.compare(o1.getPercent_discount(),o2.getPercent_discount()));
        int hotProductSize = 4;
        int discountProduct = 8;
        List<Product> hotProducts = (hotRawProducts.size()<hotProductSize)?hotRawProducts:hotRawProducts.subList(0,hotProductSize);
        for (Product p :hotProducts
        ) {
            p.loadComment();
        }
        List<Product> discountProducts = (discountRawProducts.size()<discountProduct)?discountRawProducts:discountRawProducts.subList(0,discountProduct);
        System.out.printf("hot raw product size, %d, hot product: %d",hotRawProducts.size(),hotProducts.size());
//        request.setAttribute("javax",new String("this is test get Data javax"));
        request.setAttribute("hotProducts",hotProducts);
        request.setAttribute("discountProducts",discountProducts);
        if(discountProducts.size()!=0)
            request.setAttribute("firstProduct",discountProducts.get(0));
        else
            request.setAttribute("firstProduct",null);

        request.getRequestDispatcher("trangchu.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

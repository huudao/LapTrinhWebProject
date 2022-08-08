package com.laptrinhweb.raucuqua.controller.lazyLoading;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetNextDataJsonProduct", value = "/GetNextDataJsonProduct")
public class GetNextDataJsonProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int seed  = Integer.parseInt(request.getParameter("seed"));
        int origin = Integer.parseInt(request.getParameter("origin"));
        int next = Integer.parseInt(request.getParameter("next"));
        try {
            List<Product> p = LazyLoadingProduct.getInstance().getList(seed);
            List<Product> psub = p.subList(origin, next);
            String gson = new Gson().toJson(psub);
            response.getWriter().println(gson);
        }catch (Exception e){
            response.getWriter().println("end product.");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

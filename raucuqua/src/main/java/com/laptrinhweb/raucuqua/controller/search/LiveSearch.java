package com.laptrinhweb.raucuqua.controller.search;

import com.google.gson.Gson;
import com.laptrinhweb.raucuqua.beans.Product;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LiveSearch", value = "/LiveSearch")
public class LiveSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String s = request.getParameter("q");
        List<Product> products = Search.searchByName(s);
        String gson = new Gson().toJson(products);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

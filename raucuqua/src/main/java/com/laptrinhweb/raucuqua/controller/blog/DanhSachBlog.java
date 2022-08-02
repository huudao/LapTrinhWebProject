package com.laptrinhweb.raucuqua.controller.blog;

import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DanhSachBlog", value = "/DanhSachBlog")
public class DanhSachBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> blogs = Search.searchBlogByNumber(10);
        for (Blog b : blogs
        ) {
            b.loadComment();
        }
        request.setAttribute("blogs", blogs);
        request.getRequestDispatcher("danhSachBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

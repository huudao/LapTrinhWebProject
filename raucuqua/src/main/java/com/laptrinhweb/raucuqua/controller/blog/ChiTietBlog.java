package com.laptrinhweb.raucuqua.controller.blog;

import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.dao.BlogFunction;
import com.laptrinhweb.raucuqua.dao.Search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ChiTietBlog", value = "/ChiTietBlog")
public class ChiTietBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Blog blog = BlogFunction.searchBlogById(request.getParameter("id_blog"));
        blog.loadComment();
        BlogFunction.arrangeToDataAndItsChildren_fixBugOnly(blog.getCommentRootBlogs());

        List<Blog> relateBlogs = Search.searchBlogByNumber(10);
        for (Blog b : relateBlogs) {
            b.loadComment();
        }
        request.setAttribute("blog", blog);
        request.setAttribute("relateBlogs", relateBlogs);
        List<Integer> numberCommentsWithRelateBlogs = new ArrayList<>(relateBlogs.size());
        for (int i = 0; i < relateBlogs.size(); i++) {
            numberCommentsWithRelateBlogs.add(relateBlogs.get(i).getNumberComment());
        }
        request.setAttribute("numberCommentsWithRelateBlogs", numberCommentsWithRelateBlogs);

        request.getRequestDispatcher("chiTietBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

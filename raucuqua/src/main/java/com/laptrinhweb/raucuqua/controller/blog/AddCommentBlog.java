package com.laptrinhweb.raucuqua.controller.blog;

import com.laptrinhweb.raucuqua.beans.UserAccount;
import com.laptrinhweb.raucuqua.dao.Comment_vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddCommentBlog", value = "/AddCommentBlog")
public class AddCommentBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id_blog = request.getParameter("id_blog");
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage","/ChiTietBlog?id_blog="+id_blog );
            response.sendRedirect("dangNhap.jsp");
            return;
        }
//        int numStar = Integer.parseInt(request.getParameter("numStar"));
//        String comment = request.getParameter("comment");
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String father_id_blog = request.getParameter("father_id_blog");
        String comment_content = request.getParameter("message");
        String id_user = ua.getUser_name();
        Comment_vote.insert_comment_blog(id_blog, father_id_blog,id_user,comment_content);
        response.sendRedirect("ChiTietBlog?id_blog="+id_blog);
    }
}

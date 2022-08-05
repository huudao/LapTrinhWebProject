package com.laptrinhweb.raucuqua.controller;

import com.laptrinhweb.raucuqua.dao.Contact;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LienHe", value = "/LienHe")
public class LienHe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String mess = request.getParameter("mes");
        Contact.addContact(email,name,phone,mess);
        String line = "<script>window.setTimeout(function(){window.location.href = \"TrangChu\";}, 1000);</script>";
        response.getWriter().println();
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html><head>");
        out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
        out.println("<title>notice</title></head>");
        out.println("<body>");
        out.println("<h1>thông tin của bạn đã được ghi lại </h1>"+line);
        // Echo client's request information
        // Generate a random number upon each request
        out.println("</body>");
        out.println("</html>");
    }
}

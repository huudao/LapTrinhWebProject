package com.laptrinhweb.raucuqua.controller.admin.contact;

import com.laptrinhweb.raucuqua.dao.AdminDao;
import com.laptrinhweb.raucuqua.services.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GuiMailPhanHoi", value = "/GuiMailPhanHoi")
public class GuiMailPhanHoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailTo = request.getParameter("emailTo");
        String titleEmail = request.getParameter("title-email");
        String contentEmail = request.getParameter("content");
        String idContact = request.getParameter("id-contact");

        MailService.sendMail(emailTo,titleEmail,contentEmail);
        AdminDao.updateCheckState(idContact);

//        request.setAttribute("page", "QuanLyFeedBack");
//        request.getRequestDispatcher("adminPage.jsp").forward(request,response);
        response.sendRedirect("QuanLyAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

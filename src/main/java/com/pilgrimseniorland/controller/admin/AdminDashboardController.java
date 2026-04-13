package com.pilgrimseniorland.controller.admin;

import com.pilgrimseniorland.service.ContactService;
import com.pilgrimseniorland.service.NoticeService;
import com.pilgrimseniorland.service.QnaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AdminDashboardController extends HttpServlet {

    private final NoticeService noticeService = new NoticeService();
    private final QnaService qnaService = new QnaService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setAttribute("recentNotices", noticeService.getNoticeListForAdmin(1, 5));
        req.setAttribute("recentQna", qnaService.getQnaList(1, 5));
        req.getRequestDispatcher("/WEB-INF/jsp/admin/dashboard.jsp").forward(req, res);
    }
}

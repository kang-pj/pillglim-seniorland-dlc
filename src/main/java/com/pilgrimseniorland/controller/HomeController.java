package com.pilgrimseniorland.controller;

import com.pilgrimseniorland.model.NoticeVO;
import com.pilgrimseniorland.service.NoticeService;
import com.pilgrimseniorland.util.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * 홈 페이지 (GET /)
 */
public class HomeController extends HttpServlet {

    private final NoticeService noticeService = new NoticeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int homeNoticeLimit = AppConfig.getInt("page.size.home.notice", 3);
        List<NoticeVO> recentNotices = noticeService.getRecentNotices(homeNoticeLimit);
        req.setAttribute("recentNotices", recentNotices);

        req.getRequestDispatcher("/WEB-INF/jsp/home/index.jsp").forward(req, res);
    }
}

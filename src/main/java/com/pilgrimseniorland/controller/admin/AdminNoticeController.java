package com.pilgrimseniorland.controller.admin;

import com.pilgrimseniorland.model.NoticeVO;
import com.pilgrimseniorland.service.NoticeService;
import com.pilgrimseniorland.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class AdminNoticeController extends HttpServlet {

    private final NoticeService noticeService = new NoticeService();
    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uri = req.getRequestURI().substring(req.getContextPath().length());

        if (uri.equals("/admin/notice/write")) {
            req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/write.jsp").forward(req, res);
        } else if (uri.equals("/admin/notice/edit")) {
            int id = parseId(req.getParameter("id"));
            NoticeVO notice = noticeService.getNoticeDetail(id);
            if (notice == null) { res.sendError(404); return; }
            req.setAttribute("notice", notice);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/edit.jsp").forward(req, res);
        } else if (uri.equals("/admin/notice/delete")) {
            int id = parseId(req.getParameter("id"));
            noticeService.deleteNotice(id);
            res.sendRedirect(req.getContextPath() + "/admin/notice");
        } else {
            // 목록
            int page = parsePage(req.getParameter("page"));
            List<NoticeVO> notices = noticeService.getNoticeListForAdmin(page, PAGE_SIZE);
            req.setAttribute("notices", notices);
            req.setAttribute("currentPage", page);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/list.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uri = req.getRequestURI().substring(req.getContextPath().length());

        String title = ValidationUtil.sanitizeInput(req.getParameter("title"));
        String content = req.getParameter("content"); // 관리자 입력은 sanitize 생략 가능
        boolean published = "on".equals(req.getParameter("published"));

        if (!ValidationUtil.isNotBlank(title) || !ValidationUtil.isNotBlank(content)) {
            req.setAttribute("errorMessage", "제목과 내용을 입력해 주세요.");
            req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/write.jsp").forward(req, res);
            return;
        }

        NoticeVO notice = new NoticeVO();
        notice.setTitle(title);
        notice.setContent(content);
        notice.setPublished(published);
        notice.setAuthor("관리자");

        if (uri.equals("/admin/notice/edit")) {
            notice.setId(parseId(req.getParameter("id")));
            noticeService.updateNotice(notice);
        } else {
            noticeService.createNotice(notice);
        }

        res.sendRedirect(req.getContextPath() + "/admin/notice");
    }

    private int parsePage(String p) { try { int v = Integer.parseInt(p); return v > 0 ? v : 1; } catch (Exception e) { return 1; } }
    private int parseId(String p) { try { return Integer.parseInt(p); } catch (Exception e) { return 0; } }
}

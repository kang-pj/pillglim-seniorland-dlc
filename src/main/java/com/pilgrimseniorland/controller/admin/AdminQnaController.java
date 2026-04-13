package com.pilgrimseniorland.controller.admin;

import com.pilgrimseniorland.model.QnaVO;
import com.pilgrimseniorland.service.QnaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class AdminQnaController extends HttpServlet {

    private final QnaService qnaService = new QnaService();
    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uri = req.getRequestURI().substring(req.getContextPath().length());

        if (uri.equals("/admin/qna/answer")) {
            int id = parseId(req.getParameter("id"));
            QnaVO qna = qnaService.getQnaDetail(id);
            if (qna == null) { res.sendError(404); return; }
            req.setAttribute("qna", qna);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/qna/answer.jsp").forward(req, res);
        } else {
            int page = parsePage(req.getParameter("page"));
            List<QnaVO> qnaList = qnaService.getQnaList(page, PAGE_SIZE);
            int totalPages = qnaService.getTotalPages(PAGE_SIZE);
            req.setAttribute("qnaList", qnaList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/qna/list.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = parseId(req.getParameter("id"));
        String answer = req.getParameter("answer");

        if (answer == null || answer.isBlank()) {
            res.sendRedirect(req.getContextPath() + "/admin/qna/answer?id=" + id + "&error=empty");
            return;
        }

        qnaService.answerQna(id, answer);
        res.sendRedirect(req.getContextPath() + "/admin/qna");
    }

    private int parsePage(String p) { try { int v = Integer.parseInt(p); return v > 0 ? v : 1; } catch (Exception e) { return 1; } }
    private int parseId(String p) { try { return Integer.parseInt(p); } catch (Exception e) { return 0; } }
}

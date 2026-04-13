package com.pilgrimseniorland.controller;

import com.pilgrimseniorland.model.NoticeVO;
import com.pilgrimseniorland.model.QnaVO;
import com.pilgrimseniorland.service.NoticeService;
import com.pilgrimseniorland.service.QnaService;
import com.pilgrimseniorland.util.AppConfig;
import com.pilgrimseniorland.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.List;

/**
 * 고객센터 Controller
 * /support/notice, /support/qna 처리
 */
public class SupportController extends HttpServlet {

    private final NoticeService noticeService = new NoticeService();
    private final QnaService qnaService = new QnaService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String contextPath = req.getContextPath();
        String uri = req.getRequestURI().substring(contextPath.length());

        if (uri.startsWith("/support/notice")) {
            handleNotice(req, res, uri);
        } else if (uri.startsWith("/support/qna")) {
            handleQna(req, res, uri);
        } else {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String contextPath = req.getContextPath();
        String uri = req.getRequestURI().substring(contextPath.length());

        if (uri.equals("/support/qna/write")) {
            handleQnaWrite(req, res);
        } else {
            res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    // ── 공지사항 ──────────────────────────────────────────

    private void handleNotice(HttpServletRequest req, HttpServletResponse res, String uri)
            throws ServletException, IOException {

        int pageSize = AppConfig.getInt("page.size.default", 10);

        if (uri.equals("/support/notice/detail")) {
            // 상세
            int id = parseId(req.getParameter("id"));
            NoticeVO notice = noticeService.getNoticeDetail(id);
            if (notice == null) { res.sendError(404); return; }
            req.setAttribute("notice", notice);
            req.getRequestDispatcher("/WEB-INF/jsp/support/notice-detail.jsp").forward(req, res);
        } else {
            // 목록
            int page = parsePage(req.getParameter("page"));
            List<NoticeVO> notices = noticeService.getNoticeList(page, pageSize);
            int totalPages = noticeService.getTotalPages(pageSize);
            req.setAttribute("notices", notices);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("/WEB-INF/jsp/support/notice-list.jsp").forward(req, res);
        }
    }

    // ── Q&A ──────────────────────────────────────────────

    private void handleQna(HttpServletRequest req, HttpServletResponse res, String uri)
            throws ServletException, IOException {

        int pageSize = AppConfig.getInt("page.size.default", 10);

        if (uri.equals("/support/qna/detail")) {
            int id = parseId(req.getParameter("id"));
            QnaVO qna = qnaService.getQnaDetail(id);
            if (qna == null) { res.sendError(404); return; }

            // 비밀글 처리
            if (qna.isSecret()) {
                String inputPw = req.getParameter("pw");
                boolean isAdmin = req.getSession(false) != null &&
                                  req.getSession(false).getAttribute("admin") != null;
                if (!isAdmin && (inputPw == null || !qnaService.verifyPassword(qna, inputPw))) {
                    req.setAttribute("qnaId", id);
                    req.setAttribute("needPassword", true);
                    req.getRequestDispatcher("/WEB-INF/jsp/support/qna-detail.jsp").forward(req, res);
                    return;
                }
            }
            req.setAttribute("qna", qna);
            req.getRequestDispatcher("/WEB-INF/jsp/support/qna-detail.jsp").forward(req, res);

        } else if (uri.equals("/support/qna/write")) {
            req.getRequestDispatcher("/WEB-INF/jsp/support/qna-write.jsp").forward(req, res);

        } else {
            // 목록
            int page = parsePage(req.getParameter("page"));
            List<QnaVO> qnaList = qnaService.getQnaList(page, pageSize);
            int totalPages = qnaService.getTotalPages(pageSize);
            req.setAttribute("qnaList", qnaList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("/WEB-INF/jsp/support/qna-list.jsp").forward(req, res);
        }
    }

    private void handleQnaWrite(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String question = ValidationUtil.sanitizeInput(req.getParameter("question"));
        String nickname = ValidationUtil.sanitizeInput(req.getParameter("nickname"));
        boolean isSecret = "on".equals(req.getParameter("secret"));
        String password = req.getParameter("password");

        // 서버 사이드 검증
        if (!ValidationUtil.isNotBlank(question) || !ValidationUtil.isValidLength(question, 1000)) {
            res.sendRedirect(req.getContextPath() + "/support/qna/write?error=invalid");
            return;
        }
        if (isSecret && !ValidationUtil.isNotBlank(password)) {
            res.sendRedirect(req.getContextPath() + "/support/qna/write?error=needpw");
            return;
        }

        QnaVO qna = new QnaVO();
        qna.setQuestion(question);
        qna.setNickname(nickname.isBlank() ? "익명" : nickname);
        qna.setSecret(isSecret);
        qna.setPassword(isSecret ? password : null);

        qnaService.createQna(qna);
        res.sendRedirect(req.getContextPath() + "/support/qna");
    }

    private int parsePage(String param) {
        try { int p = Integer.parseInt(param); return p > 0 ? p : 1; }
        catch (Exception e) { return 1; }
    }

    private int parseId(String param) {
        try { return Integer.parseInt(param); }
        catch (Exception e) { return 0; }
    }
}

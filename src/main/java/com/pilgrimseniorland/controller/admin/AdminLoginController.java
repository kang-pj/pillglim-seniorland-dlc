package com.pilgrimseniorland.controller.admin;

import com.pilgrimseniorland.model.AdminVO;
import com.pilgrimseniorland.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminLoginController extends HttpServlet {

    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uri = req.getRequestURI().substring(req.getContextPath().length());

        if (uri.equals("/admin/logout")) {
            HttpSession session = req.getSession(false);
            if (session != null) session.invalidate();
            res.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        // 이미 로그인된 경우 대시보드로
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            res.sendRedirect(req.getContextPath() + "/admin/dashboard");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminVO admin = adminService.authenticate(username, password);
        if (admin != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("admin", admin);
            res.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            req.setAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(req, res);
        }
    }
}

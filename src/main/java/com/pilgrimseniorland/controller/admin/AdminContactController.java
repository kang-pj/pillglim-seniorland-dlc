package com.pilgrimseniorland.controller.admin;

import com.pilgrimseniorland.dao.ContactDao;
import com.pilgrimseniorland.model.ContactVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class AdminContactController extends HttpServlet {

    private final ContactDao contactDao = new ContactDao();
    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int page = parsePage(req.getParameter("page"));
        int offset = (page - 1) * PAGE_SIZE;
        List<ContactVO> contacts = contactDao.findAll(offset, PAGE_SIZE);
        int total = contactDao.countAll();
        int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);

        req.setAttribute("contacts", contacts);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/contact/list.jsp").forward(req, res);
    }

    private int parsePage(String p) { try { int v = Integer.parseInt(p); return v > 0 ? v : 1; } catch (Exception e) { return 1; } }
}

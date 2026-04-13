package com.pilgrimseniorland.controller;

import com.pilgrimseniorland.model.ContactVO;
import com.pilgrimseniorland.service.ContactService;
import com.pilgrimseniorland.util.AppConfig;
import com.pilgrimseniorland.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;

/**
 * 온라인 문의 Controller (GET/POST /support/contact)
 */
public class ContactController extends HttpServlet {

    private final ContactService contactService = new ContactService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // CSRF 토큰 생성 및 세션 저장
        String csrfToken = UUID.randomUUID().toString();
        req.getSession().setAttribute("csrfToken", csrfToken);
        req.setAttribute("csrfToken", csrfToken);
        req.setAttribute("recaptchaSiteKey", AppConfig.get("recaptcha.site.key"));

        req.getRequestDispatcher("/WEB-INF/jsp/support/contact.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // CSRF 토큰 검증
        String sessionToken = (String) req.getSession().getAttribute("csrfToken");
        String requestToken = req.getParameter("csrfToken");
        if (sessionToken == null || !sessionToken.equals(requestToken)) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "잘못된 요청입니다.");
            return;
        }
        req.getSession().removeAttribute("csrfToken");

        // 입력값 추출 및 sanitize
        String name = ValidationUtil.sanitizeInput(req.getParameter("name"));
        String phone = ValidationUtil.sanitizeInput(req.getParameter("phone"));
        String message = ValidationUtil.sanitizeInput(req.getParameter("message"));
        String recaptchaToken = req.getParameter("g-recaptcha-response");

        // 서버 사이드 검증
        if (!ValidationUtil.isNotBlank(name) || !ValidationUtil.isValidLength(name, 50)) {
            forwardWithError(req, res, "이름을 올바르게 입력해 주세요.");
            return;
        }
        if (!ValidationUtil.isNotBlank(phone) || !ValidationUtil.isValidPhone(phone)) {
            forwardWithError(req, res, "연락처를 올바르게 입력해 주세요.");
            return;
        }
        if (!ValidationUtil.isNotBlank(message) || !ValidationUtil.isValidLength(message, 1000)) {
            forwardWithError(req, res, "문의 내용을 입력해 주세요. (최대 1000자)");
            return;
        }

        // 개인정보 동의 확인
        if (!"on".equals(req.getParameter("privacyAgree"))) {
            forwardWithError(req, res, "개인정보 수집 및 이용에 동의해 주세요.");
            return;
        }

        ContactVO contact = new ContactVO();
        contact.setName(name);
        contact.setPhone(phone);
        contact.setMessage(message);

        String remoteIp = getClientIp(req);
        boolean success = contactService.submitContact(contact, recaptchaToken, remoteIp);

        req.setAttribute("success", success);
        req.getRequestDispatcher("/WEB-INF/jsp/support/contact-result.jsp").forward(req, res);
    }

    private void forwardWithError(HttpServletRequest req, HttpServletResponse res, String errorMsg)
            throws ServletException, IOException {
        req.setAttribute("errorMessage", errorMsg);
        req.setAttribute("recaptchaSiteKey", AppConfig.get("recaptcha.site.key"));
        String csrfToken = UUID.randomUUID().toString();
        req.getSession().setAttribute("csrfToken", csrfToken);
        req.setAttribute("csrfToken", csrfToken);
        req.getRequestDispatcher("/WEB-INF/jsp/support/contact.jsp").forward(req, res);
    }

    private String getClientIp(HttpServletRequest req) {
        String ip = req.getHeader("X-Forwarded-For");
        if (ip == null || ip.isBlank()) ip = req.getRemoteAddr();
        return ip.split(",")[0].trim();
    }
}

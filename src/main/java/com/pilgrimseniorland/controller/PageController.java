package com.pilgrimseniorland.controller;

import com.pilgrimseniorland.util.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * 정적 콘텐츠 페이지 라우터
 * URI를 파싱하여 해당 JSP로 forward (URL에 .jsp 미노출)
 *
 * 예: GET /intro/greeting → /WEB-INF/jsp/intro/greeting.jsp
 * 예: GET /signature/floor → /WEB-INF/jsp/signature/floor.jsp
 */
public class PageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String contextPath = req.getContextPath();
        String uri = req.getRequestURI().substring(contextPath.length());

        // /privacy → /WEB-INF/jsp/privacy/privacy.jsp
        if (uri.equals("/privacy")) {
            req.getRequestDispatcher("/WEB-INF/jsp/privacy/privacy.jsp").forward(req, res);
            return;
        }

        // /intro/greeting → /WEB-INF/jsp/intro/greeting.jsp
        String jspPath = "/WEB-INF/jsp" + uri + ".jsp";

        // 구글맵 API 키 전달 (지도 페이지용)
        req.setAttribute("googleMapsApiKey", AppConfig.get("googlemaps.api.key"));
        req.setAttribute("siteLat", AppConfig.get("googlemaps.site.lat"));
        req.setAttribute("siteLng", AppConfig.get("googlemaps.site.lng"));
        req.setAttribute("siteName", AppConfig.get("googlemaps.site.name"));

        try {
            req.getRequestDispatcher(jspPath).forward(req, res);
        } catch (Exception e) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}

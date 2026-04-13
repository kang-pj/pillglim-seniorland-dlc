package com.pilgrimseniorland.filter;

import jakarta.servlet.*;
import java.io.IOException;

/**
 * 요청/응답 UTF-8 인코딩 필터
 */
public class EncodingFilter implements Filter {

    private String encoding = "UTF-8";

    @Override
    public void init(FilterConfig config) {
        String enc = config.getInitParameter("encoding");
        if (enc != null && !enc.isBlank()) {
            this.encoding = enc;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // 요청 인코딩만 설정 (응답은 JSP가 처리)
        request.setCharacterEncoding(encoding);
        
        chain.doFilter(request, response);
    }
}

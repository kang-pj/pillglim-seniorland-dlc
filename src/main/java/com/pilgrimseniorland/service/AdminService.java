package com.pilgrimseniorland.service;

import com.pilgrimseniorland.dao.AdminDao;
import com.pilgrimseniorland.model.AdminVO;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 관리자 인증 서비스
 */
public class AdminService {

    private static final Logger logger = LoggerFactory.getLogger(AdminService.class);
    private final AdminDao adminDao = new AdminDao();

    /**
     * 관리자 로그인 인증
     * @return 인증 성공 시 AdminVO, 실패 시 null
     */
    public AdminVO authenticate(String username, String password) {
        if (username == null || password == null) return null;

        AdminVO admin = adminDao.findByUsername(username.trim());
        if (admin == null) {
            logger.warn("존재하지 않는 관리자 계정: {}", username);
            return null;
        }

        if (!BCrypt.checkpw(password, admin.getPassword())) {
            logger.warn("관리자 비밀번호 불일치: {}", username);
            return null;
        }

        // 비밀번호 해시는 세션에 저장하지 않음
        admin.setPassword(null);
        logger.info("관리자 로그인 성공: {}", username);
        return admin;
    }
}

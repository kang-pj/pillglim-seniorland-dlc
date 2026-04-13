package com.pilgrimseniorland.service;

import com.pilgrimseniorland.dao.ContactDao;
import com.pilgrimseniorland.model.ContactVO;
import com.pilgrimseniorland.util.EmailUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 온라인 문의 처리 오케스트레이션
 * 흐름: reCAPTCHA 검증 → DB 저장 → 이메일 발송 (비차단)
 */
public class ContactService {

    private static final Logger logger = LoggerFactory.getLogger(ContactService.class);

    private final RecaptchaService recaptchaService = new RecaptchaService();
    private final ContactDao contactDao = new ContactDao();

    /**
     * 문의 제출 처리
     * @param contact 문의 데이터 (이미 sanitize 완료)
     * @param recaptchaToken reCAPTCHA 토큰
     * @param remoteIp 사용자 IP
     * @return 처리 성공 여부
     */
    public boolean submitContact(ContactVO contact, String recaptchaToken, String remoteIp) {
        // 1. reCAPTCHA 검증
        if (!recaptchaService.verify(recaptchaToken, remoteIp)) {
            logger.warn("reCAPTCHA 검증 실패 ip={}", remoteIp);
            return false;
        }

        // 2. IP 주소 기록
        contact.setIpAddress(remoteIp);

        // 3. DB 저장 (필수)
        contactDao.insert(contact);
        logger.info("문의 저장 완료: name={}", contact.getName());

        // 4. 이메일 발송 (비차단 - 실패해도 계속)
        try {
            EmailUtil.sendContactNotification(contact);
        } catch (Exception e) {
            logger.warn("이메일 발송 실패 (문의 저장은 완료됨): {}", e.getMessage());
        }

        return true;
    }
}

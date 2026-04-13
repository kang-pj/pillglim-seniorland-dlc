package com.pilgrimseniorland.util;

import com.pilgrimseniorland.model.ContactVO;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

/**
 * JavaMail 이메일 발송 유틸리티
 */
public class EmailUtil {

    private static final Logger logger = LoggerFactory.getLogger(EmailUtil.class);

    private EmailUtil() {}

    /**
     * 문의 접수 알림 이메일 발송
     * @return 발송 성공 여부
     */
    public static boolean sendContactNotification(ContactVO contact) {
        String recipient = AppConfig.get("mail.contact.recipient");
        if (recipient == null || recipient.isBlank()) {
            logger.warn("이메일 수신자 설정이 없습니다 (mail.contact.recipient)");
            return false;
        }

        try {
            Session session = createMailSession();
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(
                    AppConfig.get("mail.from"),
                    AppConfig.get("mail.from.name", "필그림시니어랜드"), "UTF-8"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject("[필그림시니어랜드] 온라인 문의가 접수되었습니다.", "UTF-8");

            String body = buildContactEmailBody(contact);
            message.setText(body, "UTF-8", "html");

            Transport.send(message);
            logger.info("문의 알림 이메일 발송 완료: {}", recipient);
            return true;
        } catch (Exception e) {
            logger.warn("이메일 발송 실패 (문의 저장은 완료됨): {}", e.getMessage());
            return false;
        }
    }

    private static Session createMailSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", AppConfig.get("mail.smtp.host"));
        props.put("mail.smtp.port", AppConfig.get("mail.smtp.port", "465"));
        props.put("mail.smtp.auth", "true");

        boolean ssl = AppConfig.getBoolean("mail.smtp.ssl", true);
        if (ssl) {
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        } else {
            props.put("mail.smtp.starttls.enable", "true");
        }

        final String username = AppConfig.get("mail.smtp.username");
        final String password = AppConfig.get("mail.smtp.password");

        return Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
    }

    private static String buildContactEmailBody(ContactVO contact) {
        return "<html><body style='font-family: sans-serif;'>" +
               "<h2>온라인 문의 접수</h2>" +
               "<table border='1' cellpadding='8' style='border-collapse:collapse;'>" +
               "<tr><th>이름</th><td>" + contact.getName() + "</td></tr>" +
               "<tr><th>연락처</th><td>" + contact.getPhone() + "</td></tr>" +
               "<tr><th>문의 내용</th><td>" + contact.getMessage().replace("\n", "<br>") + "</td></tr>" +
               "<tr><th>접수 시간</th><td>" + contact.getSubmittedAt() + "</td></tr>" +
               "</table></body></html>";
    }
}

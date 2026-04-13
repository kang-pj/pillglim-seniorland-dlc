package com.pilgrimseniorland.service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pilgrimseniorland.util.AppConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/**
 * Google reCAPTCHA v3 서버 사이드 검증
 */
public class RecaptchaService {

    private static final Logger logger = LoggerFactory.getLogger(RecaptchaService.class);

    /**
     * reCAPTCHA 토큰 검증
     * @param token 클라이언트에서 받은 토큰
     * @param remoteIp 사용자 IP
     * @return 검증 통과 여부 (score >= 설정값)
     */
    public boolean verify(String token, String remoteIp) {
        if (token == null || token.isBlank()) {
            logger.warn("reCAPTCHA 토큰이 없습니다.");
            return false;
        }

        String secretKey = AppConfig.get("recaptcha.secret.key");
        String verifyUrl = AppConfig.get("recaptcha.verify.url",
                "https://www.google.com/recaptcha/api/siteverify");
        double minScore = Double.parseDouble(AppConfig.get("recaptcha.min.score", "0.5"));

        try {
            URL url = new URL(verifyUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);

            String params = "secret=" + secretKey + "&response=" + token +
                            (remoteIp != null ? "&remoteip=" + remoteIp : "");

            try (OutputStream os = conn.getOutputStream()) {
                os.write(params.getBytes(StandardCharsets.UTF_8));
            }

            StringBuilder sb = new StringBuilder();
            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) sb.append(line);
            }

            JsonObject json = JsonParser.parseString(sb.toString()).getAsJsonObject();
            boolean success = json.get("success").getAsBoolean();
            double score = json.has("score") ? json.get("score").getAsDouble() : 0.0;

            logger.debug("reCAPTCHA 검증 결과: success={}, score={}", success, score);
            return success && score >= minScore;

        } catch (Exception e) {
            logger.error("reCAPTCHA 검증 중 오류 발생", e);
            return false;
        }
    }
}

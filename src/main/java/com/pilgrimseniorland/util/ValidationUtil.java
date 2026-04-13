package com.pilgrimseniorland.util;

import java.util.regex.Pattern;

/**
 * 입력값 검증 및 XSS 방지 유틸리티
 */
public class ValidationUtil {

    private static final Pattern PHONE_PATTERN =
            Pattern.compile("^(01[016789]|02|0[3-9][0-9])-?[0-9]{3,4}-?[0-9]{4}$");

    private ValidationUtil() {}

    /**
     * XSS 방지: HTML 특수문자 이스케이프
     */
    public static String sanitizeInput(String input) {
        if (input == null) return "";
        return input
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;")
                .replace("/", "&#x2F;");
    }

    /**
     * 한국 전화번호 형식 검증
     */
    public static boolean isValidPhone(String phone) {
        if (phone == null || phone.isBlank()) return false;
        // 하이픈 제거 후 검증
        String normalized = phone.replaceAll("-", "").replaceAll(" ", "");
        return PHONE_PATTERN.matcher(phone).matches() ||
               (normalized.matches("^(01[016789]|02|0[3-9][0-9])[0-9]{7,8}$"));
    }

    /**
     * 입력 길이 검증
     */
    public static boolean isValidLength(String input, int maxLength) {
        if (input == null) return true;
        return input.length() <= maxLength;
    }

    /**
     * 필수값 검증 (null 또는 공백 체크)
     */
    public static boolean isNotBlank(String input) {
        return input != null && !input.isBlank();
    }

    /**
     * 여러 필드 일괄 sanitize
     */
    public static String[] sanitizeAll(String... inputs) {
        String[] result = new String[inputs.length];
        for (int i = 0; i < inputs.length; i++) {
            result[i] = sanitizeInput(inputs[i]);
        }
        return result;
    }
}

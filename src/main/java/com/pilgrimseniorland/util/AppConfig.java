package com.pilgrimseniorland.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * application.properties 설정값 로드 및 제공
 */
public class AppConfig {

    private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);
    private static final Properties props = new Properties();
    private static volatile boolean initialized = false;

    private AppConfig() {}

    /** 앱 시작 시 1회 초기화 (AppInitListener에서 호출) */
    public static synchronized void init() {
        if (initialized) return;
        try (InputStream is = AppConfig.class.getClassLoader()
                .getResourceAsStream("application.properties")) {
            if (is == null) {
                throw new RuntimeException("application.properties 파일을 찾을 수 없습니다.");
            }
            props.load(is);
            initialized = true;
            logger.info("application.properties 로드 완료");
        } catch (IOException e) {
            throw new RuntimeException("설정 파일 로드 실패", e);
        }
    }

    /** 설정값 조회 */
    public static String get(String key) {
        return props.getProperty(key);
    }

    /** 설정값 조회 (기본값 포함) */
    public static String get(String key, String defaultValue) {
        return props.getProperty(key, defaultValue);
    }

    /** 정수형 설정값 조회 */
    public static int getInt(String key, int defaultValue) {
        String val = props.getProperty(key);
        if (val == null) return defaultValue;
        try {
            return Integer.parseInt(val.trim());
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    /** boolean 설정값 조회 */
    public static boolean getBoolean(String key, boolean defaultValue) {
        String val = props.getProperty(key);
        if (val == null) return defaultValue;
        return Boolean.parseBoolean(val.trim());
    }
}

package com.pilgrimseniorland.listener;

import com.pilgrimseniorland.util.AppConfig;
import com.pilgrimseniorland.util.DBConnectionPool;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 애플리케이션 시작/종료 시 초기화 처리
 */
public class AppInitListener implements ServletContextListener {

    private static final Logger logger = LoggerFactory.getLogger(AppInitListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("필그림시니어랜드 애플리케이션 시작");
        AppConfig.init();
        DBConnectionPool.init();
        logger.info("초기화 완료");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DBConnectionPool.destroy();
        logger.info("필그림시니어랜드 애플리케이션 종료");
    }
}

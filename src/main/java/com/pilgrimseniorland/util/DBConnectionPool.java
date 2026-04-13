package com.pilgrimseniorland.util;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * DBCP2 기반 DB 커넥션 풀 관리
 */
public class DBConnectionPool {

    private static final Logger logger = LoggerFactory.getLogger(DBConnectionPool.class);
    private static BasicDataSource dataSource;

    private DBConnectionPool() {}

    /** 앱 시작 시 초기화 (AppInitListener에서 호출) */
    public static synchronized void init() {
        if (dataSource != null) return;

        dataSource = new BasicDataSource();
        dataSource.setDriverClassName(AppConfig.get("db.driver"));
        dataSource.setUrl(AppConfig.get("db.url"));
        dataSource.setUsername(AppConfig.get("db.username"));
        dataSource.setPassword(AppConfig.get("db.password"));
        dataSource.setInitialSize(AppConfig.getInt("db.pool.initialSize", 5));
        dataSource.setMaxTotal(AppConfig.getInt("db.pool.maxTotal", 20));
        dataSource.setMaxIdle(AppConfig.getInt("db.pool.maxIdle", 10));
        dataSource.setMinIdle(AppConfig.getInt("db.pool.minIdle", 5));
        dataSource.setValidationQuery(AppConfig.get("db.pool.validationQuery", "SELECT 1"));
        dataSource.setTestOnBorrow(true);

        logger.info("DB 커넥션 풀 초기화 완료");
    }

    /** 커넥션 획득 */
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new IllegalStateException("DBConnectionPool이 초기화되지 않았습니다.");
        }
        return dataSource.getConnection();
    }

    /** 리소스 안전 반환 */
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        if (rs != null) { try { rs.close(); } catch (SQLException e) { logger.warn("ResultSet close 실패", e); } }
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { logger.warn("PreparedStatement close 실패", e); } }
        if (conn != null) { try { conn.close(); } catch (SQLException e) { logger.warn("Connection close 실패", e); } }
    }

    public static void close(Connection conn, PreparedStatement pstmt) {
        close(conn, pstmt, null);
    }

    /** 앱 종료 시 풀 해제 */
    public static void destroy() {
        if (dataSource != null) {
            try {
                dataSource.close();
                logger.info("DB 커넥션 풀 종료");
            } catch (SQLException e) {
                logger.error("DB 커넥션 풀 종료 실패", e);
            }
        }
    }
}

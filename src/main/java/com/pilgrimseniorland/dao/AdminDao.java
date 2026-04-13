package com.pilgrimseniorland.dao;

import com.pilgrimseniorland.model.AdminVO;
import com.pilgrimseniorland.util.DBConnectionPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;

public class AdminDao {

    private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);

    /** username으로 관리자 조회 */
    public AdminVO findByUsername(String username) {
        String sql = "SELECT id, username, password, created_at FROM admin WHERE username = ?";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                AdminVO vo = new AdminVO();
                vo.setId(rs.getInt("id"));
                vo.setUsername(rs.getString("username"));
                vo.setPassword(rs.getString("password"));
                Timestamp ts = rs.getTimestamp("created_at");
                if (ts != null) vo.setCreatedAt(ts.toLocalDateTime());
                return vo;
            }
        } catch (SQLException e) {
            logger.error("관리자 조회 실패 username={}", username, e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return null;
    }
}

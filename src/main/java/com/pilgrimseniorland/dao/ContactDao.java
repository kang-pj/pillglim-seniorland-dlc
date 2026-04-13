package com.pilgrimseniorland.dao;

import com.pilgrimseniorland.model.ContactVO;
import com.pilgrimseniorland.util.DBConnectionPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDao {

    private static final Logger logger = LoggerFactory.getLogger(ContactDao.class);

    /** 문의 저장 */
    public int insert(ContactVO contact) {
        String sql = "INSERT INTO contact (name, phone, message, ip_address) VALUES (?, ?, ?, ?)";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, contact.getName());
            pstmt.setString(2, contact.getPhone());
            pstmt.setString(3, contact.getMessage());
            pstmt.setString(4, contact.getIpAddress());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("문의 저장 실패", e);
            throw new RuntimeException("문의 저장 중 오류가 발생했습니다.", e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
    }

    /** 문의 목록 조회 (관리자) */
    public List<ContactVO> findAll(int offset, int limit) {
        String sql = "SELECT id, name, phone, message, ip_address, submitted_at " +
                     "FROM contact ORDER BY submitted_at DESC LIMIT ? OFFSET ?";
        List<ContactVO> list = new ArrayList<>();
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ContactVO vo = new ContactVO();
                vo.setId(rs.getInt("id"));
                vo.setName(rs.getString("name"));
                vo.setPhone(rs.getString("phone"));
                vo.setMessage(rs.getString("message"));
                vo.setIpAddress(rs.getString("ip_address"));
                Timestamp ts = rs.getTimestamp("submitted_at");
                if (ts != null) vo.setSubmittedAt(ts.toLocalDateTime());
                list.add(vo);
            }
        } catch (SQLException e) {
            logger.error("문의 목록 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return list;
    }

    /** 전체 문의 수 */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM contact";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            logger.error("문의 수 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return 0;
    }
}

package com.pilgrimseniorland.dao;

import com.pilgrimseniorland.model.NoticeVO;
import com.pilgrimseniorland.util.DBConnectionPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {

    private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);

    /** 최신 공지사항 N건 조회 (홈 페이지용) */
    public List<NoticeVO> findRecent(int limit) {
        String sql = "SELECT id, title, author, created_at FROM notice " +
                     "WHERE is_published = 1 ORDER BY created_at DESC LIMIT ?";
        List<NoticeVO> list = new ArrayList<>();
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            rs = pstmt.executeQuery();
            while (rs.next()) list.add(mapRow(rs, false));
        } catch (SQLException e) {
            logger.error("공지사항 최신 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return list;
    }

    /** 공지사항 목록 페이징 조회 */
    public List<NoticeVO> findAll(int offset, int limit) {
        String sql = "SELECT id, title, author, created_at FROM notice " +
                     "WHERE is_published = 1 ORDER BY created_at DESC LIMIT ? OFFSET ?";
        List<NoticeVO> list = new ArrayList<>();
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);
            rs = pstmt.executeQuery();
            while (rs.next()) list.add(mapRow(rs, false));
        } catch (SQLException e) {
            logger.error("공지사항 목록 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return list;
    }

    /** 공지사항 상세 조회 */
    public NoticeVO findById(int id) {
        String sql = "SELECT * FROM notice WHERE id = ? AND is_published = 1";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) return mapRow(rs, true);
        } catch (SQLException e) {
            logger.error("공지사항 상세 조회 실패 id={}", id, e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return null;
    }

    /** 전체 공지사항 수 (페이징용) */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM notice WHERE is_published = 1";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            logger.error("공지사항 수 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return 0;
    }

    /** 공지사항 등록 (관리자) */
    public int insert(NoticeVO notice) {
        String sql = "INSERT INTO notice (title, content, author, is_published) VALUES (?, ?, ?, ?)";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, notice.getTitle());
            pstmt.setString(2, notice.getContent());
            pstmt.setString(3, notice.getAuthor() != null ? notice.getAuthor() : "관리자");
            pstmt.setBoolean(4, notice.isPublished());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("공지사항 등록 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
        return 0;
    }

    /** 공지사항 수정 (관리자) */
    public int update(NoticeVO notice) {
        String sql = "UPDATE notice SET title=?, content=?, is_published=? WHERE id=?";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, notice.getTitle());
            pstmt.setString(2, notice.getContent());
            pstmt.setBoolean(3, notice.isPublished());
            pstmt.setInt(4, notice.getId());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("공지사항 수정 실패 id={}", notice.getId(), e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
        return 0;
    }

    /** 공지사항 삭제 (관리자) */
    public int delete(int id) {
        String sql = "DELETE FROM notice WHERE id = ?";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("공지사항 삭제 실패 id={}", id, e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
        return 0;
    }

    /** 관리자용 전체 목록 (비공개 포함) */
    public List<NoticeVO> findAllForAdmin(int offset, int limit) {
        String sql = "SELECT id, title, author, is_published, created_at FROM notice " +
                     "ORDER BY created_at DESC LIMIT ? OFFSET ?";
        List<NoticeVO> list = new ArrayList<>();
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);
            rs = pstmt.executeQuery();
            while (rs.next()) list.add(mapRow(rs, false));
        } catch (SQLException e) {
            logger.error("관리자 공지사항 목록 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return list;
    }

    private NoticeVO mapRow(ResultSet rs, boolean includeContent) throws SQLException {
        NoticeVO vo = new NoticeVO();
        vo.setId(rs.getInt("id"));
        vo.setTitle(rs.getString("title"));
        if (includeContent) vo.setContent(rs.getString("content"));
        try { vo.setAuthor(rs.getString("author")); } catch (SQLException ignored) {}
        try { vo.setPublished(rs.getBoolean("is_published")); } catch (SQLException ignored) {}
        Timestamp ts = rs.getTimestamp("created_at");
        if (ts != null) vo.setCreatedAt(ts.toLocalDateTime());
        return vo;
    }
}

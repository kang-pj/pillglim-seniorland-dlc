package com.pilgrimseniorland.dao;

import com.pilgrimseniorland.model.QnaVO;
import com.pilgrimseniorland.util.DBConnectionPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QnaDao {

    private static final Logger logger = LoggerFactory.getLogger(QnaDao.class);

    /** Q&A 목록 페이징 조회 */
    public List<QnaVO> findAll(int offset, int limit) {
        String sql = "SELECT id, nickname, is_answered, is_secret, created_at, " +
                     "CASE WHEN is_secret=1 THEN '비밀글입니다.' ELSE question END AS question " +
                     "FROM qna ORDER BY created_at DESC LIMIT ? OFFSET ?";
        List<QnaVO> list = new ArrayList<>();
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);
            rs = pstmt.executeQuery();
            while (rs.next()) list.add(mapListRow(rs));
        } catch (SQLException e) {
            logger.error("Q&A 목록 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return list;
    }

    /** Q&A 상세 조회 (비밀번호 포함) */
    public QnaVO findById(int id) {
        String sql = "SELECT * FROM qna WHERE id = ?";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) return mapDetailRow(rs);
        } catch (SQLException e) {
            logger.error("Q&A 상세 조회 실패 id={}", id, e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return null;
    }

    /** 전체 Q&A 수 */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM qna";
        Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            logger.error("Q&A 수 조회 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt, rs);
        }
        return 0;
    }

    /** Q&A 등록 (익명 방문자) */
    public int insert(QnaVO qna) {
        String sql = "INSERT INTO qna (question, nickname, is_secret, password) VALUES (?, ?, ?, ?)";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qna.getQuestion());
            pstmt.setString(2, qna.getNickname() != null ? qna.getNickname() : "익명");
            pstmt.setBoolean(3, qna.isSecret());
            pstmt.setString(4, qna.getPassword());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Q&A 등록 실패", e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
        return 0;
    }

    /** 답변 등록 (관리자) */
    public int updateAnswer(int id, String answer) {
        String sql = "UPDATE qna SET answer=?, is_answered=1, answered_at=NOW() WHERE id=?";
        Connection conn = null; PreparedStatement pstmt = null;
        try {
            conn = DBConnectionPool.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, answer);
            pstmt.setInt(2, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Q&A 답변 등록 실패 id={}", id, e);
        } finally {
            DBConnectionPool.close(conn, pstmt);
        }
        return 0;
    }

    private QnaVO mapListRow(ResultSet rs) throws SQLException {
        QnaVO vo = new QnaVO();
        vo.setId(rs.getInt("id"));
        vo.setQuestion(rs.getString("question"));
        vo.setNickname(rs.getString("nickname"));
        vo.setAnswered(rs.getBoolean("is_answered"));
        vo.setSecret(rs.getBoolean("is_secret"));
        Timestamp ts = rs.getTimestamp("created_at");
        if (ts != null) vo.setCreatedAt(ts.toLocalDateTime());
        return vo;
    }

    private QnaVO mapDetailRow(ResultSet rs) throws SQLException {
        QnaVO vo = new QnaVO();
        vo.setId(rs.getInt("id"));
        vo.setQuestion(rs.getString("question"));
        vo.setAnswer(rs.getString("answer"));
        vo.setNickname(rs.getString("nickname"));
        vo.setAnswered(rs.getBoolean("is_answered"));
        vo.setSecret(rs.getBoolean("is_secret"));
        vo.setPassword(rs.getString("password"));
        Timestamp ts = rs.getTimestamp("created_at");
        if (ts != null) vo.setCreatedAt(ts.toLocalDateTime());
        Timestamp ats = rs.getTimestamp("answered_at");
        if (ats != null) vo.setAnsweredAt(ats.toLocalDateTime());
        return vo;
    }
}

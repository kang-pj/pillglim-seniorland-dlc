package com.pilgrimseniorland.service;

import com.pilgrimseniorland.dao.QnaDao;
import com.pilgrimseniorland.model.QnaVO;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class QnaService {

    private final QnaDao qnaDao = new QnaDao();

    /** Q&A 목록 페이징 조회 */
    public List<QnaVO> getQnaList(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return qnaDao.findAll(offset, pageSize);
    }

    /** Q&A 상세 조회 */
    public QnaVO getQnaDetail(int id) {
        return qnaDao.findById(id);
    }

    /** 전체 페이지 수 */
    public int getTotalPages(int pageSize) {
        int total = qnaDao.countAll();
        return (int) Math.ceil((double) total / pageSize);
    }

    /** Q&A 등록 (익명 방문자) */
    public boolean createQna(QnaVO qna) {
        // 비밀글이면 비밀번호 BCrypt 해시
        if (qna.isSecret() && qna.getPassword() != null && !qna.getPassword().isBlank()) {
            qna.setPassword(BCrypt.hashpw(qna.getPassword(), BCrypt.gensalt()));
        } else {
            qna.setPassword(null);
        }
        return qnaDao.insert(qna) > 0;
    }

    /** 비밀글 비밀번호 검증 */
    public boolean verifyPassword(QnaVO qna, String inputPassword) {
        if (!qna.isSecret()) return true;
        if (qna.getPassword() == null) return false;
        return BCrypt.checkpw(inputPassword, qna.getPassword());
    }

    /** 답변 등록 (관리자) */
    public boolean answerQna(int id, String answer) {
        return qnaDao.updateAnswer(id, answer) > 0;
    }
}

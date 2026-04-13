package com.pilgrimseniorland.service;

import com.pilgrimseniorland.dao.NoticeDao;
import com.pilgrimseniorland.model.NoticeVO;
import com.pilgrimseniorland.util.AppConfig;

import java.util.List;

public class NoticeService {

    private final NoticeDao noticeDao = new NoticeDao();

    /** 홈 페이지용 최신 공지사항 조회 */
    public List<NoticeVO> getRecentNotices(int limit) {
        return noticeDao.findRecent(limit);
    }

    /** 공지사항 목록 페이징 조회 */
    public List<NoticeVO> getNoticeList(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return noticeDao.findAll(offset, pageSize);
    }

    /** 공지사항 상세 조회 */
    public NoticeVO getNoticeDetail(int id) {
        return noticeDao.findById(id);
    }

    /** 전체 페이지 수 계산 */
    public int getTotalPages(int pageSize) {
        int total = noticeDao.countAll();
        return (int) Math.ceil((double) total / pageSize);
    }

    /** 공지사항 등록 (관리자) */
    public boolean createNotice(NoticeVO notice) {
        return noticeDao.insert(notice) > 0;
    }

    /** 공지사항 수정 (관리자) */
    public boolean updateNotice(NoticeVO notice) {
        return noticeDao.update(notice) > 0;
    }

    /** 공지사항 삭제 (관리자) */
    public boolean deleteNotice(int id) {
        return noticeDao.delete(id) > 0;
    }

    /** 관리자용 전체 목록 */
    public List<NoticeVO> getNoticeListForAdmin(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return noticeDao.findAllForAdmin(offset, pageSize);
    }
}

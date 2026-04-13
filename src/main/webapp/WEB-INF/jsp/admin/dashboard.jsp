<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자 대시보드 | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="admin-page">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>

<main class="admin-content">
    <div class="container">
        <h1>관리자 대시보드</h1>

        <div class="dashboard-stats">
            <div class="stat-card">
                <h3>공지사항</h3>
                <p class="stat-number" data-testid="stat-notices">${stats.noticeCount}</p>
                <a href="${pageContext.request.contextPath}/admin/notice/list" class="stat-link">관리하기</a>
            </div>

            <div class="stat-card">
                <h3>Q&A</h3>
                <p class="stat-number" data-testid="stat-qna">${stats.qnaCount}</p>
                <a href="${pageContext.request.contextPath}/admin/qna/list" class="stat-link">관리하기</a>
            </div>

            <div class="stat-card">
                <h3>미답변 Q&A</h3>
                <p class="stat-number highlight" data-testid="stat-pending-qna">${stats.pendingQnaCount}</p>
                <a href="${pageContext.request.contextPath}/admin/qna/list?status=PENDING" class="stat-link">답변하기</a>
            </div>

            <div class="stat-card">
                <h3>문의</h3>
                <p class="stat-number" data-testid="stat-contacts">${stats.contactCount}</p>
                <a href="${pageContext.request.contextPath}/admin/contact/list" class="stat-link">확인하기</a>
            </div>
        </div>

        <div class="dashboard-quick-links">
            <h2>빠른 메뉴</h2>
            <div class="quick-links-grid">
                <a href="${pageContext.request.contextPath}/admin/notice/new" class="quick-link-card">
                    <h3>공지사항 작성</h3>
                    <p>새로운 공지사항을 등록합니다</p>
                </a>
                <a href="${pageContext.request.contextPath}/admin/qna/list?status=PENDING" class="quick-link-card">
                    <h3>Q&A 답변</h3>
                    <p>미답변 질문에 답변합니다</p>
                </a>
                <a href="${pageContext.request.contextPath}/admin/contact/list" class="quick-link-card">
                    <h3>문의 확인</h3>
                    <p>접수된 문의를 확인합니다</p>
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/admin/common/admin-footer.jsp" %>
</body>
</html>

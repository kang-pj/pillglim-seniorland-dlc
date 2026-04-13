<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="admin-header">
    <div class="admin-header-inner">
        <div class="admin-logo">
            <a href="${pageContext.request.contextPath}/admin/dashboard">필그림시니어랜드 관리자</a>
        </div>

        <nav class="admin-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/dashboard">대시보드</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/notice/list">공지사항</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/qna/list">Q&A</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/contact/list">문의</a></li>
            </ul>
        </nav>

        <div class="admin-user">
            <span>${sessionScope.admin.username}</span>
            <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-sm">로그아웃</a>
        </div>
    </div>
</header>

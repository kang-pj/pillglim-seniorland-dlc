<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>${notice.title} - ?ÑÍ∑∏Î¶ºÏãú?àÏñ¥?úÎìú</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<main class="page-main">
    <div class="page-hero"><h1>Í≥µÏ??¨Ìï≠</h1></div>
    <div class="container">
        <article class="board-detail" data-testid="notice-detail">
            <div class="board-detail-header">
                <h2>${notice.title}</h2>
                <div class="board-meta">
                    <span>${notice.author}</span>
                    <span><fmt:formatDate value="${notice.createdAt}" pattern="yyyy.MM.dd"/></span>
                </div>
            </div>
            <div class="board-detail-content">
                ${notice.content}
            </div>
        </article>
        <div class="board-actions">
            <a href="${pageContext.request.contextPath}/support/notice" class="btn btn-secondary">Î™©Î°ù?ºÎ°ú</a>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

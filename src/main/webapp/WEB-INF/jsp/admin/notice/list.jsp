<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Í≥µÏ??¨Ìï≠ Í¥ÄÎ¶?- Í¥ÄÎ¶¨Ïûê</title>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="admin-body">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>
<main class="admin-main">
    <div class="admin-page-header">
        <h2>Í≥µÏ??¨Ìï≠ Í¥ÄÎ¶?/h2>
        <a href="${pageContext.request.contextPath}/admin/notice/write" class="btn btn-primary">??Í≥µÏ? ?ëÏÑ±</a>
    </div>
    <table class="board-table">
        <thead><tr><th>Î≤àÌò∏</th><th>?úÎ™©</th><th>Í≥µÍ∞ú</th><th>?ëÏÑ±??/th><th>Í¥ÄÎ¶?/th></tr></thead>
        <tbody>
            <c:forEach var="notice" items="${notices}" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/notice/edit?id=${notice.id}">${notice.title}</a></td>
                    <td>${notice.published ? 'Í≥µÍ∞ú' : 'ÎπÑÍ≥µÍ∞?}</td>
                    <td><fmt:formatDate value="${notice.createdAt}" pattern="yyyy.MM.dd"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/notice/edit?id=${notice.id}" class="btn btn-sm">?òÏ†ï</a>
                        <a href="${pageContext.request.contextPath}/admin/notice/delete?id=${notice.id}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('??†ú?òÏãúÍ≤†Ïäµ?àÍπå?')">??†ú</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>

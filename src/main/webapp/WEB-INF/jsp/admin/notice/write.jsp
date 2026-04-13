<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>공�??�항 ?�성 - 관리자</title>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="admin-body">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>
<main class="admin-main">
    <h2>공�??�항 ?�성</h2>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/admin/notice/write" class="admin-form">
        <div class="form-group">
            <label for="title">?�목 *</label>
            <input type="text" id="title" name="title" maxlength="200" required>
        </div>
        <div class="form-group">
            <label for="content">?�용 *</label>
            <textarea id="content" name="content" rows="15" required></textarea>
        </div>
        <div class="form-group">
            <label><input type="checkbox" name="published" checked> 공개</label>
        </div>
        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/admin/notice" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">?�??/button>
        </div>
    </form>
</main>
</body>
</html>

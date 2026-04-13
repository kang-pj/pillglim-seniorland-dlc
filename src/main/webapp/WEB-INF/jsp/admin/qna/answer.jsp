<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Q&amp;A ?µÎ? - Í¥ÄÎ¶¨Ïûê</title>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="admin-body">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>
<main class="admin-main">
    <h2>Q&amp;A ?µÎ?</h2>
    <div class="qna-question-box">
        <strong>ÏßàÎ¨∏:</strong>
        <p>${qna.question}</p>
        <small>?ëÏÑ±?? ${qna.nickname}</small>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/admin/qna/answer" class="admin-form">
        <input type="hidden" name="id" value="${qna.id}">
        <div class="form-group">
            <label for="answer">?µÎ? *</label>
            <textarea id="answer" name="answer" rows="8" required>${qna.answer}</textarea>
        </div>
        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/admin/qna" class="btn btn-secondary">Ï∑®ÏÜå</a>
            <button type="submit" class="btn btn-primary">?Ä??/button>
        </div>
    </form>
</main>
</body>
</html>

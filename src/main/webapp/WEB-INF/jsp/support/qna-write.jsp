<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>질문하기 | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="page-content">
    <div class="container">
        <div class="page-header">
            <h1>질문하기</h1>
        </div>

        <form id="qnaForm" method="post" action="${pageContext.request.contextPath}/support/qna/write" class="qna-form">
            <div class="form-group">
                <label for="author">작성자 <span class="required">*</span></label>
                <input type="text" id="author" name="author" required maxlength="50" data-testid="qna-author">
            </div>

            <div class="form-group">
                <label for="password">비밀번호 <span class="required">*</span></label>
                <input type="password" id="password" name="password" required maxlength="20" data-testid="qna-password">
                <small>질문 수정/삭제 시 필요합니다</small>
            </div>

            <div class="form-group">
                <label for="title">제목 <span class="required">*</span></label>
                <input type="text" id="title" name="title" required maxlength="200" data-testid="qna-title">
            </div>

            <div class="form-group">
                <label for="content">내용 <span class="required">*</span></label>
                <textarea id="content" name="content" required rows="15" maxlength="2000" data-testid="qna-content"></textarea>
                <small><span id="charCount">0</span> / 2000자</small>
            </div>

            <div class="form-group checkbox-group">
                <label>
                    <input type="checkbox" id="isSecret" name="isSecret" value="true" data-testid="qna-secret">
                    비밀글로 작성
                </label>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary" data-testid="qna-submit">등록하기</button>
                <a href="${pageContext.request.contextPath}/support/qna" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/qna.js"></script>
</body>
</html>

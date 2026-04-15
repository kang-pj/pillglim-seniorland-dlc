<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="error-page">
    <div class="container">
        <div class="error-content">
            <h1 class="error-code">500</h1>
            <h2 class="error-title">서버 오류가 발생했습니다</h2>
            <p class="error-message">
                일시적인 오류가 발생했습니다.<br>
                잠시 후 다시 시도해 주세요.
            </p>
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
                <a href="${pageContext.request.contextPath}/support/contact" class="btn btn-secondary">문의하기</a>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

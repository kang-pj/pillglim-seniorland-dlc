<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>404 - 페이지를 찾을 수 없습니다 | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="error-page">
    <div class="container">
        <div class="error-content">
            <h1 class="error-code">404</h1>
            <h2 class="error-title">페이지를 찾을 수 없습니다</h2>
            <p class="error-message">
                요청하신 페이지가 존재하지 않거나 이동되었습니다.<br>
                주소를 다시 확인해 주세요.
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

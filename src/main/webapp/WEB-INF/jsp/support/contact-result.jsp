<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>๋ฌธ์ ?๋ฃ - ?๊ทธ๋ฆผ์?์–ด?๋“</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<main class="page-main">
    <div class="container result-container">
        <c:choose>
            <c:when test="${success}">
                <div class="result-box success" data-testid="contact-result-success">
                    <div class="result-icon">??/div>
                    <h2>๋ฌธ์๊ฐ€ ?‘์?์—?ต๋??</h2>
                    <p>๋น ๋ฅธ ?์ผ ?ด์— ?ฐ๋ฝ?๋ฆฌ๊ฒ ์ต?๋ค.<br>๊ฐ์ฌ?ฉ๋??</p>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">?์ผ๋ก??์•๊ฐ€๊ธ?/a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="result-box error" data-testid="contact-result-error">
                    <div class="result-icon">??/div>
                    <h2>๋ฌธ์ ?‘์???คํจ?์ต?๋ค.</h2>
                    <p>? ์ ???ค์ ?๋??์ฃผ์ธ??</p>
                    <a href="${pageContext.request.contextPath}/support/contact" class="btn btn-primary">?ค์ ?๋</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

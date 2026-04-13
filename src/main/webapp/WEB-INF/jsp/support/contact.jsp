<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>온라인 문의 | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
    <script src="https://www.google.com/recaptcha/api.js?render=${recaptchaSiteKey}"></script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="page-content">
    <div class="container">
        <div class="page-header">
            <h1>온라인 문의</h1>
            <p>궁금하신 사항을 남겨주시면 빠른 시일 내에 답변 드리겠습니다.</p>
        </div>

        <form id="contactForm" method="post" action="${pageContext.request.contextPath}/support/contact" class="contact-form">
            <div class="form-group">
                <label for="name">이름 <span class="required">*</span></label>
                <input type="text" id="name" name="name" required maxlength="50" data-testid="contact-name">
            </div>

            <div class="form-group">
                <label for="phone">연락처 <span class="required">*</span></label>
                <input type="tel" id="phone" name="phone" required placeholder="010-1234-5678" maxlength="20" data-testid="contact-phone">
                <small>하이픈(-)을 포함하여 입력해주세요</small>
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" maxlength="100" data-testid="contact-email">
            </div>

            <div class="form-group">
                <label for="message">문의 내용 <span class="required">*</span></label>
                <textarea id="message" name="message" required rows="10" maxlength="2000" data-testid="contact-message"></textarea>
                <small><span id="charCount">0</span> / 2000자</small>
            </div>

            <div class="form-group checkbox-group">
                <label>
                    <input type="checkbox" id="privacyAgree" name="privacyAgree" required data-testid="contact-privacy">
                    <a href="${pageContext.request.contextPath}/privacy" target="_blank">개인정보 수집 및 이용</a>에 동의합니다 <span class="required">*</span>
                </label>
            </div>

            <input type="hidden" id="recaptchaToken" name="recaptchaToken">

            <div class="form-actions">
                <button type="submit" class="btn btn-primary" data-testid="contact-submit">문의하기</button>
                <button type="reset" class="btn btn-secondary">초기화</button>
            </div>
        </form>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/contact.js"></script>
<script>
    // reCAPTCHA 사이트 키 전달
    window.RECAPTCHA_SITE_KEY = '${recaptchaSiteKey}';
</script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="admin-login-page">
<div class="login-container">
    <div class="login-box">
        <div class="login-header">
            <h1>관리자 로그인</h1>
            <p>필그림시니어랜드 관리 시스템</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-error" data-testid="login-error">
                ${error}
            </div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/admin/login" class="login-form">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="username" required autofocus data-testid="login-username">
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required data-testid="login-password">
            </div>

            <button type="submit" class="btn btn-primary btn-block" data-testid="login-submit">로그인</button>
        </form>

        <div class="login-footer">
            <a href="${pageContext.request.contextPath}/">홈페이지로 돌아가기</a>
        </div>
    </div>
</div>
</body>
</html>

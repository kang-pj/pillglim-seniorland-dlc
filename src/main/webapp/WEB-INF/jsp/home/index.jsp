<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>필그림시니어랜드 - 건강하고 행복한 노년</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages/home.css">
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main>
    <!-- Hero 섹션 -->
    <section class="hero" id="hero">
        <div class="hero-bg">
            <img src="${pageContext.request.contextPath}/resources/images/hero/main.webp"
                 alt="필그림시니어랜드 전경" loading="eager" fetchpriority="high">
        </div>
        <div class="hero-content">
            <h1 class="hero-title">건강하고 행복한 노년,<br>필그림시니어랜드</h1>
            <p class="hero-subtitle">대전에서 품격 있는 시니어복지주택</p>
            <a href="${pageContext.request.contextPath}/intro/greeting"
               class="btn btn-primary" data-testid="hero-cta-btn">자세히 알아보기</a>
        </div>
    </section>

    <!-- 메뉴 카드 섹션 -->
    <section class="menu-cards section">
        <div class="container">
            <div class="cards-grid">
                <a href="${pageContext.request.contextPath}/intro/greeting" class="card" data-testid="card-intro">
                    <div class="card-icon"><img src="${pageContext.request.contextPath}/resources/images/intro/icon-intro.webp" alt="" loading="lazy"></div>
                    <h3>필그림시니어랜드 소개</h3>
                    <p>설립 배경과 비전을 소개합니다</p>
                </a>
                <a href="${pageContext.request.contextPath}/business/overview" class="card" data-testid="card-business">
                    <div class="card-icon"><img src="${pageContext.request.contextPath}/resources/images/intro/icon-business.webp" alt="" loading="lazy"></div>
                    <h3>사업정보</h3>
                    <p>시니어복지주택 사업을 안내합니다</p>
                </a>
                <a href="${pageContext.request.contextPath}/signature/premium" class="card" data-testid="card-signature">
                    <div class="card-icon"><img src="${pageContext.request.contextPath}/resources/images/signature/icon-signature.webp" alt="" loading="lazy"></div>
                    <h3>시그니처</h3>
                    <p>프리미엄 시설과 커뮤니티를 만나보세요</p>
                </a>
                <a href="${pageContext.request.contextPath}/residence/typemap" class="card" data-testid="card-residence">
                    <div class="card-icon"><img src="${pageContext.request.contextPath}/resources/images/residence/icon-residence.webp" alt="" loading="lazy"></div>
                    <h3>주거공간 소개</h3>
                    <p>다양한 타입의 주거공간을 확인하세요</p>
                </a>
            </div>
        </div>
    </section>

    <!-- 최신 공지사항 -->
    <section class="latest-notices section">
        <div class="container">
            <div class="section-header">
                <h2>공지사항</h2>
                <a href="${pageContext.request.contextPath}/support/notice" class="more-link">더보기</a>
            </div>
            <ul class="notice-list" data-testid="home-notice-list">
                <c:choose>
                    <c:when test="${empty recentNotices}">
                        <li class="no-data">등록된 공지사항이 없습니다.</li>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="notice" items="${recentNotices}">
                            <li>
                                <a href="${pageContext.request.contextPath}/support/notice/detail?id=${notice.id}">
                                    <span class="notice-title">${notice.title}</span>
                                    <span class="notice-date">
                                        <fmt:formatDate value="${notice.createdAt}" pattern="yyyy.MM.dd"/>
                                    </span>
                                </a>
                            </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </section>

    <!-- 문의 CTA -->
    <section class="contact-cta section">
        <div class="container">
            <h2>입주 상담 문의</h2>
            <p>궁금한 점이 있으시면 언제든지 문의해 주세요</p>
            <a href="${pageContext.request.contextPath}/support/contact"
               class="btn btn-primary" data-testid="contact-cta-btn">온라인 문의하기</a>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

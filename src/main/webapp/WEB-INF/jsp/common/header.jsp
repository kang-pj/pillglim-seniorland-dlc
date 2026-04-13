<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="site-header" id="site-header">
    <div class="header-inner">
        <a href="${pageContext.request.contextPath}/" class="logo" data-testid="header-logo">
            <img src="${pageContext.request.contextPath}/resources/images/logo/logo.png" alt="필그림시니어랜드">
        </a>

        <nav class="gnb" id="gnb" aria-label="주요 메뉴">
            <ul class="gnb-list">
                <li class="gnb-item has-sub">
                    <a href="${pageContext.request.contextPath}/intro/greeting" class="gnb-link" data-testid="nav-intro">필그림시니어랜드 소개</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/intro/greeting">인사말</a></li>
                        <li><a href="${pageContext.request.contextPath}/intro/brand">브랜드 소개</a></li>
                        <li><a href="${pageContext.request.contextPath}/intro/vision">비전</a></li>
                    </ul>
                </li>
                <li class="gnb-item has-sub">
                    <a href="${pageContext.request.contextPath}/business/overview" class="gnb-link" data-testid="nav-business">사업정보</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/business/overview">사업개요</a></li>
                        <li><a href="${pageContext.request.contextPath}/business/site">사업지 소개</a></li>
                    </ul>
                </li>
                <li class="gnb-item has-sub">
                    <a href="${pageContext.request.contextPath}/signature/premium" class="gnb-link" data-testid="nav-signature">시그니처</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/signature/premium">프리미엄</a></li>
                        <li><a href="${pageContext.request.contextPath}/signature/community">커뮤니티</a></li>
                        <li><a href="${pageContext.request.contextPath}/signature/plan">시설 계획</a></li>
                        <li><a href="${pageContext.request.contextPath}/signature/floor">층별 안내</a></li>
                        <li><a href="${pageContext.request.contextPath}/signature/nearby">주변 시설</a></li>
                        <li><a href="${pageContext.request.contextPath}/signature/amenity">편의시설</a></li>
                    </ul>
                </li>
                <li class="gnb-item has-sub">
                    <a href="${pageContext.request.contextPath}/residence/typemap" class="gnb-link" data-testid="nav-residence">주거공간 소개</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/residence/typemap">타입별 위치도</a></li>
                        <li><a href="${pageContext.request.contextPath}/residence/floorplan">평면소개</a></li>
                    </ul>
                </li>
                <li class="gnb-item has-sub">
                    <a href="${pageContext.request.contextPath}/support/notice" class="gnb-link" data-testid="nav-support">고객센터</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/support/notice">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/support/contact">온라인 문의</a></li>
                        <li><a href="${pageContext.request.contextPath}/support/qna">Q&amp;A</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <button class="hamburger" id="hamburger" aria-label="메뉴 열기" aria-expanded="false" data-testid="hamburger-btn">
            <span></span><span></span><span></span>
        </button>
    </div>
</header>

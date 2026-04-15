<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="ko">
<head>
  <title>인사말 - 필그림시니어랜드</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="bg-surface text-on-surface font-body">

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main>

  <!-- 페이지 히어로 -->
  <section class="relative h-64 md:h-80 flex items-end overflow-hidden">
    <div class="absolute inset-0">
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="인사말 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-primary-fixed text-sm font-label uppercase tracking-widest mb-2">Introduction</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">인사말</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">인사말</span>
    </div>
  </div>

  <!-- 본문 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto">

      <!-- 인사말 본문 -->
      <div class="space-y-10">
        <div class="space-y-6">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">
            필그림시니어랜드에 오신 것을 환영합니다.
          </h2>
          <div class="w-16 h-1 bg-primary rounded-full"></div>
        </div>

        <div class="space-y-6 text-on-surface-variant leading-relaxed text-lg">
          <p>
            안녕하십니까, 필그림시니어랜드 대표 홍길동입니다.
          </p>
          <p>
            필그림(Pilgrim)은 순례자를 의미합니다. 긴 여정 끝에 만나는 편안한 안식처이자 다채로운 즐거움이 있는 곳, 품격 있는 인생의 새로운 시작을 함께하겠습니다.
          </p>
          <p>
            저희 필그림시니어랜드는 어르신들이 건강하고 행복한 노년을 보내실 수 있도록 최선을 다하겠습니다. 전문적인 의료 서비스와 다양한 문화·여가 프로그램을 통해 품격 있는 시니어 라이프를 제공하겠습니다.
          </p>
          <p>
            감사합니다.
          </p>
        </div>

        <!-- 서명 -->
        <div class="pt-8 border-t border-outline-variant/30">
          <p class="text-on-surface-variant text-sm mb-1">필그림시니어랜드</p>
          <p class="font-headline text-xl font-bold text-on-background">대표 홍길동</p>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <span class="text-on-surface-variant text-sm">소개</span>
      <div class="flex gap-4">
        <a href="${pageContext.request.contextPath}/intro/brand"
           class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
          브랜드 소개
          <span class="material-symbols-outlined text-sm">arrow_forward</span>
        </a>
      </div>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

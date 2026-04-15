<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="ko">
<head>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="bg-surface text-on-surface font-body">

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main>

  <!-- 페이지 히어로 -->
  <section class="relative h-64 md:h-80 flex items-end overflow-hidden">
    <div class="absolute inset-0">
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="비전 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Introduction</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">비전</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/intro/greeting" class="hover:text-primary transition-colors">소개</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">비전</span>
    </div>
  </div>

  <!-- 비전 인트로 -->
  <section class="py-24 px-8 bg-surface">
    <div class="max-w-4xl mx-auto text-center space-y-6">
      <p class="text-primary text-sm font-label uppercase tracking-widest">Our Vision</p>
      <h2 class="font-headline text-3xl md:text-4xl font-bold text-on-background leading-tight">
        품격 있는 노년을 위한<br>네 가지 약속
      </h2>
      <p class="text-on-surface-variant text-lg leading-relaxed max-w-2xl mx-auto">
        필그림시니어랜드는 어르신 한 분 한 분의 삶이 존엄하고 풍요롭게 이어질 수 있도록 네 가지 핵심 가치를 실천합니다.
      </p>
    </div>
  </section>

  <!-- 비전 01: 존엄과 배려 -->
  <section class="py-20 px-8 bg-surface-container-low">
    <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
      <div class="space-y-8">
        <div class="space-y-3">
          <p class="text-primary text-sm font-label uppercase tracking-widest">Vision 01</p>
          <h2 class="font-headline text-2xl md:text-4xl font-bold text-on-background">
            존엄과 배려
            <span class="block text-lg font-normal text-outline mt-1">Dignity &amp; Care</span>
          </h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <blockquote class="text-xl font-headline italic text-primary border-l-4 border-primary pl-6">
          "한 분 한 분의 삶을 온전히 존중합니다."
        </blockquote>
        <p class="text-on-surface-variant leading-relaxed">
          어르신을 보호의 대상이 아닌 독립된 인격체로 바라봅니다. 개인의 선택과 자율성을 존중하며, 서로가 서로를 배려하는 따뜻한 공동체 문화를 만들어갑니다.
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">존엄 중심 돌봄 시스템</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">개인 맞춤형 생활 지원</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">가족과의 신뢰 기반 소통</span>
          </div>
        </div>
      </div>
      <div class="relative h-80 lg:h-96 rounded-xl overflow-hidden">
        <img class="w-full h-full object-cover"
             src="https://placehold.co/800x500/c4e7ff/00658b?text=Dignity+%26+Care"
             alt="존엄과 배려">
        <div class="absolute inset-0 bg-gradient-to-t from-primary/30 to-transparent"></div>
      </div>
    </div>
  </section>

  <!-- 비전 02: 배움과 성장 -->
  <section class="py-20 px-8 bg-surface">
    <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
      <div class="relative h-80 lg:h-96 rounded-xl overflow-hidden order-2 lg:order-1">
        <img class="w-full h-full object-cover"
             src="https://placehold.co/800x500/afc8d5/00658b?text=Learning+%26+Enrichment"
             alt="배움과 성장">
        <div class="absolute inset-0 bg-gradient-to-t from-primary/30 to-transparent"></div>
      </div>
      <div class="space-y-8 order-1 lg:order-2">
        <div class="space-y-3">
          <p class="text-primary text-sm font-label uppercase tracking-widest">Vision 02</p>
          <h2 class="font-headline text-2xl md:text-4xl font-bold text-on-background">
            배움과 성장
            <span class="block text-lg font-normal text-outline mt-1">Learning &amp; Enrichment</span>
          </h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <blockquote class="text-xl font-headline italic text-primary border-l-4 border-primary pl-6">
          "나이는 숫자일 뿐, 성장은 계속됩니다."
        </blockquote>
        <p class="text-on-surface-variant leading-relaxed">
          배움과 즐거움이 공존하는 커뮤니티를 통해 어르신의 일상에 활력을 더합니다. 문화·교양·취미 프로그램으로 삶의 의미와 성취감을 함께 키워갑니다.
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">평생교육 프로그램 운영</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">문화·여가 활동 활성화</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">사회적 교류 공동체 구축</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 비전 03: 건강과 웰빙 -->
  <section class="py-20 px-8 bg-surface-container-low">
    <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
      <div class="space-y-8">
        <div class="space-y-3">
          <p class="text-primary text-sm font-label uppercase tracking-widest">Vision 03</p>
          <h2 class="font-headline text-2xl md:text-4xl font-bold text-on-background">
            건강과 웰빙
            <span class="block text-lg font-normal text-outline mt-1">Health &amp; Well-being</span>
          </h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <blockquote class="text-xl font-headline italic text-primary border-l-4 border-primary pl-6">
          "몸과 마음이 함께 편안한 삶."
        </blockquote>
        <p class="text-on-surface-variant leading-relaxed">
          신체적 건강과 정서적 안정을 동시에 지원하는 최적의 케어 시스템을 갖춥니다. 안전하고 쾌적한 생활 환경에서 건강한 일상이 자연스럽게 이어지도록 설계합니다.
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">체계적인 건강관리 시스템</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">정서 지원 프로그램</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">쾌적하고 안전한 주거환경</span>
          </div>
        </div>
      </div>
      <div class="relative h-80 lg:h-96 rounded-xl overflow-hidden">
        <img class="w-full h-full object-cover"
             src="https://placehold.co/800x500/77cefe/00658b?text=Health+%26+Well-being"
             alt="건강과 웰빙">
        <div class="absolute inset-0 bg-gradient-to-t from-primary/30 to-transparent"></div>
      </div>
    </div>
  </section>

  <!-- 비전 04: 지속 가능성 -->
  <section class="py-20 px-8 bg-surface">
    <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
      <div class="relative h-80 lg:h-96 rounded-xl overflow-hidden order-2 lg:order-1">
        <img class="w-full h-full object-cover"
             src="https://placehold.co/800x500/d5e3fd/00658b?text=Sustainability+%26+Stability"
             alt="지속 가능성">
        <div class="absolute inset-0 bg-gradient-to-t from-primary/30 to-transparent"></div>
      </div>
      <div class="space-y-8 order-1 lg:order-2">
        <div class="space-y-3">
          <p class="text-primary text-sm font-label uppercase tracking-widest">Vision 04</p>
          <h2 class="font-headline text-2xl md:text-4xl font-bold text-on-background">
            지속 가능성
            <span class="block text-lg font-normal text-outline mt-1">Sustainability &amp; Stability</span>
          </h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <blockquote class="text-xl font-headline italic text-primary border-l-4 border-primary pl-6">
          "변함없는 삶의 안정을 약속합니다."
        </blockquote>
        <p class="text-on-surface-variant leading-relaxed">
          급변하는 환경 속에서도 흔들림 없는 라이프스타일을 보장합니다. 장기적 관점에서 안정적인 운영과 지속 가능한 커뮤니티를 만들어갑니다.
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">안정적 운영 시스템</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">장기 거주 만족도 관리</span>
          </div>
          <div class="flex items-start gap-3">
            <span class="material-symbols-outlined text-primary text-xl mt-0.5">check_circle</span>
            <span class="text-sm text-on-surface-variant">세대 간 연계 공동체 모델</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/intro/brand"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        브랜드 소개
      </a>
      <a href="${pageContext.request.contextPath}/business/overview"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        사업개요
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

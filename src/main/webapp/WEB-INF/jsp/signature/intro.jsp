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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_02.jpg" alt="시그니처 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Signature</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">시그니처</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">시그니처</span>
    </div>
  </div>

  <!-- 메인 소개 섹션 -->
  <section class="py-24 px-8">
    <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
      <div class="space-y-8">
        <div class="space-y-4">
          <p class="text-primary text-sm font-label uppercase tracking-widest">Signature Premium</p>
          <h2 class="font-headline text-3xl md:text-4xl font-bold text-on-background leading-tight">
            건강하고 행복한 노후를 위한<br>최적의 환경
          </h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <p class="text-on-surface-variant text-lg leading-relaxed">
          필그림시니어랜드는 어르신들이 자연 속에서 건강하고 활기차게 생활할 수 있도록 최적의 환경을 설계했습니다. 자연과 사람이 조화를 이루는 공간에서 품격 있는 시니어 라이프를 경험하세요.
        </p>
      </div>
      <div class="relative rounded-xl overflow-hidden h-80 lg:h-[480px]">
        <img class="w-full h-full object-cover"
             src="${pageContext.request.contextPath}/resources/images/ss.jpg"
             alt="시그니처 시설">
        <div class="absolute inset-0 bg-gradient-to-t from-primary/20 to-transparent"></div>
      </div>
    </div>
  </section>

  <!-- 4가지 특징 -->
  <section class="py-20 px-8 bg-surface-container-low">
    <div class="max-w-7xl mx-auto space-y-16">

      <!-- 특징 01: 자연친화적 설계 -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        <div class="relative h-72 rounded-xl overflow-hidden order-2 lg:order-1">
          <img class="w-full h-full object-cover"
               src="https://placehold.co/800x450/c4e7ff/00658b?text=Natural+Design"
               alt="자연친화적 설계">
        </div>
        <div class="space-y-6 order-1 lg:order-2">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">park</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Feature 01</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">자연친화적 설계</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed text-lg">
            주변 자연환경을 최대한 보존하고 활용한 친환경 설계를 적용했습니다. 사계절 변화하는 자연의 아름다움을 일상에서 느낄 수 있도록 녹지 공간과 조경을 세심하게 계획했습니다.
          </p>
          <ul class="space-y-3">
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">자연 지형을 살린 단지 배치</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">사계절 산책 가능한 녹지 공간</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">친환경 건축 자재 사용</span>
            </li>
          </ul>
        </div>
      </div>

      <!-- 특징 02: 계단식 테라스 -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        <div class="space-y-6">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">deck</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Feature 02</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">계단식 테라스 설계</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed text-lg">
            계단식 테라스 타입으로 설계된 실내·외 공간은 각 세대에 독립적인 프라이빗 공간을 제공합니다. 탁 트인 전망과 함께 나만의 야외 공간에서 여유로운 시간을 보낼 수 있습니다.
          </p>
          <ul class="space-y-3">
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">세대별 프라이빗 테라스 제공</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">실내외 연결된 개방형 공간</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">파노라마 자연 전망 확보</span>
            </li>
          </ul>
        </div>
        <div class="relative h-72 rounded-xl overflow-hidden">
          <img class="w-full h-full object-cover"
               src="https://placehold.co/800x450/afc8d5/00658b?text=Terrace+Design"
               alt="계단식 테라스 설계">
        </div>
      </div>

      <!-- 특징 03: 전천후 생활공간 -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        <div class="relative h-72 rounded-xl overflow-hidden order-2 lg:order-1">
          <img class="w-full h-full object-cover"
               src="https://placehold.co/800x450/77cefe/00658b?text=Living+Space"
               alt="전천후 생활공간">
        </div>
        <div class="space-y-6 order-1 lg:order-2">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">home</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Feature 03</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">전천후 생활공간</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed text-lg">
            복잡한 시설을 날씨와 계절에 관계없이 전천후로 사용할 수 있는 생활공간으로 설계했습니다. 편리하고 쾌적한 환경에서 다양한 활동을 즐길 수 있습니다.
          </p>
          <ul class="space-y-3">
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">실내 연결 통로로 편리한 이동</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">사계절 이용 가능한 복합 시설</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">다목적 커뮤니티 공간 운영</span>
            </li>
          </ul>
        </div>
      </div>

      <!-- 특징 04: 고령친화설계 -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        <div class="space-y-6">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">accessibility_new</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Feature 04</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">고령친화설계</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed text-lg">
            시니어에 최적화된 고령친화설계를 전면 적용했습니다. 안전하고 편리한 생활 환경을 통해 어르신들이 독립적이고 자유롭게 생활할 수 있도록 세심하게 배려했습니다.
          </p>
          <ul class="space-y-3">
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">무장애(Barrier-Free) 설계</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">안전 손잡이 및 미끄럼 방지</span>
            </li>
            <li class="flex items-center gap-3">
              <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">check_circle</span>
              <span class="text-sm text-on-surface-variant">긴급 호출 시스템 전 세대 설치</span>
            </li>
          </ul>
        </div>
        <div class="relative h-72 rounded-xl overflow-hidden">
          <img class="w-full h-full object-cover"
               src="https://placehold.co/800x450/d5e3fd/00658b?text=Senior+Friendly"
               alt="고령친화설계">
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <span class="text-on-surface-variant text-sm">시그니처</span>
      <a href="${pageContext.request.contextPath}/signature/community"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        커뮤니티
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

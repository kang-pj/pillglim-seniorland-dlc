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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_02.jpg" alt="프리미엄 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Signature</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">프리미엄</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/signature/intro" class="hover:text-primary transition-colors">시그니처</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">프리미엄</span>
    </div>
  </div>

  <!-- 인트로 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto text-center space-y-6">
      <p class="text-primary text-sm font-label uppercase tracking-widest">Premium Service</p>
      <h2 class="font-headline text-3xl md:text-4xl font-bold text-on-background leading-tight">
        정서적으로 안정되고<br>자신들의 공간이 보장되는 삶
      </h2>
      <p class="text-on-surface-variant text-lg leading-relaxed max-w-2xl mx-auto">
        필그림시니어랜드는 어르신 한 분 한 분이 자신만의 공간에서 안정적이고 풍요로운 생활을 누릴 수 있도록 프리미엄 서비스를 제공합니다.
      </p>
    </div>
  </section>

  <!-- 프리미엄 서비스 그리드 -->
  <section class="pb-24 px-8">
    <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

      <!-- 01 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">home_work</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">01</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">스타일 맞춤형 입소시설</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">개인의 생활 방식과 취향에 맞춘 맞춤형 입소 환경을 제공합니다. 어르신 각자의 라이프스타일을 존중하는 공간 설계를 실현합니다.</p>
        </div>
      </div>

      <!-- 02 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">theater_comedy</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">02</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">문화여가서비스 복합화</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">각종 동호회 활동 공간 및 스포츠센터를 운영하여 다채로운 문화·여가 프로그램을 한 공간에서 즐길 수 있습니다.</p>
        </div>
      </div>

      <!-- 03 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">local_hospital</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">03</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">건강관리 의료시설 운영</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">건강관리서비스와 연계된 단지 내 의료시설을 운영합니다. 전문 의료진이 상주하여 24시간 건강을 지킵니다.</p>
        </div>
      </div>

      <!-- 04 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">manage_accounts</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">04</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">개인 공간 철저 보장</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">Unit별 전담 관리실 운영을 통해 서비스를 강화하고 개인 공간의 프라이버시를 철저히 보장합니다.</p>
        </div>
      </div>

      <!-- 05 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">groups</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">05</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">경제적 공동생활 영위</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">합리적인 비용으로 품격 있는 공동생활을 영위하며, 일자리 창출 및 자아실현에 기여하는 커뮤니티를 만들어갑니다.</p>
        </div>
      </div>

      <!-- 06 -->
      <div class="p-8 bg-surface-container-low rounded-xl border border-outline-variant/20 hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-2xl">travel_explore</span>
        </div>
        <div>
          <p class="text-xs text-primary font-label uppercase tracking-widest mb-1">06</p>
          <h3 class="font-headline text-lg font-bold text-on-background mb-2">주변 관광지 활용</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">주변 관광지를 활용한 관광코스를 개발하고 다양한 여가 활동 공간을 마련하여 풍요로운 노후를 지원합니다.</p>
        </div>
      </div>

      <!-- 07 - 풀 너비 -->
      <div class="md:col-span-2 lg:col-span-3 p-8 bg-primary text-on-primary rounded-xl hover:-translate-y-1 hover:shadow-md transition-all duration-300 space-y-4">
        <div class="flex items-start gap-6">
          <div class="w-12 h-12 rounded-full bg-white/20 flex items-center justify-center flex-shrink-0">
            <span class="material-symbols-outlined text-white text-2xl">diversity_3</span>
          </div>
          <div>
            <p class="text-xs text-primary-fixed font-label uppercase tracking-widest mb-1">07</p>
            <h3 class="font-headline text-xl font-bold text-white mb-2">지역주민과 공동체 형성</h3>
            <p class="text-sm text-primary-fixed/80 leading-relaxed max-w-3xl">
              지역사회와 함께 어우러지는 열린 커뮤니티를 형성합니다. 지역주민과의 교류를 통해 세대를 넘어 함께 성장하는 공동체 문화를 만들어갑니다.
            </p>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/signature/intro"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        시그니처
      </a>
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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="ko">
<head>
  <title>브랜드 소개 - 필그림시니어랜드</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="bg-surface text-on-surface font-body">

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main>

  <!-- 페이지 히어로 -->
  <section class="relative h-64 md:h-80 flex items-end overflow-hidden">
    <div class="absolute inset-0">
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="브랜드 소개 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Introduction</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">브랜드 소개</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/intro/greeting" class="hover:text-primary transition-colors">소개</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">브랜드 소개</span>
    </div>
  </div>

  <!-- 브랜드 네임 섹션 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-16">

      <!-- 브랜드명 의미 -->
      <div class="space-y-8">
        <div class="space-y-4">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">
            PILLGRIM SENIOR LAND
          </h2>
          <div class="w-16 h-1 bg-primary rounded-full"></div>
        </div>
        <p class="text-on-surface-variant text-lg leading-relaxed">
          필그림(Pilgrim)은 <strong class="text-on-surface font-semibold">순례자</strong>를 의미합니다. 긴 여정 끝에 만나는 편안한 안식처이자 다채로운 즐거움이 있는 곳, 품격 있는 인생의 새로운 시작을 함께합니다.
        </p>
      </div>

      <!-- 브랜드 가치 3가지 -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="p-8 bg-surface-container-low rounded-xl border-t-4 border-primary space-y-4">
          <span class="material-symbols-outlined text-primary text-4xl block">home_heart</span>
          <h3 class="font-headline text-xl font-bold text-on-background">안식처</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">긴 인생 여정 끝에 만나는 편안하고 따뜻한 보금자리를 제공합니다.</p>
        </div>
        <div class="p-8 bg-surface-container-low rounded-xl border-t-4 border-primary space-y-4">
          <span class="material-symbols-outlined text-primary text-4xl block">celebration</span>
          <h3 class="font-headline text-xl font-bold text-on-background">즐거움</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">다채로운 문화·여가 프로그램으로 매일이 특별한 일상을 만들어갑니다.</p>
        </div>
        <div class="p-8 bg-surface-container-low rounded-xl border-t-4 border-primary space-y-4">
          <span class="material-symbols-outlined text-primary text-4xl block">star</span>
          <h3 class="font-headline text-xl font-bold text-on-background">품격</h3>
          <p class="text-sm text-on-surface-variant leading-relaxed">인생의 새로운 시작을 품격 있게 맞이할 수 있는 최상의 환경을 갖춥니다.</p>
        </div>
      </div>

      <!-- 브랜드 스토리 -->
      <div class="space-y-6">
        <h2 class="font-headline text-2xl font-bold text-on-background">브랜드 스토리</h2>
        <div class="w-16 h-1 bg-primary rounded-full"></div>
        <div class="space-y-5 text-on-surface-variant leading-relaxed text-lg">
          <p>
            필그림시니어랜드는 어르신들이 인생의 황금기를 더욱 빛나게 보낼 수 있도록 설계된 프리미엄 시니어 레지던스입니다.
          </p>
          <p>
            단순한 주거 공간을 넘어, 건강·문화·여가·영성이 어우러진 복합 생활 공간으로서 어르신들의 삶의 질을 높이고 행복한 노년을 지원합니다.
          </p>
          <p>
            전문 의료진과 케어 시스템, 다양한 커뮤니티 프로그램, 그리고 지역사회와의 연계를 통해 필그림시니어랜드만의 특별한 시니어 라이프를 만들어갑니다.
          </p>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/intro/greeting"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        인사말
      </a>
      <a href="${pageContext.request.contextPath}/intro/vision"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        비전
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

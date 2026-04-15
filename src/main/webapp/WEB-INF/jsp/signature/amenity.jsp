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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_02.jpg" alt="편의시설 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Signature</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">편의시설</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/signature/intro" class="hover:text-primary transition-colors">시그니처</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">편의시설</span>
    </div>
  </div>

  <!-- 이미지 갤러리 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-6">

      <div class="space-y-3">
        <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">편의시설 안내</h2>
        <div class="w-12 h-1 bg-primary rounded-full"></div>
      </div>

      <div class="space-y-4">
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/편의시설_01.jpg"
               alt="편의시설 01">
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/편의시설_02.jpg"
               alt="편의시설 02">
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/편의시설_03.jpg"
               alt="편의시설 03">
        </div>
      </div>

      <!-- 유의사항 -->
      <div class="mt-10 p-6 bg-surface-container-low rounded-xl border border-outline-variant/20 space-y-3">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-symbols-outlined text-outline text-lg">info</span>
          <h3 class="font-semibold text-on-surface text-sm">※ 유의사항</h3>
        </div>
        <ul class="space-y-2.5 text-xs text-on-surface-variant leading-relaxed">
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>상기 배치도는 소비자의 이해를 돕기 위한 것으로 실제와는 차이가 있을 수 있으며, 형태 구성 사용자의 동선, 실내구획 및 마감재는 인허가 과정이나 시공 시 현장 여건에 따라 일부 변경될 수 있습니다.</span>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>커뮤니티의 기본 시설 및 기본 마감재 (벽, 바닥 등) 붙박이형 가구(피트니스 운동기구, 이동식가구, 비품 등은 제외)가 설치되며, 배치 및 형태, 수량은 변경될 수 있습니다.</span>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>내부 레이아웃 (시공품목의 형태, 수량, 위치 등)은 변경될 수 있습니다.</span>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>상기 커뮤니티 시설 중 일부는 유료로 운영됩니다.</span>
          </li>
        </ul>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/signature/floor"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        층별 안내
      </a>
      <a href="${pageContext.request.contextPath}/residence/typemap"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        주거공간
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

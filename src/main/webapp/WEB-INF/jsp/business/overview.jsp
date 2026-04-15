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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="사업개요 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Business</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">사업개요</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">사업개요</span>
    </div>
  </div>

  <!-- 본문 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-16">

      <!-- 단지 개요 테이블 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">단지 개요</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface w-32 md:w-40 whitespace-nowrap">단지명</th>
                <td class="px-6 py-4 text-on-surface font-semibold text-base">횡성 필그램 시니어랜드</td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">위치</th>
                <td class="px-6 py-4 text-on-surface-variant">강원특별자치도 횡성군 우천면 상대리 산2 일대</td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">건축면적</th>
                <td class="px-6 py-4 text-on-surface-variant">11,044,206㎡</td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">연면적</th>
                <td class="px-6 py-4 text-on-surface-variant">43,936,904㎡</td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">규모</th>
                <td class="px-6 py-4 text-on-surface-variant">10개동 (지하1층, 지상4층)</td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">세대수</th>
                <td class="px-6 py-4 text-on-surface-variant">497 세대</td>
              </tr>
              <tr>
                <th class="bg-surface-container px-6 py-4 text-left font-semibold text-on-surface whitespace-nowrap">입주시기</th>
                <td class="px-6 py-4 text-on-surface-variant">20xx년 예상</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- 타입별 세대수 테이블 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">노인복지주택 타입 및 세대수</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow">
          <table class="w-full text-sm">
            <thead>
              <tr class="bg-primary text-on-primary">
                <th class="px-6 py-4 text-center font-semibold">타입</th>
                <th class="px-6 py-4 text-center font-semibold">층수</th>
                <th class="px-6 py-4 text-center font-semibold">평형</th>
                <th class="px-6 py-4 text-center font-semibold">세대수</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-4 text-center font-semibold text-primary">A타입</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">1층</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">33평형</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">121세대</td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-4 text-center font-semibold text-primary">B타입</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">2층</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">27평형</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">124세대</td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-4 text-center font-semibold text-primary">C타입</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">3층</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">24평형</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">126세대</td>
              </tr>
              <tr class="hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-4 text-center font-semibold text-primary">D타입</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">4층</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">22평형</td>
                <td class="px-6 py-4 text-center text-on-surface-variant">126세대</td>
              </tr>
            </tbody>
            <tfoot>
              <tr class="bg-surface-container border-t-2 border-primary">
                <td colspan="3" class="px-6 py-4 text-center font-semibold text-on-surface">합계</td>
                <td class="px-6 py-4 text-center font-bold text-primary">497세대</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>

      <!-- 주요 수치 하이라이트 -->
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="block font-headline text-3xl font-bold text-primary mb-1">10개동</span>
          <span class="text-xs text-outline uppercase tracking-widest">규모</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="block font-headline text-3xl font-bold text-primary mb-1">497세대</span>
          <span class="text-xs text-outline uppercase tracking-widest">총 세대수</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="block font-headline text-3xl font-bold text-primary mb-1">4개 타입</span>
          <span class="text-xs text-outline uppercase tracking-widest">주거 유형</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="block font-headline text-3xl font-bold text-primary mb-1">지상 4층</span>
          <span class="text-xs text-outline uppercase tracking-widest">건물 규모</span>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <span class="text-on-surface-variant text-sm">사업정보</span>
      <a href="${pageContext.request.contextPath}/business/site"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        사업지 소개
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

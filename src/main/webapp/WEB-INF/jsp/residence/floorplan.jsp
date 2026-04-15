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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="평면소개 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Residence</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">평면소개</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/residence/typemap" class="hover:text-primary transition-colors">주거공간</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">평면소개</span>
    </div>
  </div>

  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-20">

      <!-- A타입 -->
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="space-y-1">
            <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full mb-2">A타입 (1층)</span>
            <h2 class="font-headline text-2xl font-bold text-on-background">A타입</h2>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/1F-A.jpg"
                 alt="A타입">
          </div>
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/1F-A_평면.jpg"
                 alt="A타입 평면도">
          </div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">세대수</th>
                <td class="px-5 py-3 text-on-surface-variant">121 세대</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">전용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">47.71㎡ (14.43평)</td>
              </tr>
              <tr>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">공용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">59.27㎡ (17.93평)</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">임대면적</th>
                <td class="px-5 py-3 text-on-surface-variant">106.98㎡ (32.36평)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- B타입 -->
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="space-y-1">
            <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full mb-2">B타입 (2층)</span>
            <h2 class="font-headline text-2xl font-bold text-on-background">B타입</h2>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/2F-B.jpg"
                 alt="B타입">
          </div>
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/2F-B(평면).jpg"
                 alt="B타입 평면도">
          </div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">세대수</th>
                <td class="px-5 py-3 text-on-surface-variant">124 세대</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">전용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">38.71㎡ (11.71평)</td>
              </tr>
              <tr>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">공용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">48.09㎡ (14.55평)</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">임대면적</th>
                <td class="px-5 py-3 text-on-surface-variant">86.80㎡ (26.26평)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- C타입 -->
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="space-y-1">
            <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full mb-2">C타입 (3층)</span>
            <h2 class="font-headline text-2xl font-bold text-on-background">C타입</h2>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/3F-C.jpg"
                 alt="C타입">
          </div>
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/3F-C(평면).jpg"
                 alt="C타입 평면도">
          </div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">세대수</th>
                <td class="px-5 py-3 text-on-surface-variant">126 세대</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">전용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">35.71㎡ (10.80평)</td>
              </tr>
              <tr>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">공용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">44.36㎡ (13.42평)</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">임대면적</th>
                <td class="px-5 py-3 text-on-surface-variant">80.07㎡ (24.22평)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- D타입 -->
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="space-y-1">
            <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full mb-2">D타입 (4층)</span>
            <h2 class="font-headline text-2xl font-bold text-on-background">D타입</h2>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/4F-D.jpg"
                 alt="D타입">
          </div>
          <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow bg-white p-4">
            <img class="w-full h-auto"
                 src="${pageContext.request.contextPath}/resources/images/4F-D(평면).jpg"
                 alt="D타입 평면도">
          </div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">세대수</th>
                <td class="px-5 py-3 text-on-surface-variant">126 세대</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface w-28">전용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">32.71㎡ (9.90평)</td>
              </tr>
              <tr>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">공용면적</th>
                <td class="px-5 py-3 text-on-surface-variant">40.64㎡ (12.29평)</td>
                <th class="bg-surface-container px-5 py-3 text-left font-semibold text-on-surface">임대면적</th>
                <td class="px-5 py-3 text-on-surface-variant">73.35㎡ (22.19평)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- 합계 테이블 -->
      <div class="space-y-4">
        <h2 class="font-headline text-xl font-bold text-on-background">전체 세대 현황</h2>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow">
          <table class="w-full text-sm">
            <thead>
              <tr class="bg-primary text-on-primary">
                <th class="px-5 py-4 text-center font-semibold">구분</th>
                <th class="px-5 py-4 text-center font-semibold">세대수</th>
                <th class="px-5 py-4 text-center font-semibold">전용면적 (평)</th>
                <th class="px-5 py-4 text-center font-semibold">공용면적 (평)</th>
                <th class="px-5 py-4 text-center font-semibold">임대면적 (평)</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-5 py-4 text-center font-semibold text-primary">A타입 (1층)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">121 세대</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">47.71㎡ (14.43평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">59.27㎡ (17.93평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">106.98㎡ (32.36평)</td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-5 py-4 text-center font-semibold text-primary">B타입 (2층)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">124 세대</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">38.71㎡ (11.71평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">48.09㎡ (14.55평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">86.80㎡ (26.26평)</td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-5 py-4 text-center font-semibold text-primary">C타입 (3층)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">126 세대</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">35.71㎡ (10.80평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">44.36㎡ (13.42평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">80.07㎡ (24.22평)</td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-5 py-4 text-center font-semibold text-primary">D타입 (4층)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">126 세대</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">32.71㎡ (9.90평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">40.64㎡ (12.29평)</td>
                <td class="px-5 py-4 text-center text-on-surface-variant">73.35㎡ (22.19평)</td>
              </tr>
              <tr class="bg-surface-container border-t-2 border-primary">
                <td class="px-5 py-4 text-center font-bold text-on-surface">합계</td>
                <td class="px-5 py-4 text-center font-bold text-primary">497 세대</td>
                <td class="px-5 py-4 text-center font-semibold text-on-surface-variant">19,193.87㎡ (5,806.14평)</td>
                <td class="px-5 py-4 text-center font-semibold text-on-surface-variant">23,844.30㎡ (4,474.58평)</td>
                <td class="px-5 py-4 text-center font-semibold text-on-surface-variant">43,038.17㎡ (13,018.99평)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- 유의사항 -->
      <div class="p-6 bg-surface-container-low rounded-xl border border-outline-variant/20 space-y-3">
        <div class="flex items-center gap-2 mb-4">
          <span class="material-symbols-outlined text-outline text-lg">info</span>
          <h3 class="font-semibold text-on-surface text-sm">※ 유의사항</h3>
        </div>
        <ul class="space-y-2.5 text-xs text-on-surface-variant leading-relaxed">
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>상기 이미지는 소비자의 이해를 돕기 위한 것이므로 실제와 차이가 있을 수 있으며 추후 인허가, 협의 등에 따라 색체, 형태, 면적 등이 변경될 수 있습니다.</span>
          </li>
        </ul>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/residence/typemap"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        타입별 위치도
      </a>
      <span class="text-on-surface-variant text-sm">주거공간</span>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="타입별 위치도 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Residence</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">타입별 위치도</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">주거공간</span>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">타입별 위치도</span>
    </div>
  </div>

  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-16">

      <!-- A타입 -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
          <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full">A타입 (1층)</span>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/Atype_1F.png"
               alt="A타입 1층 위치도">
        </div>
      </div>

      <!-- B타입 -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
          <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full">B타입 (2층)</span>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/Btype_2F.png"
               alt="B타입 2층 위치도">
        </div>
      </div>

      <!-- C타입 -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
          <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full">C타입 (3층)</span>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/Ctype_3F.png"
               alt="C타입 3층 위치도">
        </div>
      </div>

      <!-- D타입 -->
      <div class="space-y-4">
        <div class="flex items-center gap-4">
          <span class="inline-block bg-primary text-on-primary text-sm font-bold px-4 py-1.5 rounded-full">D타입 (4층)</span>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/Dtype_4F.png"
               alt="D타입 4층 위치도">
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
            <span>상기 이미지는 소비자의 이해를 돕기 위한 것이므로 실제와 차이가 있을 수 있으니, 현장을 반드시 확인하시기 바랍니다.</span>
          </li>
          <li class="flex items-start gap-2">
            <span class="text-outline mt-0.5 flex-shrink-0">·</span>
            <span>단지 설계사항들은 추후 완공 시 변경될 수 있으며 실제와 차이가 있을 수 있으므로 이와 관련하여 반드시 확인하시기 바랍니다.</span>
          </li>
        </ul>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <span class="text-on-surface-variant text-sm">주거공간</span>
      <a href="${pageContext.request.contextPath}/residence/floorplan"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        평면소개
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

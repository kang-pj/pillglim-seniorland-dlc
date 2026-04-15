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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_02.jpg" alt="층별 안내 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Signature</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">층별 안내</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/signature/intro" class="hover:text-primary transition-colors">시그니처</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">층별 안내</span>
    </div>
  </div>

  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-12">

      <!-- 단지 이미지 -->
      <div class="space-y-4">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">단지 전경</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/Image_l0hdmml0hdmml0hd.png"
               alt="단지 전경">
        </div>
      </div>

      <!-- 층별 안내 테이블 -->
      <div class="space-y-4">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">층별 시설 안내</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow">
          <table class="w-full text-sm">
            <thead>
              <tr class="bg-primary text-on-primary">
                <th class="px-6 py-4 text-center font-semibold w-20">층</th>
                <th class="px-6 py-4 text-center font-semibold w-40">용도</th>
                <th class="px-6 py-4 text-center font-semibold w-32">구분</th>
                <th class="px-6 py-4 text-left font-semibold">주요 시설</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-5 text-center font-headline font-bold text-primary text-lg">4F</td>
                <td class="px-6 py-5 text-center text-on-surface-variant">
                  노인복지시설<br><span class="text-xs text-outline">(D-TYPE)</span>
                </td>
                <td class="px-6 py-5 text-center">
                  <span class="inline-block bg-primary/10 text-primary text-xs font-semibold px-3 py-1 rounded-full">복리시설-1</span>
                </td>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  로비, 카페&amp;베이커리, 내과&amp;투석실, 한의원, 치과, 다목적홀, 비즈니스실, 영화관람실, 노래방
                </td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-5 text-center font-headline font-bold text-primary text-lg">3F</td>
                <td class="px-6 py-5 text-center text-on-surface-variant">
                  노인복지시설<br><span class="text-xs text-outline">(C-TYPE)</span>
                </td>
                <td class="px-6 py-5 text-center">
                  <span class="inline-block bg-primary/10 text-primary text-xs font-semibold px-3 py-1 rounded-full">복리시설-2</span>
                </td>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  아동돌봄실, 아동놀이터, 헬스장, 수영장, 목욕탕, 스크린골프장, 요가&amp;명상실, 식당, 게스트하우스, 미용실, 피부테라피, 식료품점
                </td>
              </tr>
              <tr class="border-b border-outline-variant/20 hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-5 text-center font-headline font-bold text-primary text-lg">2F</td>
                <td class="px-6 py-5 text-center text-on-surface-variant">
                  노인복지시설<br><span class="text-xs text-outline">(B-TYPE)</span>
                </td>
                <td class="px-6 py-5 text-center">
                  <span class="inline-block bg-primary/10 text-primary text-xs font-semibold px-3 py-1 rounded-full">복리시설-3</span>
                </td>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  프로그램실, 식당, 실내 체육관, 주차장
                </td>
              </tr>
              <tr class="hover:bg-surface-container-low transition-colors">
                <td class="px-6 py-5 text-center font-headline font-bold text-primary text-lg">1F</td>
                <td class="px-6 py-5 text-center text-on-surface-variant">
                  노인복지시설<br><span class="text-xs text-outline">(A-TYPE)</span>
                </td>
                <td class="px-6 py-5 text-center">
                  <span class="inline-block bg-outline/10 text-outline text-xs font-semibold px-3 py-1 rounded-full">부대시설</span>
                </td>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  주차장, 기계실, 전기실
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/signature/community"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        커뮤니티
      </a>
      <a href="${pageContext.request.contextPath}/signature/amenity"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        편의시설
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_01.png" alt="사업지 소개 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Business</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">사업지 소개</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/business/overview" class="hover:text-primary transition-colors">사업정보</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">사업지 소개</span>
    </div>
  </div>

  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto space-y-16">

      <!-- 위치 정보 이미지 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">위치 정보</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant">강원특별자치도 횡성군 우천면 상대리 산2 일대</p>
        </div>
        <div class="rounded-xl overflow-hidden border border-outline-variant/30 ambient-shadow">
          <img class="w-full h-auto"
               src="${pageContext.request.contextPath}/resources/images/5e79c5c1-5b40-45fd-b42d-18f4e702dfbd.jpeg"
               alt="사업지 위치 정보">
        </div>
      </div>

      <!-- 왜 횡성인가 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">왜 횡성인가?</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="overflow-hidden rounded-xl border border-outline-variant/30 ambient-shadow">
          <table class="w-full text-sm">
            <tbody>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-5 text-center font-semibold text-on-surface w-36 md:w-44 align-top leading-relaxed">
                  횡성군 4대<br>전략목표
                </th>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  상식과 소통의 행정과 함께 활력경제를 이끌며 행복 복지와 앞은 미래를 보장하는 지자체
                </td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-5 text-center font-semibold text-on-surface align-middle">
                  편리한 접근성
                </th>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  수도권에서 1시간 거리, KTX역사에서 10분 거리, 새말IC에서 5분 거리
                </td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-5 text-center font-semibold text-on-surface align-top leading-relaxed">
                  가까운<br>의료시설
                </th>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  30분 거리에 위치한 원주 세브란스 기독병원, 체시설내 긴급 의료환차를 위한 24시간 의료진 대기
                </td>
              </tr>
              <tr class="border-b border-outline-variant/20">
                <th class="bg-surface-container px-6 py-5 text-center font-semibold text-on-surface align-top leading-relaxed">
                  풍부한<br>주변관광자원
                </th>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  30분 이내에 가족과 즐길 수 있는 관광지와 동해권 관광의 길목에 위치
                </td>
              </tr>
              <tr>
                <th class="bg-surface-container px-6 py-5 text-center font-semibold text-on-surface align-top leading-relaxed">
                  다양한<br>생활문화시설
                </th>
                <td class="px-6 py-5 text-on-surface-variant leading-relaxed">
                  이마트 원주점, 춘천점 원주K백화점, 여주 프리미엄 아울렛 단지 40분 거리
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- 입지 하이라이트 -->
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="material-symbols-outlined text-primary text-3xl mb-3 block">directions_car</span>
          <span class="block font-headline text-xl font-bold text-primary mb-1">1시간</span>
          <span class="text-xs text-outline">수도권에서</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="material-symbols-outlined text-primary text-3xl mb-3 block">train</span>
          <span class="block font-headline text-xl font-bold text-primary mb-1">10분</span>
          <span class="text-xs text-outline">KTX역사에서</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="material-symbols-outlined text-primary text-3xl mb-3 block">local_hospital</span>
          <span class="block font-headline text-xl font-bold text-primary mb-1">30분</span>
          <span class="text-xs text-outline">세브란스병원</span>
        </div>
        <div class="text-center p-6 bg-surface-container-low rounded-xl border border-outline-variant/20">
          <span class="material-symbols-outlined text-primary text-3xl mb-3 block">travel_explore</span>
          <span class="block font-headline text-xl font-bold text-primary mb-1">30분</span>
          <span class="text-xs text-outline">주변 관광지</span>
        </div>
      </div>

      <!-- 구글 지도 영역 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">오시는 길</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div id="map" class="w-full h-[450px] rounded-xl border border-outline-variant/30 ambient-shadow bg-surface-container flex items-center justify-center">
          <div class="text-center space-y-3 text-on-surface-variant">
            <span class="material-symbols-outlined text-5xl text-outline">map</span>
            <p class="text-sm">지도 영역 (Google Maps API 연동 예정)</p>
          </div>
        </div>
      </div>

      <!-- 주변 시설 -->
      <div class="space-y-6">
        <div class="space-y-3">
          <h2 class="font-headline text-2xl md:text-3xl font-bold text-on-background">주변 시설</h2>
          <div class="w-12 h-1 bg-primary rounded-full"></div>
        </div>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
          <div class="group rounded-xl overflow-hidden border border-outline-variant/20 ambient-shadow hover:-translate-y-1 transition-all duration-300">
            <div class="h-48 overflow-hidden">
              <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                   src="${pageContext.request.contextPath}/resources/images/hospital-1000-559.jpg"
                   alt="병원">
            </div>
            <div class="p-4 bg-surface-container-low">
              <span class="material-symbols-outlined text-primary text-xl block mb-1">local_hospital</span>
              <p class="font-semibold text-on-surface text-sm">병원</p>
              <p class="text-xs text-on-surface-variant mt-1">원주 세브란스 기독병원</p>
            </div>
          </div>
          <div class="group rounded-xl overflow-hidden border border-outline-variant/20 ambient-shadow hover:-translate-y-1 transition-all duration-300">
            <div class="h-48 overflow-hidden">
              <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                   src="${pageContext.request.contextPath}/resources/images/E-1000-559.jpg"
                   alt="이마트 원주점">
            </div>
            <div class="p-4 bg-surface-container-low">
              <span class="material-symbols-outlined text-primary text-xl block mb-1">shopping_cart</span>
              <p class="font-semibold text-on-surface text-sm">이마트 원주점</p>
              <p class="text-xs text-on-surface-variant mt-1">대형 마트 쇼핑</p>
            </div>
          </div>
          <div class="group rounded-xl overflow-hidden border border-outline-variant/20 ambient-shadow hover:-translate-y-1 transition-all duration-300">
            <div class="h-48 overflow-hidden">
              <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                   src="${pageContext.request.contextPath}/resources/images/K-1000-559.png"
                   alt="원주K백화점">
            </div>
            <div class="p-4 bg-surface-container-low">
              <span class="material-symbols-outlined text-primary text-xl block mb-1">store</span>
              <p class="font-semibold text-on-surface text-sm">원주K백화점</p>
              <p class="text-xs text-on-surface-variant mt-1">프리미엄 쇼핑</p>
            </div>
          </div>
          <div class="group rounded-xl overflow-hidden border border-outline-variant/20 ambient-shadow hover:-translate-y-1 transition-all duration-300">
            <div class="h-48 overflow-hidden">
              <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                   src="${pageContext.request.contextPath}/resources/images/subway-station.png"
                   alt="횡성역">
            </div>
            <div class="p-4 bg-surface-container-low">
              <span class="material-symbols-outlined text-primary text-xl block mb-1">train</span>
              <p class="font-semibold text-on-surface text-sm">횡성역</p>
              <p class="text-xs text-on-surface-variant mt-1">KTX 10분 거리</p>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/business/overview"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        사업개요
      </a>
      <a href="${pageContext.request.contextPath}/signature/premium"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        프리미엄
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

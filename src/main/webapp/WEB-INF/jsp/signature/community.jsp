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
      <img class="w-full h-full object-cover" src="${pageContext.request.contextPath}/resources/images/sub_banner_02.jpg" alt="커뮤니티 배너">
      <div class="absolute inset-0 bg-gradient-to-b from-black/30 to-black/60"></div>
    </div>
    <div class="relative z-10 max-w-7xl mx-auto px-8 pb-12 w-full">
      <p class="text-white/70 text-sm font-label uppercase tracking-widest mb-2">Signature</p>
      <h1 class="font-headline text-3xl md:text-5xl font-bold text-white">커뮤니티</h1>
    </div>
  </section>

  <!-- 브레드크럼 -->
  <div class="border-b border-outline-variant/30 bg-surface-container-low">
    <div class="max-w-7xl mx-auto px-8 py-3 flex items-center gap-2 text-sm text-on-surface-variant">
      <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">홈</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <a href="${pageContext.request.contextPath}/signature/intro" class="hover:text-primary transition-colors">시그니처</a>
      <span class="material-symbols-outlined text-sm">chevron_right</span>
      <span class="text-on-surface font-medium">커뮤니티</span>
    </div>
  </div>

  <!-- 인트로 -->
  <section class="py-24 px-8">
    <div class="max-w-4xl mx-auto text-center space-y-6">
      <p class="text-primary text-sm font-label uppercase tracking-widest">Community</p>
      <h2 class="font-headline text-3xl md:text-4xl font-bold text-on-background leading-tight">
        머무는 곳이 곧 행복이 되는<br>시니어랜드의 커뮤니티
      </h2>
      <p class="text-on-surface-variant text-lg leading-relaxed max-w-2xl mx-auto">
        건강·문화·생활이 하나로 연결된 필그림시니어랜드만의 특별한 커뮤니티 공간에서 매일을 풍요롭게 채워가세요.
      </p>
    </div>
  </section>

  <!-- 01. 메디컬 서비스 -->
  <section class="py-16 px-8 bg-surface-container-low">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
        <div class="space-y-4">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">local_hospital</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Medical Service</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">메디컬 서비스</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed">
            시니어를 위한 세심한 건강관리. 다양한 전문 의료 시설을 단지 내에서 편리하게 이용할 수 있습니다.
          </p>
        </div>
        <div class="lg:col-span-2 grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">medical_services</span>
            <span class="text-sm text-on-surface">가정의학과</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">dentistry</span>
            <span class="text-sm text-on-surface">치과</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">spa</span>
            <span class="text-sm text-on-surface">한의원</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">bed</span>
            <span class="text-sm text-on-surface">입원실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">water_drop</span>
            <span class="text-sm text-on-surface">신장 투석실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">accessibility_new</span>
            <span class="text-sm text-on-surface">물리치료실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">medication</span>
            <span class="text-sm text-on-surface">약국</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 02. 헬스케어 서비스 -->
  <section class="py-16 px-8 bg-surface">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
        <div class="space-y-4">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">fitness_center</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Healthcare Service</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">헬스케어 서비스</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed">
            시니어 운동 프로그램을 제공합니다. 개별 맞춤 운동 지도와 각종 운동 시설 운영으로 건강한 일상을 지원합니다.
          </p>
        </div>
        <div class="lg:col-span-2 grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div class="p-6 bg-primary/5 rounded-xl border border-primary/20 space-y-2">
            <span class="material-symbols-outlined text-primary text-2xl block">person</span>
            <h4 class="font-semibold text-on-background">개별 맞춤 운동 지도</h4>
            <p class="text-sm text-on-surface-variant">전문 트레이너가 개인 건강 상태에 맞는 운동 프로그램을 설계하고 지도합니다.</p>
          </div>
          <div class="p-6 bg-primary/5 rounded-xl border border-primary/20 space-y-2">
            <span class="material-symbols-outlined text-primary text-2xl block">sports_gymnastics</span>
            <h4 class="font-semibold text-on-background">각종 운동시설 운영</h4>
            <p class="text-sm text-on-surface-variant">수영장, 헬스장, 요가실 등 다양한 운동 시설을 갖추어 건강한 생활을 지원합니다.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 03. 문화여가 서비스 -->
  <section class="py-16 px-8 bg-surface-container-low">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
        <div class="space-y-4">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">theater_comedy</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Culture & Leisure</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">문화여가 서비스</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed">
            일상의 행복을 충전할 다양한 문화여가 프로그램. 취미부터 교육까지 풍요로운 시간을 만들어드립니다.
          </p>
        </div>
        <div class="lg:col-span-2 grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">menu_book</span>
            <span class="text-sm text-on-surface">북 라운지 / 도서관</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">movie</span>
            <span class="text-sm text-on-surface">영화감상실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">computer</span>
            <span class="text-sm text-on-surface">IT교육실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">mic</span>
            <span class="text-sm text-on-surface">노래방</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">draw</span>
            <span class="text-sm text-on-surface">서예실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">event</span>
            <span class="text-sm text-on-surface">다목적 홀</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">restaurant</span>
            <span class="text-sm text-on-surface">요리교실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">casino</span>
            <span class="text-sm text-on-surface">게임룸 (바둑/장기)</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">palette</span>
            <span class="text-sm text-on-surface">취미실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">travel_explore</span>
            <span class="text-sm text-on-surface">여행코너</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 04. 생활 편의 시설 -->
  <section class="py-16 px-8 bg-surface">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
        <div class="space-y-4">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary flex items-center justify-center flex-shrink-0">
              <span class="material-symbols-outlined text-white text-xl">store</span>
            </div>
            <div>
              <p class="text-primary text-xs font-label uppercase tracking-widest">Living Convenience</p>
              <h3 class="font-headline text-2xl font-bold text-on-background">생활 편의 시설</h3>
            </div>
          </div>
          <div class="w-12 h-0.5 bg-primary rounded-full"></div>
          <p class="text-on-surface-variant leading-relaxed">
            영양사가 관리하는 맞춤형 식단과 여유롭고 편안한 생활 지원 및 금융서비스를 제공합니다.
          </p>
        </div>
        <div class="lg:col-span-2 grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">account_balance</span>
            <span class="text-sm text-on-surface">은행</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">business_center</span>
            <span class="text-sm text-on-surface">비즈니스센터</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">restaurant</span>
            <span class="text-sm text-on-surface">입주자식당</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">meeting_room</span>
            <span class="text-sm text-on-surface">면회장</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">outdoor_grill</span>
            <span class="text-sm text-on-surface">오픈키친</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">coffee</span>
            <span class="text-sm text-on-surface">카페 &amp; 베이커리</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">hotel</span>
            <span class="text-sm text-on-surface">게스트룸</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">shopping_bag</span>
            <span class="text-sm text-on-surface">식품매장</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">child_care</span>
            <span class="text-sm text-on-surface">어린이집</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">local_laundry_service</span>
            <span class="text-sm text-on-surface">세탁소</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">content_cut</span>
            <span class="text-sm text-on-surface">이·미용실</span>
          </div>
          <div class="flex items-center gap-3 p-4 bg-surface-container-lowest rounded-lg border border-outline-variant/20">
            <span class="material-symbols-outlined text-primary text-lg flex-shrink-0">inventory_2</span>
            <span class="text-sm text-on-surface">개인창고</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 하단 네비게이션 -->
  <section class="py-12 px-8 bg-surface-container-low border-t border-outline-variant/20">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <a href="${pageContext.request.contextPath}/signature/premium"
         class="flex items-center gap-2 text-sm text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-sm">arrow_back</span>
        프리미엄
      </a>
      <a href="${pageContext.request.contextPath}/signature/plan"
         class="flex items-center gap-2 text-sm text-primary font-semibold hover:underline">
        시설 계획
        <span class="material-symbols-outlined text-sm">arrow_forward</span>
      </a>
    </div>
  </section>

</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>

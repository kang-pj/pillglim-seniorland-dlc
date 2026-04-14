<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="ko">
<head>
  <title>필그림시니어랜드 - 건강하고 행복한 노년</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="bg-surface text-on-surface font-body selection:bg-primary-container selection:text-on-primary-container">

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main>

  <!-- ① Hero -->
  <header class="relative min-h-[921px] flex items-center justify-center overflow-hidden px-8">
    <div class="absolute inset-0 z-0">
      <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[120%] h-[120%] opacity-20 pointer-events-none">
        <div class="w-full h-full hero-gradient blur-[120px] rounded-full animate-pulse"></div>
      </div>
      <img class="w-full h-full object-cover opacity-10"
           src="https://placehold.co/1920x1080/00658b/ffffff?text=Hero"
           alt="필그림시니어랜드 전경">
    </div>
    <div class="relative z-10 max-w-5xl text-center space-y-12">
      <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-tertiary-container text-on-tertiary-container font-label text-sm font-semibold tracking-wide uppercase">
        <span class="material-symbols-outlined text-sm">verified</span>
        프리미엄 시니어 레지던스
      </div>
      <h1 class="font-headline font-bold text-4xl md:text-7xl lg:text-8xl text-on-background leading-[1.1] tracking-tight">
        삶의 품격을 높이는 시작,<br>
        <span class="text-primary italic">완벽한 선택</span>
      </h1>
      <p class="max-w-2xl mx-auto text-base md:text-xl text-on-surface-variant leading-relaxed">
        프라이빗한 휴식과 품격 있는 커뮤니티가 공존하는 필그림시니어랜드. 당신이 꿈꾸던 진정한 여유의 완성을 제안합니다.
      </p>
      <div class="flex flex-col sm:flex-row gap-6 justify-center pt-8">
        <a href="${pageContext.request.contextPath}/support/contact"
           class="px-10 py-4 rounded-full hero-gradient text-on-primary font-headline font-bold text-lg hover:scale-105 transition-transform duration-300 ambient-shadow">
          입주 문의하기
        </a>
        <a href="#about"
           class="px-10 py-4 rounded-full bg-surface-container-highest text-primary font-headline font-bold text-lg hover:scale-105 transition-transform duration-300">
          둘러보기
        </a>
      </div>
    </div>
  </header>

  <!-- ② About -->
  <section class="py-32 px-8 max-w-7xl mx-auto reveal" id="about">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-24 items-end mb-24">
      <div class="space-y-8">
        <h2 class="font-headline text-3xl md:text-5xl font-bold tracking-tight text-on-background">
          A Vision of<br>Eternal Serenity
        </h2>
        <p class="text-on-surface-variant text-lg leading-relaxed max-w-lg">
          필그림시니어랜드는 단순한 주거 공간을 넘어, 삶의 깊이를 더하는 예술적 공간을 추구합니다. 최고의 의료 시설과 전문 케어 시스템이 당신의 일상을 수호합니다.
        </p>
      </div>
      <div class="grid grid-cols-2 gap-4">
        <div class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block">location_on</span>
          <h3 class="font-headline text-xl font-bold mb-2">입지</h3>
          <p class="text-sm text-on-surface-variant">대전 도심 속 자연과 편의시설이 어우러진 최적의 입지</p>
        </div>
        <div class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block">shield_with_heart</span>
          <h3 class="font-headline text-xl font-bold mb-2">안전 케어</h3>
          <p class="text-sm text-on-surface-variant">24시간 전문 의료진 상주 및 정밀 케어 시스템</p>
        </div>
      </div>
    </div>
    <div class="relative rounded-xl overflow-hidden h-[500px]">
      <img class="w-full h-full object-cover"
           src="https://placehold.co/1400x500/c4e7ff/00658b?text=시설+전경"
           alt="필그림시니어랜드 시설">
      <div class="absolute bottom-8 left-8 right-8 grid grid-cols-1 md:grid-cols-3 gap-8 bg-white/40 backdrop-blur-md p-8 rounded-lg">
        <div class="text-on-background">
          <span class="text-3xl font-bold font-headline">52,000㎡</span>
          <p class="text-xs font-semibold uppercase tracking-widest text-primary mt-1">총 부지 면적</p>
        </div>
        <div class="text-on-background">
          <span class="text-3xl font-bold font-headline">320세대</span>
          <p class="text-xs font-semibold uppercase tracking-widest text-primary mt-1">프리미엄 주거</p>
        </div>
        <div class="text-on-background">
          <span class="text-3xl font-bold font-headline">24/7</span>
          <p class="text-xs font-semibold uppercase tracking-widest text-primary mt-1">컨시어지 서비스</p>
        </div>
      </div>
    </div>
  </section>

  <!-- ③ Amenities Bento Grid -->
  <section class="py-32 bg-surface-container-low px-8 reveal" id="amenities">
    <div class="max-w-7xl mx-auto">
      <div class="text-center mb-20 space-y-4">
        <h2 class="font-headline text-3xl md:text-5xl font-bold tracking-tight">The Art of Living</h2>
        <p class="text-on-surface-variant max-w-xl mx-auto">일상의 모든 순간이 특별해지는 프리미엄 어메니티를 경험하세요.</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 h-auto md:h-[800px]">
        <div class="md:col-span-2 md:row-span-1 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[300px] reveal reveal-delay-1">
               alt="파인 다이닝">
          <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">restaurant</span>
            <h3 class="text-2xl font-bold font-headline">파인 다이닝</h3>
            <p class="text-sm opacity-80">영양사가 설계한 유기농 고메 식단</p>
          </div>
        </div>
        <div class="md:col-span-1 md:row-span-2 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[300px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-80"
               src="https://placehold.co/400x800/77cefe/00658b?text=Wellness"
               alt="웰니스 허브">
          <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">fitness_center</span>
            <h3 class="text-2xl font-bold font-headline">웰니스 허브</h3>
            <p class="text-sm opacity-80">맞춤형 피트니스 &amp; 요가 클래스</p>
          </div>
        </div>
        <div class="md:col-span-1 md:row-span-1 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[300px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-80"
               src="https://placehold.co/400x400/cde6f4/00658b?text=Spa"
               alt="프라이빗 스파">
          <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">spa</span>
            <h3 class="text-2xl font-bold font-headline">프라이빗 스파</h3>
            <p class="text-sm opacity-80">심신을 치유하는 테라피</p>
          </div>
        </div>
        <div class="md:col-span-2 md:row-span-1 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[300px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-80"
               src="https://placehold.co/800x400/d5e3fd/00658b?text=Social+Lounge"
               alt="소셜 라운지">
          <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">auto_stories</span>
            <h3 class="text-2xl font-bold font-headline">소셜 라운지</h3>
            <p class="text-sm opacity-80">문화와 예술이 흐르는 커뮤니티 공간</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ④ Housing -->
  <section class="py-32 px-8 max-w-7xl mx-auto reveal" id="housing">
    <div class="flex flex-col md:flex-row justify-between items-end gap-8 mb-20">
      <div class="space-y-4">
        <h2 class="font-headline text-3xl md:text-4xl font-bold tracking-tight">Refined Living Spaces</h2>
        <p class="text-on-surface-variant">오직 당신을 위한 맞춤형 공간 설계</p>
      </div>
      <div class="flex gap-4 font-headline text-sm font-semibold overflow-x-auto pb-2">
        <button class="px-6 py-2 rounded-full border-2 border-primary bg-primary text-on-primary whitespace-nowrap">그랜드 스위트</button>
        <button class="px-6 py-2 rounded-full border-2 border-outline-variant hover:border-primary transition-colors whitespace-nowrap">가든 테라스</button>
        <button class="px-6 py-2 rounded-full border-2 border-outline-variant hover:border-primary transition-colors whitespace-nowrap">스탠다드</button>
      </div>
    </div>
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
      <div class="lg:col-span-7 bg-white rounded-xl p-12 ambient-shadow border border-surface-container">
        <img class="w-full h-auto rounded-lg"
             src="https://placehold.co/800x500/f2f4f6/00658b?text=평면도"
             alt="평면도">
      </div>
      <div class="lg:col-span-5 space-y-12">
        <div class="space-y-4">
          <h3 class="font-headline text-3xl font-bold">그랜드 스위트</h3>
          <p class="text-on-surface-variant leading-relaxed">파노라마 뷰를 품은 거실과 최고급 천연 소재로 마감된 인테리어. 최첨단 IoT 케어 시스템이 내장된 마스터 룸이 제공됩니다.</p>
        </div>
        <div class="space-y-6">
          <div class="flex justify-between border-b border-outline-variant pb-4">
            <span class="text-on-surface-variant">전용 면적</span>
            <span class="font-bold">152㎡</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-4">
            <span class="text-on-surface-variant">침실 / 욕실</span>
            <span class="font-bold">3 / 2</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-4">
            <span class="text-on-surface-variant">스마트 홈</span>
            <span class="font-bold">AI 케어 시스템</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-4">
            <span class="text-on-surface-variant">뷰</span>
            <span class="font-bold">파노라마 뷰</span>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/residence/floorplan"
           class="block w-full py-4 rounded-full border-2 border-primary text-primary font-headline font-bold text-center hover:bg-primary hover:text-on-primary transition-all">
          자세히 보기
        </a>
      </div>
    </div>
  </section>

  <!-- ⑤ Contact Form -->
  <section class="py-32 bg-primary-container/20 px-8 reveal" id="contact">
    <div class="max-w-3xl mx-auto text-center space-y-12">
      <div class="space-y-4">
        <h2 class="font-headline text-3xl md:text-4xl font-bold tracking-tight">Begin Your Journey</h2>
        <p class="text-on-surface-variant">필그림시니어랜드의 특별한 일상을 직접 확인하세요. 전문 상담사가 24시간 이내에 연락드립니다.</p>
      </div>
      <form action="${pageContext.request.contextPath}/support/contact" method="post"
            class="space-y-8 bg-surface p-12 rounded-xl ambient-shadow text-left">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
          <div class="space-y-2">
            <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">이름</label>
            <input type="text" name="name" placeholder="성함을 입력해주세요"
                   class="w-full bg-transparent border-0 border-b-2 border-outline-variant focus:ring-0 focus:border-primary transition-all py-3">
          </div>
          <div class="space-y-2">
            <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">연락처</label>
            <input type="tel" name="phone" placeholder="010-0000-0000"
                   class="w-full bg-transparent border-0 border-b-2 border-outline-variant focus:ring-0 focus:border-primary transition-all py-3">
          </div>
        </div>
        <div class="space-y-2">
          <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">관심 분야</label>
          <div class="flex flex-wrap gap-3 pt-2">
            <label class="cursor-pointer">
              <input class="hidden peer" name="interest" type="radio" value="입주 상담">
              <span class="px-6 py-2 rounded-full border-2 border-outline-variant peer-checked:border-primary peer-checked:bg-primary-container/30 transition-all text-sm">입주 상담</span>
            </label>
            <label class="cursor-pointer">
              <input class="hidden peer" name="interest" type="radio" value="현장 견학">
              <span class="px-6 py-2 rounded-full border-2 border-outline-variant peer-checked:border-primary peer-checked:bg-primary-container/30 transition-all text-sm">현장 견학</span>
            </label>
            <label class="cursor-pointer">
              <input class="hidden peer" name="interest" type="radio" value="카탈로그 요청">
              <span class="px-6 py-2 rounded-full border-2 border-outline-variant peer-checked:border-primary peer-checked:bg-primary-container/30 transition-all text-sm">카탈로그 요청</span>
            </label>
          </div>
        </div>
        <div class="space-y-2">
          <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">상담 내용</label>
          <textarea name="message" rows="4" placeholder="궁금하신 점을 남겨주세요"
                    class="w-full bg-transparent border-0 border-b-2 border-outline-variant focus:ring-0 focus:border-primary transition-all py-3 resize-none"></textarea>
        </div>
        <button type="submit"
                class="w-full py-4 rounded-full hero-gradient text-on-primary font-headline font-bold text-lg hover:scale-[1.01] transition-transform duration-300 shadow-lg">
          신청 완료하기
        </button>
      </form>
    </div>
  </section>

  <!-- ⑥ 공지사항 -->
  <section class="py-20 px-8 max-w-7xl mx-auto reveal">
    <div class="flex justify-between items-end mb-10">
      <h2 class="font-headline text-2xl font-bold text-on-background">공지사항</h2>
      <a href="${pageContext.request.contextPath}/support/notice"
         class="text-sm text-primary font-semibold hover:underline">더보기</a>
    </div>
    <ul>
      <c:choose>
        <c:when test="${empty recentNotices}">
          <li class="py-5 text-sm text-on-surface-variant border-t border-outline-variant/30">등록된 공지사항이 없습니다.</li>
        </c:when>
        <c:otherwise>
          <c:forEach var="notice" items="${recentNotices}">
            <li class="border-t border-outline-variant/30">
              <a href="${pageContext.request.contextPath}/support/notice/detail?id=${notice.id}"
                 class="flex justify-between items-center py-5 group hover:bg-surface-container-low px-2 -mx-2 transition-colors rounded-lg">
                <span class="text-sm text-on-surface group-hover:text-primary transition-colors">${notice.title}</span>
                <span class="text-xs text-outline whitespace-nowrap ml-8">
                  <fmt:formatDate value="${notice.createdAt}" pattern="yyyy.MM.dd"/>
                </span>
              </a>
            </li>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </ul>
  </section>

</main>

<!-- FAB -->
<a href="${pageContext.request.contextPath}/support/contact"
   class="fixed bottom-8 right-8 bg-primary text-on-primary w-14 h-14 rounded-full flex items-center justify-center shadow-lg hover:scale-110 transition-transform duration-300 z-40">
  <span class="material-symbols-outlined">chat</span>
</a>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script>
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
</script>
</body>
</html>

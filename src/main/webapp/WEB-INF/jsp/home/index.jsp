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

  <!-- ① Hero 배너 슬라이더 -->
  <header class="relative min-h-[921px] flex items-end overflow-hidden">
    <!-- 슬라이드 이미지 -->
    <div class="absolute inset-0 z-0">
      <div class="banner-slide absolute inset-0 transition-opacity duration-1000 opacity-100">
        <img class="w-full h-full object-cover"
             src="${pageContext.request.contextPath}/resources/images/main_banner_01.png"
             alt="필그림시니어랜드 배너 1">
        <div class="absolute inset-0 bg-gradient-to-b from-black/10 via-transparent to-black/70"></div>
      </div>
      <div class="banner-slide absolute inset-0 transition-opacity duration-1000 opacity-0">
        <img class="w-full h-full object-cover"
             src="${pageContext.request.contextPath}/resources/images/main_banner_02.png"
             alt="필그림시니어랜드 배너 2">
        <div class="absolute inset-0 bg-gradient-to-b from-black/10 via-transparent to-black/70"></div>
      </div>
    </div>

    <!-- 텍스트 콘텐츠 -->
    <div class="relative z-10 w-full px-12 pb-24 space-y-4">
      <p class="font-headline font-bold whitespace-nowrap text-[clamp(1.5rem,5vw,4.5rem)] tracking-[0.15em] uppercase text-white drop-shadow-lg">
        PILLGRIM SENIOR LAND
      </p>
      <h1 class="font-headline font-bold text-lg md:text-2xl lg:text-3xl text-white/90 leading-tight tracking-tight drop-shadow">
        삶의 품격을 높이는 시작,<br>
        성공한 당신의 완벽한 선택
      </h1>
      <div class="flex flex-col sm:flex-row gap-4 pt-2">
        <a href="${pageContext.request.contextPath}/support/contact"
           class="px-10 py-4 rounded-full hero-gradient text-on-primary font-headline font-bold text-lg hover:scale-105 transition-transform duration-300 ambient-shadow">
          입주 문의하기
        </a>
        <a href="#about"
           class="px-10 py-4 rounded-full bg-white/20 backdrop-blur-sm text-white font-headline font-bold text-lg hover:scale-105 hover:bg-white/30 transition-all duration-300">
          둘러보기
        </a>
      </div>
    </div>

    <!-- 슬라이드 인디케이터 -->
    <div class="absolute bottom-10 left-1/2 -translate-x-1/2 z-10 flex gap-3">
      <button class="banner-dot w-8 h-1.5 rounded-full bg-white transition-all duration-300" data-index="0"></button>
      <button class="banner-dot w-3 h-1.5 rounded-full bg-white/40 transition-all duration-300" data-index="1"></button>
    </div>
  </header>

  <script>
    (function() {
      const slides = document.querySelectorAll('.banner-slide');
      const dots = document.querySelectorAll('.banner-dot');
      let current = 0;

      function goTo(index) {
        slides[current].style.opacity = '0';
        dots[current].classList.remove('w-8', 'bg-white');
        dots[current].classList.add('w-3', 'bg-white/40');

        current = index;

        slides[current].style.opacity = '1';
        dots[current].classList.remove('w-3', 'bg-white/40');
        dots[current].classList.add('w-8', 'bg-white');
      }

      dots.forEach(dot => {
        dot.addEventListener('click', () => goTo(parseInt(dot.dataset.index)));
      });

      setInterval(() => goTo((current + 1) % slides.length), 3000);
    })();
  </script>

  <!-- ② About -->
  <section class="py-32 pb-12 px-8 max-w-7xl mx-auto reveal" id="about">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-24 items-center mb-24">
      <!-- 좌측 텍스트 -->
      <div class="space-y-8 lg:border-r lg:border-outline-variant/30 lg:pr-24 lg:sticky lg:top-32 self-center">
        <h2 class="font-headline text-3xl md:text-5xl font-bold tracking-tight text-on-background">
          Our Business
        </h2>
        <p class="text-on-surface-variant text-lg leading-relaxed max-w-lg">
          pillgrim은 순례자입니다.  <br>긴 여정 끝에 만나는 편안한 안식처이자 다채로운 즐거움이 있는 곳, 품격 있는 인생의 새로운 시작을 함께합니다.
        </p>
      </div>
      <!-- 우측 카드 4개 -->
      <div class="grid grid-cols-2 gap-4">
        <a href="#" class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container block hover:bg-primary-container/30 hover:-translate-y-1 hover:shadow-md transition-all duration-300 group">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block group-hover:scale-110 transition-transform duration-300">theater_comedy</span>
          <h3 class="font-headline text-xl font-bold mb-2">문화·요가</h3>
          <p class="text-sm text-on-surface-variant">공연, 전시, 요가 클래스 등 몸과 마음을 가꾸는 문화 생활</p>
        </a>
        <a href="#" class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container block hover:bg-primary-container/30 hover:-translate-y-1 hover:shadow-md transition-all duration-300 group">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block group-hover:scale-110 transition-transform duration-300">groups</span>
          <h3 class="font-headline text-xl font-bold mb-2">취미·동호회</h3>
          <p class="text-sm text-on-surface-variant">원예, 독서, 사진 등 다양한 취미 모임으로 활기찬 커뮤니티</p>
        </a>
        <a href="#" class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container block hover:bg-primary-container/30 hover:-translate-y-1 hover:shadow-md transition-all duration-300 group">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block group-hover:scale-110 transition-transform duration-300">favorite</span>
          <h3 class="font-headline text-xl font-bold mb-2">건강생활</h3>
          <p class="text-sm text-on-surface-variant">전문 의료진과 함께하는 맞춤형 건강 관리 및 재활 프로그램</p>
        </a>
        <a href="#" class="p-8 rounded-xl bg-surface-container-low border-b-2 border-primary-container block hover:bg-primary-container/30 hover:-translate-y-1 hover:shadow-md transition-all duration-300 group">
          <span class="material-symbols-outlined text-primary text-4xl mb-4 block group-hover:scale-110 transition-transform duration-300">self_improvement</span>
          <h3 class="font-headline text-xl font-bold mb-2">영성생활</h3>
          <p class="text-sm text-on-surface-variant">명상, 예배, 기도 모임 등 내면의 평화를 찾는 영적 공동체</p>
        </a>
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
        <div class="md:col-span-2 md:row-span-1 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[300px] reveal reveal-delay-1" alt="파인 다이닝">
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

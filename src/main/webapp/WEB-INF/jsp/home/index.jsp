<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="ko">
<head>
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
        <p class="text-on-surface-variant max-w-xl mx-auto">일상의 모든 순간이 특별해지는 프리미엄 시설을 경험하세요.</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

        <!-- 1. 라이프스타일 - 2칸 -->
        <div class="md:col-span-2 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/800x320/c4e7ff/00658b?text=Lifestyle+Facility"
               alt="라이프스타일 입소 시설">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">home_work</span>
            <h3 class="text-2xl font-bold font-headline">스타일 맞춤형 입소시설 제공</h3>
            <p class="text-sm opacity-80 mt-1 max-w-sm">개인의 생활 방식과 취향에 맞춘 맞춤형 입소 환경을 제공합니다.</p>
          </div>
        </div>

        <!-- 2. 의료 시설 - 1칸 -->
        <div class="group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/400x320/afc8d5/00658b?text=Medical+Center"
               alt="의료 시설">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">local_hospital</span>
            <h3 class="text-2xl font-bold font-headline">건강관리서비스 의료시설 운영</h3>
            <p class="text-sm opacity-80 mt-1">전문 의료진 상주 및 건강 관리 서비스 제공</p>
          </div>
        </div>

        <!-- 3. 문화여가 - 1칸 -->
        <div class="group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/400x320/77cefe/00658b?text=Culture+Leisure"
               alt="문화여가">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">theater_comedy</span>
            <h3 class="text-2xl font-bold font-headline">문화여가서비스 복합화</h3>
            <p class="text-sm opacity-80 mt-1">다양한 문화·여가 프로그램이 한 공간에</p>
          </div>
        </div>

        <!-- 4. 개인 공간 - 1칸 -->
        <div class="group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/400x320/d5e3fd/00658b?text=Private+Space"
               alt="개인 공간">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">manage_accounts</span>
            <h3 class="text-2xl font-bold font-headline">개인 공간 철저 보장</h3>
            <p class="text-sm opacity-80 mt-1">유닛별 전담 관리로 프라이버시 완벽 보호</p>
          </div>
        </div>

        <!-- 5. 경제적 공동생활 - 1칸 -->
        <div class="group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/400x320/cde6f4/00658b?text=Community+Living"
               alt="경제적 공동생활">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">groups</span>
            <h3 class="text-2xl font-bold font-headline">경제적 공동생활 영위</h3>
            <p class="text-sm opacity-80 mt-1">합리적인 비용으로 누리는 품격 있는 공동생활</p>
          </div>
        </div>

        <!-- 6. 주변 관광지 - 1칸 -->
        <div class="group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/400x320/b9c7e0/00658b?text=Tourism+Facility"
               alt="주변 관광지">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">travel_explore</span>
            <h3 class="text-2xl font-bold font-headline">주변 관광지 활용 시설</h3>
            <p class="text-sm opacity-80 mt-1">인근 관광지와 연계된 여가 활동 공간 운영</p>
          </div>
        </div>

        <!-- 7. 지역주민 공동체 - 2칸 -->
        <div class="md:col-span-2 group relative rounded-xl overflow-hidden bg-surface-container-lowest ambient-shadow hover:-translate-y-2 transition-all duration-300 min-h-[320px]">
          <img class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 opacity-70"
               src="https://placehold.co/800x320/c4e7ff/00658b?text=Community+Formation"
               alt="지역주민 공동체">
          <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent"></div>
          <div class="absolute bottom-8 left-8 text-white">
            <span class="material-symbols-outlined text-4xl mb-2 block">diversity_3</span>
            <h3 class="text-2xl font-bold font-headline">지역주민과 공동체 형성</h3>
            <p class="text-sm opacity-80 mt-1 max-w-sm">지역사회와 함께 어우러지는 열린 커뮤니티 공간</p>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- ④ Housing -->
  <section class="py-32 px-8 max-w-7xl mx-auto reveal" id="housing">
    <div class="flex flex-col md:flex-row justify-between items-end gap-8 mb-16">
      <div class="space-y-4">
        <h2 class="font-headline text-3xl md:text-4xl font-bold tracking-tight">Refined Living Spaces</h2>
        <p class="text-on-surface-variant">오직 당신을 위한 맞춤형 공간 설계</p>
      </div>
      <!-- 타입 탭 -->
      <div class="flex gap-3 font-headline text-sm font-semibold overflow-x-auto pb-2" id="housing-tabs">
        <button onclick="showType('A')" class="housing-tab px-6 py-2 rounded-full border-2 border-primary bg-primary text-on-primary whitespace-nowrap" data-type="A">A타입 (1층)</button>
        <button onclick="showType('B')" class="housing-tab px-6 py-2 rounded-full border-2 border-outline-variant hover:border-primary transition-colors whitespace-nowrap" data-type="B">B타입 (2층)</button>
        <button onclick="showType('C')" class="housing-tab px-6 py-2 rounded-full border-2 border-outline-variant hover:border-primary transition-colors whitespace-nowrap" data-type="C">C타입 (3층)</button>
        <button onclick="showType('D')" class="housing-tab px-6 py-2 rounded-full border-2 border-outline-variant hover:border-primary transition-colors whitespace-nowrap" data-type="D">D타입 (4층)</button>
      </div>
    </div>

    <!-- A타입 -->
    <div id="type-A" class="housing-panel grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
      <div class="lg:col-span-7 bg-white rounded-xl p-8 ambient-shadow border border-surface-container">
        <img class="w-full h-auto rounded-lg"
             src="${pageContext.request.contextPath}/resources/images/1F-A.jpg"
             alt="A타입 평면도">
      </div>
      <div class="lg:col-span-5 space-y-8">
        <div class="space-y-2">
          <span class="text-xs font-bold uppercase tracking-widest text-primary">1F · A Type</span>
          <h3 class="font-headline text-3xl font-bold">A타입</h3>
          <p class="text-on-surface-variant leading-relaxed">1층에 위치한 A타입은 넓은 전용면적으로 여유로운 생활 공간을 제공합니다.</p>
        </div>
        <div class="space-y-4">
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">세대수</span>
            <span class="font-bold text-sm">121 세대</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">전용면적</span>
            <span class="font-bold text-sm">47.71㎡ (14.43평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">공용면적</span>
            <span class="font-bold text-sm">59.27㎡ (17.93평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">임대면적</span>
            <span class="font-bold text-sm">106.98㎡ (32.36평)</span>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/residence/floorplan"
           class="block w-full py-4 rounded-full border-2 border-primary text-primary font-headline font-bold text-center hover:bg-primary hover:text-on-primary transition-all">
          자세히 보기
        </a>
      </div>
    </div>

    <!-- B타입 -->
    <div id="type-B" class="housing-panel hidden grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
      <div class="lg:col-span-7 bg-white rounded-xl p-8 ambient-shadow border border-surface-container">
        <img class="w-full h-auto rounded-lg"
             src="${pageContext.request.contextPath}/resources/images/2F-B.jpg"
             alt="B타입 평면도">
      </div>
      <div class="lg:col-span-5 space-y-8">
        <div class="space-y-2">
          <span class="text-xs font-bold uppercase tracking-widest text-primary">2F · B Type</span>
          <h3 class="font-headline text-3xl font-bold">B타입</h3>
          <p class="text-on-surface-variant leading-relaxed">2층에 위치한 B타입은 합리적인 면적으로 효율적인 생활 공간을 제공합니다.</p>
        </div>
        <div class="space-y-4">
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">세대수</span>
            <span class="font-bold text-sm">124 세대</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">전용면적</span>
            <span class="font-bold text-sm">38.71㎡ (11.71평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">공용면적</span>
            <span class="font-bold text-sm">48.09㎡ (14.55평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">임대면적</span>
            <span class="font-bold text-sm">86.80㎡ (26.26평)</span>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/residence/floorplan"
           class="block w-full py-4 rounded-full border-2 border-primary text-primary font-headline font-bold text-center hover:bg-primary hover:text-on-primary transition-all">
          자세히 보기
        </a>
      </div>
    </div>

    <!-- C타입 -->
    <div id="type-C" class="housing-panel hidden grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
      <div class="lg:col-span-7 bg-white rounded-xl p-8 ambient-shadow border border-surface-container">
        <img class="w-full h-auto rounded-lg"
             src="${pageContext.request.contextPath}/resources/images/3F-C.jpg"
             alt="C타입 평면도">
      </div>
      <div class="lg:col-span-5 space-y-8">
        <div class="space-y-2">
          <span class="text-xs font-bold uppercase tracking-widest text-primary">3F · C Type</span>
          <h3 class="font-headline text-3xl font-bold">C타입</h3>
          <p class="text-on-surface-variant leading-relaxed">3층에 위치한 C타입은 쾌적한 전망과 함께 아늑한 생활 공간을 제공합니다.</p>
        </div>
        <div class="space-y-4">
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">세대수</span>
            <span class="font-bold text-sm">126 세대</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">전용면적</span>
            <span class="font-bold text-sm">35.71㎡ (10.80평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">공용면적</span>
            <span class="font-bold text-sm">44.36㎡ (13.42평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">임대면적</span>
            <span class="font-bold text-sm">80.07㎡ (24.22평)</span>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/residence/floorplan"
           class="block w-full py-4 rounded-full border-2 border-primary text-primary font-headline font-bold text-center hover:bg-primary hover:text-on-primary transition-all">
          자세히 보기
        </a>
      </div>
    </div>

    <!-- D타입 -->
    <div id="type-D" class="housing-panel hidden grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
      <div class="lg:col-span-7 bg-white rounded-xl p-8 ambient-shadow border border-surface-container">
        <img class="w-full h-auto rounded-lg"
             src="${pageContext.request.contextPath}/resources/images/4F-D.jpg"
             alt="D타입 평면도">
      </div>
      <div class="lg:col-span-5 space-y-8">
        <div class="space-y-2">
          <span class="text-xs font-bold uppercase tracking-widest text-primary">4F · D Type</span>
          <h3 class="font-headline text-3xl font-bold">D타입</h3>
          <p class="text-on-surface-variant leading-relaxed">4층에 위치한 D타입은 탁 트인 전망과 함께 아늑한 생활 공간을 제공합니다.</p>
        </div>
        <div class="space-y-4">
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">세대수</span>
            <span class="font-bold text-sm">126 세대</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">전용면적</span>
            <span class="font-bold text-sm">32.71㎡ (9.90평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">공용면적</span>
            <span class="font-bold text-sm">40.64㎡ (12.29평)</span>
          </div>
          <div class="flex justify-between border-b border-outline-variant pb-3">
            <span class="text-on-surface-variant text-sm">임대면적</span>
            <span class="font-bold text-sm">73.35㎡ (22.19평)</span>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/residence/floorplan"
           class="block w-full py-4 rounded-full border-2 border-primary text-primary font-headline font-bold text-center hover:bg-primary hover:text-on-primary transition-all">
          자세히 보기
        </a>
      </div>
    </div>
  </section>

  <script>
    function showType(type) {
      const panels = document.querySelectorAll('.housing-panel');
      const current = Array.from(panels).find(p => !p.classList.contains('hidden'));

      document.querySelectorAll('.housing-tab').forEach(t => {
        t.classList.remove('border-primary', 'bg-primary', 'text-on-primary');
        t.classList.add('border-outline-variant', 'text-on-surface');
      });
      const activeTab = document.querySelector('[data-type="' + type + '"]');
      activeTab.classList.add('border-primary', 'bg-primary', 'text-on-primary');
      activeTab.classList.remove('border-outline-variant', 'text-on-surface');

      if (current) {
        current.style.transition = 'opacity 0.25s ease';
        current.style.opacity = '0';
        setTimeout(() => {
          current.classList.add('hidden');
          current.style.opacity = '';
          current.style.transition = '';

          const next = document.getElementById('type-' + type);
          next.style.opacity = '0';
          next.style.transition = 'none';
          next.classList.remove('hidden');
          setTimeout(() => {
            next.style.transition = 'opacity 0.35s ease';
            next.style.opacity = '1';
          }, 20);
        }, 250);
      } else {
        document.getElementById('type-' + type).classList.remove('hidden');
      }
    }
  </script>

  <!-- ⑤ Contact Form -->
  <section class="py-32 bg-primary-container/20 px-8 reveal" id="contact">
    <div class="max-w-3xl mx-auto text-center space-y-12">
      <div class="space-y-4">
        <h2 class="font-headline text-3xl md:text-4xl font-bold tracking-tight">Begin Your Journey</h2>
        <p class="text-on-surface-variant">문의를 남겨놔 주시면 연락드리겠습니다.</p>
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
            <input type="tel" name="phone" id="phone-input" placeholder="- 없이 입력하세요" maxlength="11"
                   class="w-full bg-transparent border-0 border-b-2 border-outline-variant focus:ring-0 focus:border-primary transition-all py-3">
          </div>
        </div>
        <div class="space-y-2">
          <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">이메일</label>
          <input type="email" name="email" placeholder="example@email.com"
                 class="w-full bg-transparent border-0 border-b-2 border-outline-variant focus:ring-0 focus:border-primary transition-all py-3">
        </div>
        <div class="space-y-2">
          <label class="text-sm font-bold font-label uppercase tracking-widest text-primary">문의 유형</label>
          <div class="flex flex-wrap gap-3 pt-2">
            <label class="cursor-pointer">
              <input class="hidden peer" name="interest" type="radio" value="입주 문의">
              <span class="px-6 py-2 rounded-full border-2 border-outline-variant peer-checked:border-primary peer-checked:bg-primary-container/30 transition-all text-sm">입주 문의</span>
            </label>
            <label class="cursor-pointer">
              <input class="hidden peer" name="interest" type="radio" value="일반 문의">
              <span class="px-6 py-2 rounded-full border-2 border-outline-variant peer-checked:border-primary peer-checked:bg-primary-container/30 transition-all text-sm">일반 문의</span>
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

  <!-- ⑥ 공지사항 제거 -->


</main>

<!-- FAB -->
<a href="${pageContext.request.contextPath}/support/contact"
   class="fixed bottom-8 right-8 bg-primary text-on-primary w-14 h-14 rounded-full flex items-center justify-center shadow-lg hover:scale-110 transition-transform duration-300 z-40">
  <span class="material-symbols-outlined">chat</span>
</a>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script>
  // 전화번호 자동 포맷
  const phoneInput = document.getElementById('phone-input');
  phoneInput.addEventListener('keypress', function(e) {
    if (!/[0-9]/.test(e.key)) e.preventDefault();
  });
  phoneInput.addEventListener('input', function() {
    this.value = this.value.replace(/\D/g, '').slice(0, 11);
  });
  phoneInput.addEventListener('blur', function() {
    let val = this.value.replace(/\D/g, '');
    if (val.length === 11) {
      this.value = val.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    } else if (val.length === 10) {
      this.value = val.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    }
  });
</script>

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

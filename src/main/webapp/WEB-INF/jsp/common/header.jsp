<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="sticky top-0 w-full z-50 glass-header shadow-sm">
  <div class="flex justify-between items-center px-8 py-4 max-w-7xl mx-auto">
    <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3">
      <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="필그림시니어랜드 로고" class="h-10 w-auto">
    </a>

    <ul class="hidden md:flex items-center space-x-8 font-headline font-semibold tracking-tight">
      <li class="relative group">
        <a href="${pageContext.request.contextPath}/intro/greeting" class="text-slate-600 hover:text-[#00658b] transition-colors">소개</a>
        <ul class="absolute top-full left-0 w-40 bg-white border border-outline-variant/30 py-2 hidden group-hover:block shadow-sm rounded-lg">
          <li><a href="${pageContext.request.contextPath}/intro/greeting" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">인사말</a></li>
          <li><a href="${pageContext.request.contextPath}/intro/brand" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">브랜드 소개</a></li>
          <li><a href="${pageContext.request.contextPath}/intro/vision" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">비전</a></li>
        </ul>
      </li>
      <li class="relative group">
        <a href="${pageContext.request.contextPath}/business/overview" class="text-slate-600 hover:text-[#00658b] transition-colors">사업정보</a>
        <ul class="absolute top-full left-0 w-40 bg-white border border-outline-variant/30 py-2 hidden group-hover:block shadow-sm rounded-lg">
          <li><a href="${pageContext.request.contextPath}/business/overview" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">사업개요</a></li>
          <li><a href="${pageContext.request.contextPath}/business/site" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">사업지 소개</a></li>
        </ul>
      </li>
      <li class="relative group">
        <a href="${pageContext.request.contextPath}/signature/intro" class="text-slate-600 hover:text-[#00658b] transition-colors">시그니처</a>
        <ul class="absolute top-full left-0 w-40 bg-white border border-outline-variant/30 py-2 hidden group-hover:block shadow-sm rounded-lg">
          <li><a href="${pageContext.request.contextPath}/signature/premium" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">프리미엄</a></li>
          <li><a href="${pageContext.request.contextPath}/signature/community" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">커뮤니티</a></li>
          <li><a href="${pageContext.request.contextPath}/signature/floor" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">층별 안내</a></li>
          <li><a href="${pageContext.request.contextPath}/signature/amenity" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">편의시설</a></li>
        </ul>
      </li>
      <li class="relative group">
        <a href="${pageContext.request.contextPath}/residence/typemap" class="text-slate-600 hover:text-[#00658b] transition-colors">주거공간</a>
        <ul class="absolute top-full left-0 w-40 bg-white border border-outline-variant/30 py-2 hidden group-hover:block shadow-sm rounded-lg">
          <li><a href="${pageContext.request.contextPath}/residence/typemap" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">타입별 위치도</a></li>
          <li><a href="${pageContext.request.contextPath}/residence/floorplan" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">평면소개</a></li>
        </ul>
      </li>
      <li class="relative group">
        <a href="${pageContext.request.contextPath}/support/notice" class="text-slate-600 hover:text-[#00658b] transition-colors">고객센터</a>
        <ul class="absolute top-full left-0 w-40 bg-white border border-outline-variant/30 py-2 hidden group-hover:block shadow-sm rounded-lg">
          <li><a href="${pageContext.request.contextPath}/support/notice" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/support/contact" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">온라인 문의</a></li>
          <li><a href="${pageContext.request.contextPath}/support/qna" class="block px-4 py-2 text-sm text-on-surface-variant hover:text-primary hover:bg-surface-container-low transition-colors">Q&amp;A</a></li>
        </ul>
      </li>
    </ul>

    <a href="${pageContext.request.contextPath}/support/contact"
       class="hidden md:block bg-primary text-on-primary px-6 py-2 rounded-full font-headline font-semibold hover:scale-105 transition-transform duration-300">
      입주 문의
    </a>

    <button id="mobile-menu-btn" class="md:hidden flex flex-col gap-1.5 p-2" aria-label="메뉴 열기">
      <span class="w-5 h-0.5 bg-on-surface block"></span>
      <span class="w-5 h-0.5 bg-on-surface block"></span>
      <span class="w-5 h-0.5 bg-on-surface block"></span>
    </button>
  </div>

  <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-outline-variant/30 px-6 py-5 space-y-1">
    <!-- 소개 -->
    <div>
      <button onclick="toggleMobileSub('sub-intro')" class="w-full flex justify-between items-center text-sm text-on-surface py-3 font-semibold">
        소개 <span class="material-symbols-outlined text-base transition-transform duration-300" id="arrow-sub-intro">expand_more</span>
      </button>
      <div id="sub-intro" style="max-height:0;opacity:0;overflow:hidden;transition:max-height 0.3s ease,opacity 0.3s ease;" class="pl-4 space-y-1 pb-2">
        <a href="${pageContext.request.contextPath}/intro/greeting" class="block text-sm text-on-surface-variant py-2">인사말</a>
        <a href="${pageContext.request.contextPath}/intro/brand" class="block text-sm text-on-surface-variant py-2">브랜드 소개</a>
        <a href="${pageContext.request.contextPath}/intro/vision" class="block text-sm text-on-surface-variant py-2">비전</a>
      </div>
    </div>
    <!-- 사업정보 -->
    <div>
      <button onclick="toggleMobileSub('sub-business')" class="w-full flex justify-between items-center text-sm text-on-surface py-3 font-semibold">
        사업정보 <span class="material-symbols-outlined text-base transition-transform duration-300" id="arrow-sub-business">expand_more</span>
      </button>
      <div id="sub-business" style="max-height:0;opacity:0;overflow:hidden;transition:max-height 0.3s ease,opacity 0.3s ease;" class="pl-4 space-y-1 pb-2">
        <a href="${pageContext.request.contextPath}/business/overview" class="block text-sm text-on-surface-variant py-2">사업개요</a>
        <a href="${pageContext.request.contextPath}/business/site" class="block text-sm text-on-surface-variant py-2">사업지 소개</a>
      </div>
    </div>
    <!-- 시그니처 -->
    <div>
      <button onclick="toggleMobileSub('sub-signature')" class="w-full flex justify-between items-center text-sm text-on-surface py-3 font-semibold">
        시그니처 <span class="material-symbols-outlined text-base transition-transform duration-300" id="arrow-sub-signature">expand_more</span>
      </button>
      <div id="sub-signature" style="max-height:0;opacity:0;overflow:hidden;transition:max-height 0.3s ease,opacity 0.3s ease;" class="pl-4 space-y-1 pb-2">
        <a href="${pageContext.request.contextPath}/signature/intro" class="block text-sm text-on-surface-variant py-2">프리미엄</a>
        <a href="${pageContext.request.contextPath}/signature/community" class="block text-sm text-on-surface-variant py-2">커뮤니티</a>
        <a href="${pageContext.request.contextPath}/signature/floor" class="block text-sm text-on-surface-variant py-2">층별 안내</a>
        <a href="${pageContext.request.contextPath}/signature/amenity" class="block text-sm text-on-surface-variant py-2">편의시설</a>
      </div>
    </div>
    <!-- 주거공간 -->
    <div>
      <button onclick="toggleMobileSub('sub-residence')" class="w-full flex justify-between items-center text-sm text-on-surface py-3 font-semibold">
        주거공간 <span class="material-symbols-outlined text-base transition-transform duration-300" id="arrow-sub-residence">expand_more</span>
      </button>
      <div id="sub-residence" style="max-height:0;opacity:0;overflow:hidden;transition:max-height 0.3s ease,opacity 0.3s ease;" class="pl-4 space-y-1 pb-2">
        <a href="${pageContext.request.contextPath}/residence/typemap" class="block text-sm text-on-surface-variant py-2">타입별 위치도</a>
        <a href="${pageContext.request.contextPath}/residence/floorplan" class="block text-sm text-on-surface-variant py-2">평면소개</a>
      </div>
    </div>
    <!-- 고객센터 -->
    <div>
      <button onclick="toggleMobileSub('sub-support')" class="w-full flex justify-between items-center text-sm text-on-surface py-3 font-semibold">
        고객센터 <span class="material-symbols-outlined text-base transition-transform duration-300" id="arrow-sub-support">expand_more</span>
      </button>
      <div id="sub-support" style="max-height:0;opacity:0;overflow:hidden;transition:max-height 0.3s ease,opacity 0.3s ease;" class="pl-4 space-y-1 pb-2">
        <a href="${pageContext.request.contextPath}/support/notice" class="block text-sm text-on-surface-variant py-2">공지사항</a>
        <a href="${pageContext.request.contextPath}/support/contact" class="block text-sm text-on-surface-variant py-2">온라인 문의</a>
        <a href="${pageContext.request.contextPath}/support/qna" class="block text-sm text-on-surface-variant py-2">Q&amp;A</a>
      </div>
    </div>
    <a href="${pageContext.request.contextPath}/support/contact"
       class="block bg-primary text-on-primary text-sm text-center px-6 py-2.5 rounded-full font-semibold mt-3">입주 문의</a>
  </div>
</nav>
<script>
  document.getElementById('mobile-menu-btn').addEventListener('click', function() {
    document.getElementById('mobile-menu').classList.toggle('hidden');
  });
  function toggleMobileSub(id) {
    const sub = document.getElementById(id);
    const arrow = document.getElementById('arrow-' + id);
    if (sub.style.maxHeight && sub.style.maxHeight !== '0px') {
      sub.style.maxHeight = '0px';
      sub.style.opacity = '0';
      arrow.style.transform = 'rotate(0deg)';
    } else {
      sub.style.maxHeight = sub.scrollHeight + 'px';
      sub.style.opacity = '1';
      arrow.style.transform = 'rotate(180deg)';
    }
  }
</script>

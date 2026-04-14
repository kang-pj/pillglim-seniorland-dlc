<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer class="bg-slate-50 w-full py-20 px-8">
  <div class="grid grid-cols-1 md:grid-cols-4 gap-12 max-w-7xl mx-auto">
    <div class="space-y-6">
      <h2 class="text-xl font-bold text-slate-800 font-headline">필그림시니어랜드</h2>
      <p class="text-sm leading-relaxed text-slate-500">대전 최고의 프리미엄 시니어 타운. 격조 높은 주거 문화의 새로운 기준을 제시합니다.</p>
    </div>
    <div class="space-y-6">
      <h3 class="text-sm font-bold uppercase tracking-widest text-[#00658b]">연락처</h3>
      <ul class="space-y-4 text-sm">
        <li class="text-slate-500">T. 000-0000-0000</li>
        <li class="text-slate-500">E. contact@pilgrimseniorland.com</li>
        <li class="text-slate-500">A. 대전광역시</li>
      </ul>
    </div>
    <div class="space-y-6">
      <h3 class="text-sm font-bold uppercase tracking-widest text-[#00658b]">바로가기</h3>
      <ul class="flex flex-col gap-3">
        <li><a href="${pageContext.request.contextPath}/intro/greeting" class="text-slate-500 hover:text-slate-900 transition-all text-sm">소개</a></li>
        <li><a href="${pageContext.request.contextPath}/signature/premium" class="text-slate-500 hover:text-slate-900 transition-all text-sm">시그니처</a></li>
        <li><a href="${pageContext.request.contextPath}/residence/typemap" class="text-slate-500 hover:text-slate-900 transition-all text-sm">주거공간</a></li>
        <li><a href="${pageContext.request.contextPath}/support/contact" class="text-slate-500 hover:text-slate-900 transition-all text-sm">온라인 문의</a></li>
        <li><a href="${pageContext.request.contextPath}/privacy" class="text-slate-500 hover:text-slate-900 transition-all text-sm">개인정보처리방침</a></li>
      </ul>
    </div>
    <div class="space-y-6">
      <h3 class="text-sm font-bold uppercase tracking-widest text-[#00658b]">소셜</h3>
      <div class="flex gap-4">
        <a href="#" class="w-10 h-10 rounded-full bg-surface-container-high flex items-center justify-center hover:bg-primary-container transition-colors">
          <span class="material-symbols-outlined text-primary">public</span>
        </a>
        <a href="#" class="w-10 h-10 rounded-full bg-surface-container-high flex items-center justify-center hover:bg-primary-container transition-colors">
          <span class="material-symbols-outlined text-primary">mail</span>
        </a>
      </div>
    </div>
  </div>
  <div class="max-w-7xl mx-auto mt-20 pt-8 border-t border-slate-200">
    <p class="text-sm text-slate-400">&copy; 2024 Pilgrim Senior Land. All rights reserved.</p>
  </div>
</footer>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

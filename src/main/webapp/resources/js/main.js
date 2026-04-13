/**
 * 필그림시니어랜드 메인 JavaScript
 */

(function() {
    'use strict';

    // DOM 로드 완료 후 실행
    document.addEventListener('DOMContentLoaded', function() {
        initDropdownMenu();
        initMobileMenu();
        initScrollEffects();
        initBackToTop();
    });

    /**
     * 드롭다운 메뉴 초기화
     */
    function initDropdownMenu() {
        const menuItems = document.querySelectorAll('.nav-menu > li');

        menuItems.forEach(function(item) {
            const link = item.querySelector('a');
            const dropdown = item.querySelector('.dropdown-menu');

            if (dropdown) {
                // 마우스 오버
                item.addEventListener('mouseenter', function() {
                    dropdown.style.display = 'block';
                });

                // 마우스 아웃
                item.addEventListener('mouseleave', function() {
                    dropdown.style.display = 'none';
                });

                // 키보드 접근성
                link.addEventListener('focus', function() {
                    dropdown.style.display = 'block';
                });

                link.addEventListener('blur', function(e) {
                    setTimeout(function() {
                        if (!item.contains(document.activeElement)) {
                            dropdown.style.display = 'none';
                        }
                    }, 100);
                });
            }
        });
    }

    /**
     * 모바일 메뉴 초기화
     */
    function initMobileMenu() {
        const toggle = document.querySelector('.mobile-menu-toggle');
        const menu = document.querySelector('.nav-menu');

        if (toggle && menu) {
            toggle.addEventListener('click', function() {
                menu.classList.toggle('active');
                const isExpanded = menu.classList.contains('active');
                toggle.setAttribute('aria-expanded', isExpanded);
            });

            // 모바일에서 드롭다운 토글
            const dropdownParents = document.querySelectorAll('.nav-menu > li > a');
            dropdownParents.forEach(function(link) {
                const parent = link.parentElement;
                const dropdown = parent.querySelector('.dropdown-menu');

                if (dropdown && window.innerWidth < 768) {
                    link.addEventListener('click', function(e) {
                        e.preventDefault();
                        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
                    });
                }
            });
        }
    }

    /**
     * 스크롤 효과 초기화
     */
    function initScrollEffects() {
        const header = document.querySelector('.header');
        let lastScroll = 0;

        window.addEventListener('scroll', function() {
            const currentScroll = window.pageYOffset;

            // 헤더 그림자 효과
            if (currentScroll > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }

            lastScroll = currentScroll;
        });
    }

    /**
     * 맨 위로 버튼 초기화
     */
    function initBackToTop() {
        const backToTop = document.getElementById('backToTop');

        if (backToTop) {
            window.addEventListener('scroll', function() {
                if (window.pageYOffset > 300) {
                    backToTop.style.display = 'block';
                } else {
                    backToTop.style.display = 'none';
                }
            });

            backToTop.addEventListener('click', function(e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        }
    }

    /**
     * 유틸리티: 쿼리 파라미터 가져오기
     */
    window.getQueryParam = function(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    };

    /**
     * 유틸리티: 날짜 포맷팅
     */
    window.formatDate = function(dateString) {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    };

})();

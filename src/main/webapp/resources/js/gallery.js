/**
 * 갤러리 슬라이더 JavaScript (Swiper.js)
 */

(function() {
    'use strict';

    document.addEventListener('DOMContentLoaded', function() {
        initGallerySlider();
        initImageModal();
    });

    /**
     * 갤러리 슬라이더 초기화
     */
    function initGallerySlider() {
        const swiperElement = document.querySelector('.swiper');
        if (!swiperElement || typeof Swiper === 'undefined') return;

        const swiper = new Swiper('.swiper', {
            slidesPerView: 1,
            spaceBetween: 10,
            loop: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            breakpoints: {
                768: {
                    slidesPerView: 2,
                    spaceBetween: 20
                },
                1280: {
                    slidesPerView: 3,
                    spaceBetween: 30
                }
            }
        });
    }

    /**
     * 이미지 모달 초기화
     */
    function initImageModal() {
        const galleryImages = document.querySelectorAll('.gallery-image');
        if (galleryImages.length === 0) return;

        galleryImages.forEach(function(img) {
            img.addEventListener('click', function() {
                openImageModal(this.src, this.alt);
            });
        });
    }

    /**
     * 이미지 모달 열기
     */
    function openImageModal(src, alt) {
        const modal = document.createElement('div');
        modal.className = 'image-modal';
        modal.innerHTML = 
            '<div class="modal-overlay"></div>' +
            '<div class="modal-content">' +
            '<button class="modal-close" aria-label="닫기">&times;</button>' +
            '<img src="' + src + '" alt="' + alt + '">' +
            '</div>';

        document.body.appendChild(modal);
        document.body.style.overflow = 'hidden';

        // 닫기 버튼
        const closeBtn = modal.querySelector('.modal-close');
        closeBtn.addEventListener('click', function() {
            closeImageModal(modal);
        });

        // 오버레이 클릭
        const overlay = modal.querySelector('.modal-overlay');
        overlay.addEventListener('click', function() {
            closeImageModal(modal);
        });

        // ESC 키
        document.addEventListener('keydown', function escHandler(e) {
            if (e.key === 'Escape') {
                closeImageModal(modal);
                document.removeEventListener('keydown', escHandler);
            }
        });
    }

    /**
     * 이미지 모달 닫기
     */
    function closeImageModal(modal) {
        modal.remove();
        document.body.style.overflow = '';
    }

})();

/**
 * 문의하기 폼 JavaScript
 */

(function() {
    'use strict';

    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('contactForm');
        if (form) {
            initContactForm(form);
        }
    });

    /**
     * 문의 폼 초기화
     */
    function initContactForm(form) {
        // 실시간 검증
        const nameInput = form.querySelector('[name="name"]');
        const phoneInput = form.querySelector('[name="phone"]');
        const emailInput = form.querySelector('[name="email"]');
        const messageInput = form.querySelector('[name="message"]');

        if (nameInput) {
            nameInput.addEventListener('blur', function() {
                validateName(this);
            });
        }

        if (phoneInput) {
            phoneInput.addEventListener('blur', function() {
                validatePhone(this);
            });
        }

        if (emailInput) {
            emailInput.addEventListener('blur', function() {
                validateEmail(this);
            });
        }

        if (messageInput) {
            messageInput.addEventListener('input', function() {
                updateCharCount(this);
            });
        }

        // 폼 제출
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (validateForm(form)) {
                executeRecaptcha(form);
            }
        });
    }

    /**
     * 이름 검증
     */
    function validateName(input) {
        const value = input.value.trim();
        const errorEl = input.nextElementSibling;

        if (value.length < 2) {
            showError(input, errorEl, '이름은 2자 이상 입력해주세요.');
            return false;
        }

        hideError(input, errorEl);
        return true;
    }

    /**
     * 전화번호 검증
     */
    function validatePhone(input) {
        const value = input.value.trim();
        const errorEl = input.nextElementSibling;
        const phoneRegex = /^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$/;

        if (!phoneRegex.test(value)) {
            showError(input, errorEl, '올바른 전화번호 형식이 아닙니다. (예: 010-1234-5678)');
            return false;
        }

        hideError(input, errorEl);
        return true;
    }

    /**
     * 이메일 검증
     */
    function validateEmail(input) {
        const value = input.value.trim();
        const errorEl = input.nextElementSibling;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (value && !emailRegex.test(value)) {
            showError(input, errorEl, '올바른 이메일 형식이 아닙니다.');
            return false;
        }

        hideError(input, errorEl);
        return true;
    }

    /**
     * 글자수 카운터 업데이트
     */
    function updateCharCount(textarea) {
        const maxLength = 1000;
        const currentLength = textarea.value.length;
        const counter = document.getElementById('charCount');

        if (counter) {
            counter.textContent = currentLength + ' / ' + maxLength;

            if (currentLength > maxLength) {
                counter.style.color = 'red';
            } else {
                counter.style.color = '';
            }
        }
    }

    /**
     * 전체 폼 검증
     */
    function validateForm(form) {
        const nameInput = form.querySelector('[name="name"]');
        const phoneInput = form.querySelector('[name="phone"]');
        const emailInput = form.querySelector('[name="email"]');
        const messageInput = form.querySelector('[name="message"]');
        const privacyCheckbox = form.querySelector('[name="privacyAgree"]');

        let isValid = true;

        if (!validateName(nameInput)) isValid = false;
        if (!validatePhone(phoneInput)) isValid = false;
        if (emailInput.value && !validateEmail(emailInput)) isValid = false;

        if (messageInput.value.trim().length < 10) {
            alert('문의 내용은 10자 이상 입력해주세요.');
            isValid = false;
        }

        if (!privacyCheckbox.checked) {
            alert('개인정보 수집 및 이용에 동의해주세요.');
            isValid = false;
        }

        return isValid;
    }

    /**
     * reCAPTCHA 실행
     */
    function executeRecaptcha(form) {
        const siteKey = form.dataset.recaptchaSiteKey;

        if (typeof grecaptcha !== 'undefined' && siteKey) {
            grecaptcha.ready(function() {
                grecaptcha.execute(siteKey, {action: 'contact'})
                    .then(function(token) {
                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'recaptchaToken';
                        input.value = token;
                        form.appendChild(input);

                        submitForm(form);
                    })
                    .catch(function(error) {
                        console.error('reCAPTCHA error:', error);
                        alert('보안 검증에 실패했습니다. 다시 시도해주세요.');
                    });
            });
        } else {
            submitForm(form);
        }
    }

    /**
     * 폼 제출
     */
    function submitForm(form) {
        const submitBtn = form.querySelector('button[type="submit"]');
        submitBtn.disabled = true;
        submitBtn.textContent = '전송 중...';

        form.submit();
    }

    /**
     * 에러 표시
     */
    function showError(input, errorEl, message) {
        input.classList.add('error');
        if (errorEl && errorEl.classList.contains('error-message')) {
            errorEl.textContent = message;
            errorEl.style.display = 'block';
        }
    }

    /**
     * 에러 숨김
     */
    function hideError(input, errorEl) {
        input.classList.remove('error');
        if (errorEl && errorEl.classList.contains('error-message')) {
            errorEl.style.display = 'none';
        }
    }

})();

/**
 * Q&A 페이지 JavaScript
 */

(function() {
    'use strict';

    document.addEventListener('DOMContentLoaded', function() {
        initQnaList();
        initQnaWrite();
    });

    /**
     * Q&A 목록 초기화
     */
    function initQnaList() {
        const listPage = document.querySelector('.qna-list-page');
        if (!listPage) return;

        // 비밀글 토글
        const secretToggles = document.querySelectorAll('.secret-toggle');
        secretToggles.forEach(function(toggle) {
            toggle.addEventListener('click', function(e) {
                e.preventDefault();
                const qnaId = this.dataset.qnaId;
                const password = prompt('비밀번호를 입력하세요:');

                if (password) {
                    verifyPassword(qnaId, password);
                }
            });
        });
    }

    /**
     * Q&A 작성 폼 초기화
     */
    function initQnaWrite() {
        const writeForm = document.getElementById('qnaWriteForm');
        if (!writeForm) return;

        const secretCheckbox = writeForm.querySelector('[name="isSecret"]');
        const passwordGroup = document.getElementById('passwordGroup');
        const contentTextarea = writeForm.querySelector('[name="content"]');

        // 비밀글 체크박스
        if (secretCheckbox && passwordGroup) {
            secretCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    passwordGroup.style.display = 'block';
                    passwordGroup.querySelector('input').required = true;
                } else {
                    passwordGroup.style.display = 'none';
                    passwordGroup.querySelector('input').required = false;
                }
            });
        }

        // 글자수 카운터
        if (contentTextarea) {
            contentTextarea.addEventListener('input', function() {
                updateCharCount(this);
            });
        }

        // 폼 제출
        writeForm.addEventListener('submit', function(e) {
            if (!validateQnaForm(this)) {
                e.preventDefault();
            }
        });
    }

    /**
     * 비밀번호 검증
     */
    function verifyPassword(qnaId, password) {
        // AJAX로 비밀번호 검증 (실제 구현 시)
        // 여기서는 단순히 페이지 이동
        window.location.href = '/support/qna/detail?id=' + qnaId + '&password=' + encodeURIComponent(password);
    }

    /**
     * Q&A 폼 검증
     */
    function validateQnaForm(form) {
        const title = form.querySelector('[name="title"]').value.trim();
        const content = form.querySelector('[name="content"]').value.trim();
        const name = form.querySelector('[name="name"]').value.trim();
        const phone = form.querySelector('[name="phone"]').value.trim();
        const isSecret = form.querySelector('[name="isSecret"]').checked;
        const password = form.querySelector('[name="password"]');

        if (title.length < 2) {
            alert('제목은 2자 이상 입력해주세요.');
            return false;
        }

        if (content.length < 10) {
            alert('내용은 10자 이상 입력해주세요.');
            return false;
        }

        if (name.length < 2) {
            alert('이름은 2자 이상 입력해주세요.');
            return false;
        }

        const phoneRegex = /^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$/;
        if (!phoneRegex.test(phone)) {
            alert('올바른 전화번호 형식이 아닙니다.');
            return false;
        }

        if (isSecret && password && password.value.length < 4) {
            alert('비밀번호는 4자 이상 입력해주세요.');
            return false;
        }

        return true;
    }

    /**
     * 글자수 카운터 업데이트
     */
    function updateCharCount(textarea) {
        const maxLength = 2000;
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

})();

# 비즈니스 로직 모델 (Business Logic Model)

## 1. 공지사항 흐름

### 목록 조회 (방문자)
```
GET /support/notice?page={n}
  → SupportController.showNoticeList()
  → NoticeService.getNoticeList(page, 10)
  → NoticeDao.findAll(offset, 10)  [WHERE is_published=1 ORDER BY created_at DESC]
  → notice-list.jsp 렌더링
```

### 상세 조회 (방문자)
```
GET /support/notice/detail?id={id}
  → SupportController.showNoticeDetail()
  → NoticeService.getNoticeDetail(id)
  → NoticeDao.findById(id)  [is_published=1 확인]
  → notice-detail.jsp 렌더링
```

### 등록/수정/삭제 (관리자)
```
POST /admin/notice/write
  → AdminNoticeController (세션 권한 확인)
  → NoticeService.createNotice(NoticeVO)
  → NoticeDao.insert()
  → 목록 페이지 redirect
```

---

## 2. Q&A 흐름

### 목록 조회 (방문자)
```
GET /support/qna?page={n}
  → SupportController.showQnaList()
  → QnaService.getQnaList(page, 10)
  → QnaDao.findAll(offset, 10)  [ORDER BY created_at DESC]
  → qna-list.jsp (비밀글은 제목 마스킹)
```

### 질문 등록 (익명 방문자)
```
POST /support/qna/write
  → SupportController.submitQna()
  → ValidationUtil.sanitize(question, nickname)
  → QnaService.createQna(QnaVO)
    → is_secret=1 이면 password BCrypt 해시 저장
  → QnaDao.insert()
  → 목록 redirect
```

### 비밀글 상세 조회
```
GET /support/qna/detail?id={id}
  → QnaService.getQnaDetail(id)
  → is_secret=1 이면 → 비밀번호 확인 페이지 표시
  → 비밀번호 일치 확인 후 상세 표시
  → (관리자 세션이면 바로 표시)
```

### 답변 등록 (관리자)
```
POST /admin/qna/answer
  → AdminQnaController (세션 권한 확인)
  → QnaService.answerQna(id, answer)
  → QnaDao.updateAnswer(id, answer)  [is_answered=1, answered_at=NOW()]
  → 상세 페이지 redirect
```

---

## 3. 온라인 문의 흐름

```
GET /support/contact
  → ContactController.doGet()
  → CSRF 토큰 생성 → 세션 저장
  → contact.jsp (reCAPTCHA 스크립트 포함)

POST /support/contact
  → ContactController.doPost()
  1. CSRF 토큰 검증
  2. ValidationUtil.sanitize(name, phone, message)
  3. ValidationUtil.isValidPhone(phone)
  4. ValidationUtil.isValidLength(message, 1000)
  5. RecaptchaService.verify(token, ip)  → score < 0.5 이면 거부
  6. ContactDao.insert(ContactVO)
  7. EmailUtil.sendNotification(contact, recipientEmail)  [비차단 - 실패해도 계속]
  8. contact-result.jsp (성공 메시지)
```

---

## 4. 관리자 인증 흐름

```
GET /admin/login
  → AdminLoginController.doGet()
  → admin/login.jsp

POST /admin/login
  → AdminLoginController.doPost()
  1. AdminService.authenticate(username, password)
     → AdminDao.findByUsername(username)
     → BCrypt.checkpw(password, hashedPassword)
  2. 성공: session.setAttribute("admin", adminVO) → /admin/dashboard redirect
  3. 실패: login.jsp (오류 메시지)

AdminAuthFilter (모든 /admin/* 요청)
  → session.getAttribute("admin") 확인
  → null이면 /admin/login redirect
```

---

## 5. 관리자 기능 범위

| 기능 | URL | 설명 |
|------|-----|------|
| 로그인 | `/admin/login` | 관리자 인증 |
| 대시보드 | `/admin/dashboard` | 공지/Q&A/문의 현황 |
| 공지사항 목록 | `/admin/notice` | 전체 목록 |
| 공지사항 등록 | `/admin/notice/write` | 새 공지 작성 |
| 공지사항 수정 | `/admin/notice/edit?id={id}` | 기존 공지 수정 |
| 공지사항 삭제 | `/admin/notice/delete?id={id}` | 삭제 |
| Q&A 목록 | `/admin/qna` | 전체 목록 (비밀글 포함) |
| Q&A 답변 | `/admin/qna/answer` | 답변 등록 |
| 문의 목록 | `/admin/contact` | 접수된 문의 목록 |
| 로그아웃 | `/admin/logout` | 세션 무효화 |

---

## 6. 구글맵 연동

```
사업지 소개 (/business/site) 또는 주변 시설 (/signature/nearby) 페이지
  → JSP에 Google Maps JavaScript API 로드
  → application.properties에서 API 키 읽어 JSP에 전달
  → 지정 좌표에 마커 표시
  → 주변 시설 페이지: 정적 마커 여러 개 표시 (Places API 미사용, 좌표 하드코딩)
```

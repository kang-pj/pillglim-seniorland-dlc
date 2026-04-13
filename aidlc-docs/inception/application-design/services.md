# 서비스 레이어 설계 (Services)

## 서비스 개요

JSP/Servlet MPA 구조에서 Service 레이어는 Controller와 DAO 사이의 비즈니스 로직을 담당합니다.

---

## ContactService (핵심 서비스)

### 역할
문의 폼 제출의 전체 처리 흐름 오케스트레이션

### 처리 흐름
```
ContactController (POST /contact)
    │
    ├─ 1. 입력값 검증 (ValidationUtil)
    │       ├─ 이름, 연락처, 내용 필수값 확인
    │       ├─ 전화번호 형식 검증
    │       └─ XSS 방지 sanitize
    │
    ├─ 2. reCAPTCHA 검증 (RecaptchaService)
    │       └─ Google API 호출 → score 확인 (0.5 이상)
    │
    ├─ 3. DB 저장 (ContactDao)
    │       └─ contact 테이블에 INSERT
    │
    ├─ 4. 이메일 발송 (EmailUtil)
    │       └─ 담당자 이메일로 알림 발송
    │
    └─ 5. 결과 반환 → contact-result.jsp
```

### 오류 처리
- reCAPTCHA 실패 → 폼 재표시 + 오류 메시지
- DB 저장 실패 → 오류 페이지 (이메일은 시도)
- 이메일 발송 실패 → DB 저장은 유지, 로그 기록 (비차단)

---

## NewsService

### 역할
뉴스/공지사항 데이터 조회 및 페이징 처리

### 처리 흐름
```
HomeController (GET /)
    └─ NewsService.getRecentNews(3) → NewsDao.findRecent(3)

NewsController (GET /news)
    └─ NewsService.getNewsList(page, 10) → NewsDao.findAll(offset, 10)

NewsController (GET /news/detail)
    └─ NewsService.getNewsDetail(id) → NewsDao.findById(id)
```

---

## RecaptchaService

### 역할
Google reCAPTCHA v3 서버 사이드 검증

### 외부 연동
- **엔드포인트**: `https://www.google.com/recaptcha/api/siteverify`
- **파라미터**: secret key, token, remoteip
- **판단 기준**: score >= 0.5 → 정상 사용자

---

## DB 커넥션 관리

### DBConnectionPool
- Cafe24 환경에서 JNDI DataSource 또는 직접 커넥션 풀 사용
- `web.xml`에 DataSource 설정
- 모든 DAO는 DBConnectionPool을 통해 Connection 획득

# 컴포넌트 메서드 (Component Methods)

> 상세 비즈니스 로직은 CONSTRUCTION 단계의 Functional Design에서 정의됩니다.

---

## Controller 메서드

### HomeController
```java
// GET /
void doGet(HttpServletRequest req, HttpServletResponse res)
// 역할: 홈 페이지 렌더링, 최신 공지사항 3건 조회 후 전달
```

### PageController
```java
// GET /intro/* | /business/* | /signature/* | /residence/* | /privacy
void doGet(HttpServletRequest req, HttpServletResponse res)
// 역할: 요청 URI를 파싱하여 해당 JSP로 forward
// 예: /intro/greeting  → /WEB-INF/jsp/intro/greeting.jsp
// 예: /signature/floor → /WEB-INF/jsp/signature/floor.jsp
// 예: /residence/floorplan → /WEB-INF/jsp/residence/floorplan.jsp
// JSP가 존재하지 않으면 404 처리
```

### SupportController
```java
// GET /support/notice
void showNoticeList(HttpServletRequest req, HttpServletResponse res)
// 역할: 공지사항 목록 페이지 렌더링 (페이징 지원)

// GET /support/notice/detail?id={id}
void showNoticeDetail(HttpServletRequest req, HttpServletResponse res)
// 역할: 공지사항 상세 페이지 렌더링

// GET /support/qna
void showQnaList(HttpServletRequest req, HttpServletResponse res)
// 역할: Q&A 목록 페이지 렌더링

// GET /support/qna/detail?id={id}
void showQnaDetail(HttpServletRequest req, HttpServletResponse res)
// 역할: Q&A 상세 페이지 렌더링
```

### ContactController
```java
// GET /support/contact
void doGet(HttpServletRequest req, HttpServletResponse res)
// 역할: 온라인 문의 폼 페이지 렌더링

// POST /support/contact
void doPost(HttpServletRequest req, HttpServletResponse res)
// 역할: 문의 폼 제출 처리 (검증 → 저장 → 이메일 → 결과 페이지)
// 입력: name(String), phone(String), message(String), recaptchaToken(String)
// 출력: support/contact-result.jsp (성공/실패 메시지)
```

---

## Service 메서드

### NoticeService
```java
List<NoticeVO> getRecentNotices(int limit)
// 역할: 최신 공지사항 N건 조회 (홈 페이지용)

List<NoticeVO> getNoticeList(int page, int pageSize)
// 역할: 공지사항 목록 페이징 조회

NoticeVO getNoticeDetail(int id)
// 역할: 공지사항 상세 조회
```

### QnaService
```java
List<QnaVO> getQnaList(int page, int pageSize)
// 역할: Q&A 목록 페이징 조회

QnaVO getQnaDetail(int id)
// 역할: Q&A 상세 조회
```

### ContactService
```java
boolean submitContact(ContactVO contact, String recaptchaToken)
// 역할: reCAPTCHA 검증 → DB 저장 → 이메일 발송
// 반환: 처리 성공 여부
```

### RecaptchaService
```java
boolean verify(String token, String remoteIp)
// 역할: Google reCAPTCHA v3 서버 사이드 검증
// 반환: 검증 통과 여부 (score >= 0.5)
```

---

## DAO 메서드

### NoticeDao
```java
List<NoticeVO> findRecent(int limit)
List<NoticeVO> findAll(int offset, int limit)
NoticeVO findById(int id)
int countAll()
```

### QnaDao
```java
List<QnaVO> findAll(int offset, int limit)
QnaVO findById(int id)
int countAll()
```

### ContactDao
```java
int insert(ContactVO contact)
// 역할: 문의 내용 DB 저장, 반환: 삽입된 행 수
```

---

## Model (VO)

### NoticeVO
```java
int id
String title
String content
String author
Date createdAt
boolean isPublished
```

### QnaVO
```java
int id
String question
String answer
boolean isAnswered
Date createdAt
```

### ContactVO
```java
int id
String name
String phone
String message
String ipAddress
Date submittedAt
```

---

## Utility 메서드

### ValidationUtil
```java
String sanitizeInput(String input)      // XSS 방지 - HTML 특수문자 이스케이프
boolean isValidPhone(String phone)      // 한국 전화번호 형식 검증
boolean isValidLength(String input, int maxLength)  // 입력 길이 검증
```

### EmailUtil
```java
boolean sendContactNotification(ContactVO contact, String recipientEmail)
// 역할: 문의 접수 알림 이메일 발송
```

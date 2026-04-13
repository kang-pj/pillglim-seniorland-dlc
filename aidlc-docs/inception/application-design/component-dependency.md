# 컴포넌트 의존성 (Component Dependencies)

## 의존성 매트릭스

| 컴포넌트 | 의존 대상 |
|----------|-----------|
| HomeController | NoticeService |
| PageController | (없음 - JSP forward만) |
| SupportController | NoticeService, QnaService |
| ContactController | ContactService, ValidationUtil |
| ContactService | RecaptchaService, ContactDao, EmailUtil |
| NoticeService | NoticeDao |
| QnaService | QnaDao |
| RecaptchaService | Google reCAPTCHA API (외부) |
| ContactDao | DBConnectionPool |
| NoticeDao | DBConnectionPool |
| QnaDao | DBConnectionPool |
| EmailUtil | JavaMail API, SMTP 서버 |

---

## 데이터 흐름

### 홈 페이지 로딩
```
Browser → GET /
    → HomeController
    → NoticeService.getRecentNotices(3)
    → NoticeDao.findRecent(3) → MariaDB
    → index.jsp (최신 공지 3건 포함 렌더링)
    → Browser
```

### 정적 콘텐츠 페이지 (intro, business, signature, residence)
```
Browser → GET /intro/greeting
    → PageController (URI 파싱)
    → /WEB-INF/jsp/intro/greeting.jsp 로 forward
    → Browser
```

### 공지사항 목록
```
Browser → GET /support/notice?page=1
    → SupportController
    → NoticeService.getNoticeList(1, 10)
    → NoticeDao.findAll(0, 10) → MariaDB
    → support/notice-list.jsp
    → Browser
```

### 온라인 문의 제출
```
Browser → POST /support/contact (name, phone, message, recaptchaToken)
    → ContactController
    → ValidationUtil.sanitizeInput()
    → ContactService.submitContact()
        → RecaptchaService.verify() → Google API
        → ContactDao.insert() → MariaDB
        → EmailUtil.sendNotification() → SMTP
    → support/contact-result.jsp
    → Browser
```

---

## URL 매핑 (web.xml 기준)

> **설계 원칙**: 모든 URL에서 `.jsp` 확장자를 노출하지 않습니다.
> 정적 페이지도 Servlet(Controller)을 통해 JSP로 forward하여 깔끔한 URL을 유지합니다.

| URL 패턴 | Controller | 메서드 |
|----------|------------|--------|
| `/` | HomeController | GET |
| `/intro/*` | PageController | GET |
| `/business/*` | PageController | GET |
| `/signature/*` | PageController | GET |
| `/residence/*` | PageController | GET |
| `/support/notice` | SupportController | GET |
| `/support/notice/detail` | SupportController | GET |
| `/support/qna` | SupportController | GET |
| `/support/qna/detail` | SupportController | GET |
| `/support/contact` | ContactController | GET, POST |
| `/privacy` | PageController | GET |

### PageController 역할
```java
// URI 파싱 → JSP 경로 매핑
// 예: GET /intro/greeting      → /WEB-INF/jsp/intro/greeting.jsp
// 예: GET /business/site       → /WEB-INF/jsp/business/site.jsp
// 예: GET /signature/nearby    → /WEB-INF/jsp/signature/nearby.jsp
// 예: GET /signature/amenity   → /WEB-INF/jsp/signature/amenity.jsp
// 예: GET /residence/floorplan → /WEB-INF/jsp/residence/floorplan.jsp
// JSP가 존재하지 않으면 404 처리
```

### JSP 직접 접근 차단
`/WEB-INF/` 하위에 모든 JSP를 배치하면 외부에서 `.jsp` URL로 직접 접근이 불가능합니다.

---

## 프로젝트 디렉토리 구조

```
pillgrim-seniorland/
├── src/main/
│   ├── java/com/pilgrimseniorland/
│   │   ├── controller/
│   │   │   ├── HomeController.java
│   │   │   ├── PageController.java
│   │   │   ├── SupportController.java
│   │   │   └── ContactController.java
│   │   ├── service/
│   │   │   ├── NoticeService.java
│   │   │   ├── QnaService.java
│   │   │   ├── ContactService.java
│   │   │   └── RecaptchaService.java
│   │   ├── dao/
│   │   │   ├── NoticeDao.java
│   │   │   ├── QnaDao.java
│   │   │   └── ContactDao.java
│   │   ├── model/
│   │   │   ├── NoticeVO.java
│   │   │   ├── QnaVO.java
│   │   │   └── ContactVO.java
│   │   └── util/
│   │       ├── ValidationUtil.java
│   │       ├── EmailUtil.java
│   │       └── DBConnectionPool.java
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── web.xml
│       │   └── jsp/
│       │       ├── common/
│       │       │   ├── header.jsp
│       │       │   ├── footer.jsp
│       │       │   └── head.jsp
│       │       ├── home/
│       │       │   └── index.jsp
│       │       ├── intro/
│       │       │   ├── greeting.jsp
│       │       │   ├── brand.jsp
│       │       │   └── vision.jsp
│       │       ├── business/
│       │       │   ├── overview.jsp
│       │       │   └── site.jsp
│       │       ├── signature/
│       │       │   ├── premium.jsp
│       │       │   ├── community.jsp
│       │       │   ├── plan.jsp
│       │       │   ├── floor.jsp
│       │       │   ├── nearby.jsp
│       │       │   └── amenity.jsp
│       │       ├── residence/
│       │       │   ├── typemap.jsp
│       │       │   └── floorplan.jsp
│       │       ├── support/
│       │       │   ├── notice-list.jsp
│       │       │   ├── notice-detail.jsp
│       │       │   ├── contact.jsp
│       │       │   ├── contact-result.jsp
│       │       │   ├── qna-list.jsp
│       │       │   └── qna-detail.jsp
│       │       └── privacy/
│       │           └── privacy.jsp
│       └── resources/
│           ├── css/
│           │   ├── style.css
│           │   ├── responsive.css
│           │   └── pages/
│           ├── js/
│           │   ├── main.js
│           │   ├── contact.js
│           │   ├── gallery.js
│           │   └── floorplan.js
│           └── images/
│               ├── logo/
│               ├── intro/
│               ├── signature/
│               ├── residence/
│               └── hero/
├── pom.xml
└── README.md
```

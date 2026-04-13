# Application Design - 필그림시니어랜드 홈페이지

## 설계 개요

| 항목 | 결정 사항 |
|------|-----------|
| 아키텍처 | MPA (Multi Page Application) |
| 백엔드 | JSP 3.0 + Servlet 5.0 (Jakarta EE) |
| 패키지 구조 | 레이어별 (controller / service / dao / model / util) |
| DB | MariaDB 10.x |
| 호스팅 | Cafe24 JSP 호스팅 (Tomcat 10.0.x / JDK 11) |
| 문의 처리 | DB 저장 + 이메일 알림 |
| 뉴스 관리 | JSP 파일 직접 작성 (정적) |

---

## 컴포넌트 구성

### 프론트엔드 (JSP 페이지)

| 컴포넌트 | URL | 주요 파일 |
|----------|-----|-----------|
| 공통 레이아웃 | - | header.jsp, footer.jsp, head.jsp |
| 홈 | `/` | home/index.jsp |
| 소개 - 인사말 | `/intro/greeting` | intro/greeting.jsp |
| 소개 - 브랜드 소개 | `/intro/brand` | intro/brand.jsp |
| 소개 - 비전 | `/intro/vision` | intro/vision.jsp |
| 사업정보 - 사업개요 | `/business/overview` | business/overview.jsp |
| 사업정보 - 사업지 소개 | `/business/site` | business/site.jsp |
| 시그니처 - 프리미엄 | `/signature/premium` | signature/premium.jsp |
| 시그니처 - 커뮤니티 | `/signature/community` | signature/community.jsp |
| 시그니처 - 시설 계획 | `/signature/plan` | signature/plan.jsp |
| 시그니처 - 층별 안내 | `/signature/floor` | signature/floor.jsp |
| 시그니처 - 주변 시설 | `/signature/nearby` | signature/nearby.jsp |
| 시그니처 - 편의시설 | `/signature/amenity` | signature/amenity.jsp |
| 주거공간 - 타입별 위치도 | `/residence/typemap` | residence/typemap.jsp |
| 주거공간 - 평면소개 | `/residence/floorplan` | residence/floorplan.jsp |
| 고객센터 - 공지사항 | `/support/notice` | support/notice-list.jsp |
| 고객센터 - 온라인 문의 | `/support/contact` | support/contact.jsp |
| 고객센터 - Q&A | `/support/qna` | support/qna-list.jsp |
| 개인정보처리방침 | `/privacy` | privacy/privacy.jsp |

### 백엔드 (Java)

| 레이어 | 클래스 | 역할 |
|--------|--------|------|
| Controller | HomeController | 홈 요청 처리 |
| Controller | PageController | 정적 페이지 라우팅 (intro/business/signature/residence) |
| Controller | SupportController | 공지사항/Q&A 조회 |
| Controller | ContactController | 온라인 문의 폼 처리 |
| Service | NoticeService | 공지사항 비즈니스 로직 |
| Service | QnaService | Q&A 비즈니스 로직 |
| Service | ContactService | 문의 처리 오케스트레이션 |
| Service | RecaptchaService | reCAPTCHA 검증 |
| DAO | NoticeDao | 공지사항 DB 접근 |
| DAO | QnaDao | Q&A DB 접근 |
| DAO | ContactDao | 문의 DB 저장 |
| Model | NoticeVO, QnaVO, ContactVO | 데이터 전달 객체 |
| Util | ValidationUtil | 입력값 검증/XSS 방지 |
| Util | EmailUtil | 이메일 발송 |
| Util | DBConnectionPool | DB 커넥션 관리 |

---

## 핵심 설계 결정

### 1. MPA 선택 이유
- Cafe24 JSP 호스팅 환경에 최적
- SEO 친화적 (각 페이지 독립 URL)
- 시니어 사용자 고려 - 명확한 페이지 구분
- 빌드 도구 없이 직접 배포 가능

### 2. 문의 폼 처리 흐름
```
입력 → 클라이언트 검증(JS) → reCAPTCHA → 서버 검증 → DB 저장 → 이메일 발송 → 결과 페이지
```
- 이메일 발송 실패는 비차단 (DB 저장 우선)
- CSRF 토큰으로 폼 위조 방지

### 3. 보안 레이어
- 입력값: ValidationUtil (XSS sanitize, 길이 검증)
- 봇 방지: reCAPTCHA v3 (서버 사이드 검증)
- DB: PreparedStatement (SQL Injection 방지)
- 전송: HTTPS (Cafe24 SSL)
- 헤더: web.xml Filter로 보안 헤더 설정

---

## 상세 문서 참조

- 컴포넌트 상세: `components.md`
- 메서드 시그니처: `component-methods.md`
- 서비스 흐름: `services.md`
- 의존성 및 디렉토리 구조: `component-dependency.md`

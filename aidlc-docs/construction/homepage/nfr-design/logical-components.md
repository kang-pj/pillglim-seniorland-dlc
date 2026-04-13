# 논리적 컴포넌트 (Logical Components)

## 추가 컴포넌트 (NFR 설계로 도출)

기존 Application Design의 컴포넌트에 NFR 요구사항을 반영하여 아래 컴포넌트가 추가됩니다.

---

### LC-01: SecurityHeaderFilter
- **패키지**: `com.pilgrimseniorland.filter`
- **역할**: 모든 HTTP 응답에 보안 헤더 자동 추가
- **적용 범위**: `/*` (전체 URL)
- **추가 헤더**: X-Content-Type-Options, X-Frame-Options, X-XSS-Protection, CSP, Referrer-Policy

### LC-02: AdminAuthFilter
- **패키지**: `com.pilgrimseniorland.filter`
- **역할**: `/admin/*` 경로 접근 시 관리자 세션 유효성 검증
- **적용 범위**: `/admin/*`
- **미인증 시**: `/admin/login` 리다이렉트

### LC-03: AppConfig
- **패키지**: `com.pilgrimseniorland.util`
- **역할**: `application.properties` 로드 및 설정값 제공
- **초기화**: `ServletContextListener`에서 앱 시작 시 1회 로드
- **주요 메서드**:
  ```java
  String get(String key)           // 설정값 조회
  String get(String key, String defaultValue)
  ```

### LC-04: DBConnectionPool
- **패키지**: `com.pilgrimseniorland.util`
- **역할**: DBCP2 기반 DB 커넥션 풀 관리
- **설정**: min=5, max=20, validationQuery="SELECT 1"
- **주요 메서드**:
  ```java
  Connection getConnection()       // 커넥션 획득
  void close(Connection conn, ...)  // 커넥션 반환
  ```

### LC-05: AdminService + AdminDao
- **패키지**: `com.pilgrimseniorland.service`, `com.pilgrimseniorland.dao`
- **역할**: 관리자 인증 처리
- **주요 메서드**:
  ```java
  // AdminService
  AdminVO authenticate(String username, String password)
  // AdminDao
  AdminVO findByUsername(String username)
  ```

### LC-06: AdminController 그룹
- **패키지**: `com.pilgrimseniorland.controller.admin`
- **역할**: 관리자 기능 처리 (AdminAuthFilter 보호 하에 동작)
- **클래스**:
  - `AdminLoginController` - 로그인/로그아웃
  - `AdminDashboardController` - 대시보드
  - `AdminNoticeController` - 공지사항 CRUD
  - `AdminQnaController` - Q&A 답변
  - `AdminContactController` - 문의 목록 조회

---

## 전체 컴포넌트 맵 (업데이트)

```
[요청]
  │
  ├─ SecurityHeaderFilter (모든 요청)
  │
  ├─ AdminAuthFilter (/admin/* 요청)
  │
  ├─ [공개 페이지]
  │   ├─ HomeController → NoticeService → NoticeDao
  │   ├─ PageController → JSP forward
  │   ├─ SupportController → NoticeService/QnaService → DAO
  │   └─ ContactController → ValidationUtil
  │                        → RecaptchaService → Google API
  │                        → ContactDao → MariaDB
  │                        → EmailUtil → SMTP
  │
  └─ [관리자 페이지 /admin/*]
      ├─ AdminLoginController → AdminService → AdminDao → MariaDB
      ├─ AdminNoticeController → NoticeService → NoticeDao
      ├─ AdminQnaController → QnaService → QnaDao
      └─ AdminContactController → ContactDao

[공통 인프라]
  ├─ AppConfig (application.properties 로드)
  ├─ DBConnectionPool (DBCP2)
  └─ ValidationUtil / EmailUtil
```

---

## web.xml 필터 등록 순서

```xml
<!-- 1. 보안 헤더 (가장 먼저) -->
<filter>SecurityHeaderFilter</filter>
<filter-mapping>/*</filter-mapping>

<!-- 2. 관리자 인증 -->
<filter>AdminAuthFilter</filter>
<filter-mapping>/admin/*</filter-mapping>

<!-- 세션 타임아웃 -->
<session-config>
    <session-timeout>30</session-timeout>
</session-config>

<!-- 커스텀 오류 페이지 -->
<error-page>404 → /WEB-INF/jsp/error/404.jsp</error-page>
<error-page>500 → /WEB-INF/jsp/error/500.jsp</error-page>
```

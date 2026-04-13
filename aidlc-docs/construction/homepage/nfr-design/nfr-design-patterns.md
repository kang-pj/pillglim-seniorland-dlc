# NFR 설계 패턴 (NFR Design Patterns)

## 1. 보안 패턴

### 1.1 입력값 검증 패턴 (Input Validation)
모든 사용자 입력은 서버 사이드에서 반드시 검증합니다.

```
요청 수신
  → ValidationUtil.sanitizeInput()   // HTML 특수문자 이스케이프 (XSS 방지)
  → ValidationUtil.isValidLength()   // 최대 길이 초과 거부
  → ValidationUtil.isValidPhone()    // 전화번호 형식 검증 (문의 폼)
  → 비즈니스 로직 처리
```

**XSS 이스케이프 대상 문자:**
```
& → &amp;   < → &lt;   > → &gt;
" → &quot;  ' → &#x27;
```

### 1.2 CSRF 토큰 패턴
문의 폼, Q&A 작성 폼 등 POST 요청에 적용합니다.

```
GET 폼 페이지 요청
  → 서버: UUID 토큰 생성 → HttpSession에 저장
  → JSP: hidden input에 토큰 삽입

POST 폼 제출
  → 서버: 요청 파라미터 토큰 vs 세션 토큰 비교
  → 불일치 시 403 응답
  → 일치 시 처리 후 세션 토큰 갱신
```

### 1.3 보안 헤더 필터 패턴
`SecurityHeaderFilter`가 모든 응답에 보안 헤더를 추가합니다.

```java
// web.xml에 필터 등록 (모든 URL 패턴 적용)
response.setHeader("X-Content-Type-Options", "nosniff");
response.setHeader("X-Frame-Options", "SAMEORIGIN");
response.setHeader("X-XSS-Protection", "1; mode=block");
response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
response.setHeader("Content-Security-Policy",
    "default-src 'self'; " +
    "script-src 'self' https://maps.googleapis.com https://www.google.com https://www.gstatic.com https://cdn.jsdelivr.net; " +
    "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; " +
    "font-src 'self' https://fonts.gstatic.com; " +
    "img-src 'self' data: https://maps.gstatic.com https://maps.googleapis.com; " +
    "frame-src https://www.google.com;");
```

### 1.4 관리자 인증 필터 패턴
`AdminAuthFilter`가 `/admin/*` 경로를 보호합니다.

```
요청 → AdminAuthFilter
  → session.getAttribute("admin") 확인
  → null이면 → /admin/login redirect
  → 존재하면 → 요청 통과
```

### 1.5 SQL Injection 방지 패턴
모든 DB 쿼리는 PreparedStatement만 사용합니다.

```java
// 올바른 방식 (항상 이 방식 사용)
String sql = "SELECT * FROM notice WHERE id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, id);

// 금지 방식 (절대 사용 금지)
// String sql = "SELECT * FROM notice WHERE id = " + id;
```

---

## 2. 성능 패턴

### 2.1 이미지 최적화 패턴
- 모든 이미지는 WebP 포맷으로 변환하여 `/resources/images/` 에 저장
- `<img>` 태그에 `loading="lazy"` 속성 적용 (Hero 이미지 제외)
- Hero 이미지는 `loading="eager"` + `fetchpriority="high"`

```html
<!-- Hero 이미지 (즉시 로드) -->
<img src="/resources/images/hero/main.webp" 
     alt="필그림시니어랜드" 
     loading="eager" fetchpriority="high">

<!-- 일반 이미지 (지연 로드) -->
<img src="/resources/images/signature/facility1.webp" 
     alt="시설 사진" 
     loading="lazy">
```

### 2.2 정적 리소스 캐싱 패턴
`web.xml`에 정적 리소스 캐시 헤더를 설정합니다.

```xml
<!-- web.xml - 정적 리소스 캐시 (1주일) -->
<filter>
    <filter-name>CacheControlFilter</filter-name>
    ...
    <!-- Cache-Control: public, max-age=604800 -->
</filter>
```

### 2.3 DB 커넥션 풀 패턴
DBCP2를 사용하여 커넥션을 재사용합니다.

```
애플리케이션 시작 시 → DBConnectionPool 초기화 (min: 5, max: 20)
요청 → DBConnectionPool.getConnection()
처리 완료 → connection.close() (풀에 반환)
```

---

## 3. 오류 처리 패턴

### 3.1 커스텀 오류 페이지
```xml
<!-- web.xml -->
<error-page>
    <error-code>404</error-code>
    <location>/WEB-INF/jsp/error/404.jsp</location>
</error-page>
<error-page>
    <error-code>500</error-code>
    <location>/WEB-INF/jsp/error/500.jsp</location>
</error-page>
```

### 3.2 이메일 발송 비차단 패턴
이메일 발송 실패가 문의 저장을 막지 않습니다.

```java
// ContactService
ContactDao.insert(contact);  // DB 저장 (필수)
try {
    EmailUtil.sendNotification(contact, recipientEmail);  // 이메일 (선택)
} catch (Exception e) {
    logger.warn("이메일 발송 실패 (문의 저장은 완료): {}", e.getMessage());
    // 예외를 삼키고 계속 진행
}
```

### 3.3 스택 트레이스 미노출 패턴
운영 환경에서 상세 오류 정보를 사용자에게 노출하지 않습니다.

```java
// GlobalExceptionHandler 또는 각 Controller
} catch (Exception e) {
    logger.error("처리 중 오류 발생", e);  // 서버 로그에만 기록
    req.setAttribute("errorMessage", "처리 중 오류가 발생했습니다.");
    req.getRequestDispatcher("/WEB-INF/jsp/error/500.jsp").forward(req, res);
}
```

---

## 4. 반응형 패턴

### 4.1 모바일 퍼스트 CSS 전략
```css
/* 기본: 모바일 (320px~) */
.nav-menu { display: none; }
.hamburger { display: block; }

/* 태블릿 (768px~) */
@media (min-width: 768px) {
    .nav-menu { display: flex; }
    .hamburger { display: none; }
}

/* 데스크탑 (1280px~) */
@media (min-width: 1280px) {
    .container { max-width: 1200px; margin: 0 auto; }
}
```

### 4.2 드롭다운 네비게이션 패턴
- 데스크탑: hover 시 서브메뉴 표시
- 모바일: 햄버거 클릭 → 전체 메뉴 슬라이드 인

---

## 5. 설정 외부화 패턴

`application.properties` 파일을 `WEB-INF/` 하위에 배치하고 `AppConfig` 유틸리티로 로드합니다.

```properties
# DB
db.host=localhost
db.port=3306
db.name=pilgrimseniorland
db.user=dbuser
db.password=dbpassword

# Email
mail.smtp.host=smtp.cafe24.com
mail.smtp.port=465
mail.smtp.user=admin@pilgrimseniorland.com
mail.smtp.password=mailpassword
mail.recipient=contact@pilgrimseniorland.com

# reCAPTCHA
recaptcha.site.key=YOUR_SITE_KEY
recaptcha.secret.key=YOUR_SECRET_KEY
recaptcha.min.score=0.5

# Google Maps
googlemaps.api.key=YOUR_API_KEY
```
